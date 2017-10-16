package com.renrenlab.cms.common.constant;

/**
 * 微信服务号涉及到的所有接口常量
 * @author Renrenlab
 *
 */
public class WeixinFinalValue {
	
    /** 
     * 返回消息类型：文本 
     */  
    public static final String RESP_MESSAGE_TYPE_TEXT = "text";  
  
    /** 
     * 返回消息类型：音乐 
     */  
    public static final String RESP_MESSAGE_TYPE_MUSIC = "music";  
  
    /** 
     * 返回消息类型：图文 
     */  
    public static final String RESP_MESSAGE_TYPE_NEWS = "news";  
  
    /** 
     * 请求消息类型：文本 
     */  
    public static final String REQ_MESSAGE_TYPE_TEXT = "text";  
  
    /** 
     * 请求消息类型：图片 
     */  
    public static final String REQ_MESSAGE_TYPE_IMAGE = "image";  
  
    /** 
     * 请求消息类型：链接 
     */  
    public static final String REQ_MESSAGE_TYPE_LINK = "link";  
  
    /** 
     * 请求消息类型：地理位置 
     */  
    public static final String REQ_MESSAGE_TYPE_LOCATION = "location";  
  
    /** 
     * 请求消息类型：音频 
     */  
    public static final String REQ_MESSAGE_TYPE_VOICE = "voice";  
  
    /** 
     * 请求消息类型：推送 
     */  
    public static final String REQ_MESSAGE_TYPE_EVENT = "event";  
  
    /** 
     * 事件类型：subscribe(订阅) 
     */  
    public static final String EVENT_TYPE_SUBSCRIBE = "subscribe";  
  
    /** 
     * 事件类型：unsubscribe(取消订阅) 
     */  
    public static final String EVENT_TYPE_UNSUBSCRIBE = "unsubscribe";  
    /** 
     * 事件类型：扫码推送
     */  
    public static final String EVENT_TYPE_SCAN = "SCAN";  
  
    /** 
     * 事件类型：CLICK(自定义菜单点击事件) 
     */  
    public static final String EVENT_TYPE_CLICK = "CLICK";  
    
    /** 
     * 事件类型：VIEW(自定义菜单链接) 
     */  
    public static final String EVENT_TYPE_VIEW = "VIEW";  
    /**
	 * 获取access_token的链接
	 */
	public final static String ACCESS_TOKEN_URL = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET";
	/**
	 * 添加菜单
	 */
	public final static String MENU_ADD = "https://api.weixin.qq.com/cgi-bin/menu/create?access_token=ACCESS_TOKEN";
	/**
	 * 查询菜单
	 */
	public final static String MENU_QUERY = "https://api.weixin.qq.com/cgi-bin/menu/get?access_token=ACCESS_TOKEN";
	
	public final static String POST_MEDIA="https://api.weixin.qq.com/cgi-bin/media/upload?access_token=ACCESS_TOKEN&type=TYPE";
	public final static String GET_MEDIA="https://api.weixin.qq.com/cgi-bin/media/get?access_token=ACCESS_TOKEN&media_id=MEDIA_ID";
	
	public final static String SEND_TEMPLATE_MSG = "https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=ACCESS_TOKEN";
	
	public final static String USER_QUERY = "https://api.weixin.qq.com/cgi-bin/user/info?access_token=ACCESS_TOKEN&openid=OPENID&lang=zh_CN";
	
	public final static String AUTH_URL = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=APPID&redirect_uri=REDIRECT_URI&response_type=code&scope=SCOPE&state=STATE#wechat_redirect";
	public final static String AUTH_GET_OID = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code";

	public final static String ADD_GROUP = "https://api.weixin.qq.com/cgi-bin/groups/create?access_token=ACCESS_TOKEN";
	public final static String QUERY_ALL_GROUP = "https://api.weixin.qq.com/cgi-bin/groups/get?access_token=ACCESS_TOKEN";
	public final static String QUERY_USER_GROUP = "https://api.weixin.qq.com/cgi-bin/groups/getid?access_token=ACCESS_TOKEN";
	public final static String UPDATE_GROUP_NAME = "https://api.weixin.qq.com/cgi-bin/groups/update?access_token=ACCESS_TOKEN";
	public final static String MOVE_USER_GROUP = "https://api.weixin.qq.com/cgi-bin/groups/members/update?access_token=ACCESS_TOKEN";
	public final static String MOVE_USERS_GROUP = "https://api.weixin.qq.com/cgi-bin/groups/members/batchupdate?access_token=ACCESS_TOKEN";
	public final static String DELETE_GROUP = "https://api.weixin.qq.com/cgi-bin/groups/delete?access_token=ACCESS_TOKEN";
	
	public final static String QR_GET = "https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token=ACCESS_TOKEN";

	public final static String KF_ADD = "https://api.weixin.qq.com/customservice/kfaccount/add?access_token=ACCESS_TOKEN";
	

	public final static String ADD_MESSAGE = "https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token=ACCESS_TOKEN";

	/**
	 * 群发消息地址
	 */
	public final static String ADD_MESSAGE_FOR_ALL = "https://api.weixin.qq.com/cgi-bin/message/mass/send?access_token=ACCESS_TOKEN";


	// 烧瓶快修公众号
//	/**
//	 * 订单创建成功模版
//	 */
//	public final static String ORDERTEMPLATEID = "zkAnbSTBpD5_omUeP4zPLxKmQRQ4NOv5ryLw-ELu_CQ";
//	/**
//	 * 服务评价通知模板
//	 */
//	public final static String ORDERSTATETEMPLATEID = "Z3kMRDL3Et5wTz9LNLsf_yQrdn5QqiH6igxX5ylSvCk";


	// 人人实验公众号
	/**
	 * 订单创建成功模板
	 */
	public final static String ORDERTEMPLATEID = "1zpS1UTt2zhGDt4eiTSh-o5oES_IcCROeYJJ3T9MqP8";
	/**
	 * 服务评价通知模板
	 */
	public final static String ORDERSTATETEMPLATEID = "972TIheBuLLJ2pAdxbuoN4DbMyMtq1fjkwN1DhGZBhQ";

	/**
	 * 微信40001错误
	 */
	public final static int INVALIDACCESSTOKEN = 40001;

	public static final int FULLACCESSTOKEN = 48006;
}
