package com.renrenlab.rlab.common.util;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.entity.mime.content.FileBody;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.impl.conn.PoolingHttpClientConnectionManager;
import org.json.JSONException;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.*;

public class HttpClientUtils {

    private static final Logger logger = LoggerFactory.getLogger(HttpClientUtils.class);

    // This object is used for sending the request
    // protected HttpClient client = new DefaultHttpClient();
//    private static HttpClient client = HttpClientBuilder.create().build();
    private static CloseableHttpClient client = getHttpClient();

    public static CloseableHttpClient getHttpClient() {
        if (client == null) {
            synchronized (CloseableHttpClient.class) {
                PoolingHttpClientConnectionManager cm = new PoolingHttpClientConnectionManager();
                // 设置最大httpclient pool最大连接数
                cm.setMaxTotal(10);
                client = HttpClients
                        .custom()
                        .setDefaultRequestConfig(getDefaultRequestConfig())
                        .setConnectionManager(cm)
                        .build();
            }
        }
        return client;
    }

    private static RequestConfig getDefaultRequestConfig() {
        RequestConfig requestConfig = RequestConfig
                .custom()
                /*
                 * 从连接池中获取连接的超时时间，假设：连接池中已经使用的连接数等于setMaxTotal，新来的线程在等待1*1000
                 * 后超时，错误内容：org.apache.http.conn.ConnectionPoolTimeoutException: Timeout waiting for connection from pool
                 */
                .setConnectionRequestTimeout(1 * 1000)
                /*
                 * 这定义了通过网络与服务器建立连接的超时时间。
                 * Httpclient包中通过一个异步线程去创建与服务器的socket连接，这就是该socket连接的超时时间，
                 * 此处设置为2秒。假设：访问一个IP，192.168.10.100，这个IP不存在或者响应太慢，那么将会返回
                 * java.net.SocketTimeoutException: connect timed out
                 */
                .setConnectTimeout(10 * 1000)
                /*
                 * 指的是连接上一个url，获取response的返回等待时间，假设：url程序中存在阻塞、或者response
                 * 返回的文件内容太大，在指定的时间内没有读完，则出现
                 * java.net.SocketTimeoutException: Read timed out
                 */
                .setSocketTimeout(30 * 1000)
                .build();
        return requestConfig;
    }

    // The user agent
    private static final String USER_AGENT = "Mozilla/5.0";

    public static String getSend(String url) {
        logger.info(String.format("-------httpclient send get request start------\\nrequest url=%s", url));
        HttpGet get = new HttpGet(url);
        get.setHeader("User-Agent", USER_AGENT);
        // Send the get request and get the response
        StringBuffer result = null;
        CloseableHttpResponse response = null;
        try {
            response = client.execute(get);
            int status = response.getStatusLine().getStatusCode();
            logger.info(String.format("response status code=%s", status));
            result = new StringBuffer();
            if (status == 200) {
                BufferedReader rd = new BufferedReader(new InputStreamReader(response.getEntity().getContent(), "utf-8"));
                String line = "";
                while ((line = rd.readLine()) != null) {
                    result.append(line);
                }
                rd.close();
            } else {
                get.abort();
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                response.close();
            } catch (IOException e) {
                logger.error("HttpClientUtils getSend 报错", e);
            }
        }
        logger.info(String.format("get request completed! response data=%s", result.toString()));
        return result.toString();
    }

    public static String doPost(String url, String stringEntity, String mimeType) {
        HttpPost post = new HttpPost(url);
        post.setHeader("User-Agent", USER_AGENT);
        post.setHeader("Accept", "application/json");
        ContentType contentType = null;
        switch (mimeType) {
            case "JSON":
                contentType = ContentType.APPLICATION_JSON;
                break;
            case "FILE":
                contentType = ContentType.MULTIPART_FORM_DATA;
                break;
            case "urlencoded":
                contentType = ContentType.create("application/x-www-form-urlencoded", "UTF-8");
                break;
            default:
                contentType = ContentType.APPLICATION_FORM_URLENCODED;
        }
        StringEntity entity = new StringEntity(stringEntity, contentType);
        post.setEntity(entity);
        // Send the post request and get the response
        CloseableHttpResponse response = null;
        StringBuffer result = new StringBuffer();
        JSONObject json = new JSONObject();
        try {
            response = client.execute(post);
            int status = response.getStatusLine().getStatusCode();
            if (status == 200) {
                BufferedReader rd = new BufferedReader(new InputStreamReader(response.getEntity().getContent(), "utf-8"));
                String line = "";
                while ((line = rd.readLine()) != null) {
                    result.append(line);
                }
                rd.close();
            } else {
                post.abort();
            }
            json.put("status", status);
            json.put("data", result.toString());
        } catch (IOException e) {
            logger.error("HttpClientUtils doPost 方法报错", e);
        } catch (JSONException e) {
            logger.error("HttpClientUtils doPost json.put方法报错", e);
        } finally {
            try {
                response.close();
            } catch (IOException e) {
                logger.error("HttpClientUtils doPost response.close()方法报错", e);
            }
        }
        return result.toString();
    }

    public static String upload(String localFile, String url) throws Exception, IOException {
        HttpResponse response = null;
        client = HttpClients.createDefault();

        // 把一个普通参数和文件上传给下面这个地址 是一个servlet
        HttpPost httpPost = new HttpPost(url);

        // 把文件转换成流对象FileBody
        FileBody bin = new FileBody(new File(localFile));
        // StringBody userName = new StringBody("Scott",ContentType.create("text/plain", RlabConsts.UTF_8));
        // StringBody password = new StringBody("123456",ContentType.create("text/plain", RlabConsts.UTF_8));

        HttpEntity reqEntity = MultipartEntityBuilder.create().addPart("file", bin).build();
        // 相当于<input type="file" name="file"/>
        httpPost.setEntity(reqEntity);
        // 发起请求 并返回请求的响应
        response = client.execute(httpPost);
        int status = response.getStatusLine().getStatusCode();
        StringBuffer result = new StringBuffer();
        if (status == 200) {
            BufferedReader rd = new BufferedReader(new InputStreamReader(response.getEntity().getContent(), "utf-8"));

            String line = "";
            while ((line = rd.readLine()) != null) {
                result.append(line);
            }
            rd.close();
        } else {
            httpPost.abort();
        }
        return result.toString();
    }

    public static String postSend(String url, String stringEntity) throws Exception {
        logger.info(String.format("-------httpclient send post request start------\\nrequest url=%s,send entity=%s", url, stringEntity));
        HttpPost post = new HttpPost(url);
        post.setHeader("User-Agent", USER_AGENT);
        StringEntity se = new StringEntity(stringEntity, ContentType.APPLICATION_JSON);
        post.setEntity(se);
        // Send the post request and get the response
        HttpResponse response = client.execute(post);
        int status = response.getStatusLine().getStatusCode();
        System.out.println("Response Code : " + status);
        StringBuffer result = new StringBuffer();
        if (status == 200) {
            BufferedReader rd = new BufferedReader(new InputStreamReader(response.getEntity().getContent(), "utf-8"));

            String line = "";
            while ((line = rd.readLine()) != null) {
                result.append(line);
            }
            rd.close();
        }
        logger.info(String.format("post request completed! response data=%s", result.toString()));
        return result.toString();
    }

    public static String doGet(String url) throws Exception, IOException {
        HttpGet get = new HttpGet(url);
        get.setHeader("User-Agent", USER_AGENT);
        HttpResponse response = client.execute(get);
        int status = response.getStatusLine().getStatusCode();
        System.out.println("Response Code : " + status);
        StringBuffer result = new StringBuffer();
        if (status == 200) {
            BufferedReader rd = new BufferedReader(new InputStreamReader(response.getEntity().getContent(), org.apache.http.Consts.UTF_8));
            String line = "";
            while ((line = rd.readLine()) != null) {
                result.append(line);
            }
            rd.close();
        } else {
            get.abort();
        }
        JSONObject json = new JSONObject();
        json.put("status", status);
        json.put("data", result.toString());
        return result.toString();
    }

    public void downLoad(String remoteFileName, String localFileName, String url) {
//        DefaultHttpClient httpClient = new DefaultHttpClient();
        OutputStream out = null;
        InputStream in = null;
        try {
            HttpGet httpGet = new HttpGet(url);
//            httpGet.addHeader("userName", userName);
//            httpGet.addHeader("passwd", passwd);
            httpGet.addHeader("fileName", remoteFileName);

            HttpResponse httpResponse = client.execute(httpGet);
            HttpEntity entity = httpResponse.getEntity();
            in = entity.getContent();

            long length = entity.getContentLength();
            if (length <= 0) {
                System.out.println("下载文件不存在！");
                return;
            }

            System.out.println("The response value of token:" + httpResponse.getFirstHeader("token"));

            File file = new File(localFileName);
            if (!file.exists()) {
                file.createNewFile();
            }
            out = new FileOutputStream(file);
            byte[] buffer = new byte[4096];
            int readLength = 0;
            while ((readLength = in.read(buffer)) > 0) {
                byte[] bytes = new byte[readLength];
                System.arraycopy(buffer, 0, bytes, 0, readLength);
                out.write(bytes);
            }
            out.flush();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (in != null) {
                    in.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
            try {
                if (out != null) {
                    out.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

}
