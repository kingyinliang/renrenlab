package com.renrenlab.cms.wechat.servlet;

import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

@SuppressWarnings({ "serial", "restriction" })
public class VerifyCodeServlet extends HttpServlet {
	private static VerifyCodeServlet instance;

	// 验证码长度
	private final int CODE_LENGTH = 4;

	// 随机字符串范围
	private static char[] captchars = new char[] {'a','b','c','d','e','f','g','h','j','k','l','m','n','p','q','r','s','t','u','v','w','x','y','z','2', '3', '4',
			'5', '6', '7', '8', '9' }; 
	private Random rand = new Random();

	// 选转标志，验证码旋转
	private boolean ROTATE_FLAG = true;
	// 高度，设置旋转后，高度设为30，否则设置成25，效果好一些
	private int Height = 40;
	private int width = 90;
	private StringBuffer code = new StringBuffer("");

	static{
	        System.setProperty("java.awt.headless", "true");
	}
	
	public VerifyCodeServlet() {
		//
	}

	public static VerifyCodeServlet getInstance() {
		if (instance == null)
			instance = new VerifyCodeServlet();
		return instance;
	}

	/**
	 * 生成随机颜色
	 * 
	 * @param ll
	 *            产生颜色值下限(lower limit)
	 * @param ul
	 *            产生颜色值上限(upper limit)
	 * @return 生成的随机颜色对象
	 */
	private Color getRandColor(int ll, int ul) {
		if (ll > 255)
			ll = 255;
		if (ll < 1)
			ll = 1;
		if (ul > 255)
			ul = 255;
		if (ul < 1)
			ul = 1;
		if (ul == ll)
			ul = ll + 1;
		int r = rand.nextInt(ul - ll) + ll;
		int g = rand.nextInt(ul - ll) + ll;
		int b = rand.nextInt(ul - ll) + ll;
		Color color = new Color(r, g, b);
		return color;
	}

	/**
	 * 生成指定字符串的图像数据
	 * 
	 * @param verifyCode
	 *            即将被打印的随机字符串
	 * @return 生成的图像数据
	 */
	private BufferedImage getImage() {
		this.code.setLength(0);
		BufferedImage image = new BufferedImage(width, Height,
				BufferedImage.TYPE_INT_RGB);

		// 获取图形上下文
		Graphics graphics = image.getGraphics();
		Graphics2D g2 = (Graphics2D) graphics;
		// 背景顔色
		g2.setColor(this.getRandColor(200, 250));
		g2.fillRect(0, 0, width, Height);
		// 边框
		g2.setColor(getRandColor(0, 20));
		g2.drawRect(0, 0, width - 1, Height - 1);
		// 干扰点
		for (int i = 0; i < 30; i++) {
			g2.setColor(new Color(rand.nextInt(255), rand.nextInt(255), rand
					.nextInt(255)));
			int x0 = rand.nextInt(width);
			int y0 = rand.nextInt(Height);
			g2.drawLine(x0, y0, x0, y0);
			g2.drawLine(x0 + 1, y0 + 1, x0 + 1, y0 + 1);
			g2.drawLine(x0 + 1, y0, x0 + 1, y0);
			g2.drawLine(x0, y0 + 1, x0, y0 + 1);

		}
		double oldrot = 0;
		// 生成随机码
		for (int i = 0; i < CODE_LENGTH; i++) {

			g2.setFont(new Font("Times New Roman", Font.BOLD, 32));
			double rot = -0.25 + Math.abs(Math.toRadians(rand.nextInt(25)));

			// 如果设置选装标志，则旋转文字
			if (ROTATE_FLAG) {
				g2.rotate(-oldrot, 15, 27);
				oldrot = rot;
				int x0 = 10 * i + 5 + rand.nextInt(5);
				g2.rotate(rot, x0, 27);
			}
			float stroke = Math.abs(rand.nextFloat() % 30);
			g2.setStroke(new BasicStroke(stroke));
			String temp = String.valueOf(captchars[rand.nextInt(captchars.length)]);
			code.append(temp);
			g2.setColor(new Color(rand.nextInt(255), rand.nextInt(255), rand
					.nextInt(255)));
			g2.setColor(getRandColor(1, 100));
			g2.drawString(temp, 19 * i + 6, 35);
		}
		// 5条干扰线
		for (int i = 0; i < 5; i++) {
			g2.setColor(new Color(rand.nextInt(255), rand.nextInt(255), rand
					.nextInt(255)));
			g2.drawLine(rand.nextInt(width), rand.nextInt(Height), rand
					.nextInt(width), rand.nextInt(Height));
		}

		// 图像生效
		g2.dispose();
		return image;
	}

	/**
	 * 将验证码的图像输出
	 * 
	 * @param request
	 *            用户的请求对象
	 * @param response
	 *            用户的响应对象
	 */
	public void printImage(HttpServletRequest request,
			HttpServletResponse response) {
		// 将ContentType设为"image/jpeg"，让浏览器识别图像格式。
		response.setContentType("image/jpg");
		// 设置页面不缓存
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 2000);

		// 获得验证码的图像数据
		BufferedImage bi = this.getImage();
		// 把验证码存入session
		HttpSession session = request.getSession();
		session.setAttribute("valid", code.toString());
		ServletOutputStream outStream = null;
		try {
			// 获得Servlet输出流
			outStream = response.getOutputStream();
			// 创建可用来将图像数据编码为JPEG数据流的编码器
			JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(outStream);
			// 将图像数据进行编码
			encoder.encode(bi);
			// 强行将缓冲区的内容输入到页面
			outStream.flush();

		} catch (IOException ex) {
			ex.printStackTrace();
		} finally {
			if (outStream != null) {
				try {
					// 关闭输出流
					outStream.close();
					outStream=null;
				} catch (IOException iex) {
					iex.printStackTrace();
					outStream=null;
				}
			}
		}
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) {
		printImage(request, response);
	}

}
