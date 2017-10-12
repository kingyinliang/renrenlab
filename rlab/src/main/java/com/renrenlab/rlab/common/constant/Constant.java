package com.renrenlab.rlab.common.constant;

/**
 * 常量
 *
 * @author Renrenlab
 */
public class Constant {
    /**
     * 论文详情 name: 质谱仪 id: a_4189662 //论文id which: single_paper //数据类型
     */
    public static final String PAPERINFO = "http://kejso.com/Kejso1.0/servlet/PeopleMoreInfo";
    /**
     * 相关项目，咨询，论文等 参数：query:质谱仪 //查询词start:0//列表起始位置（每页10条）which: project //查询数据类型（主要包括：project、paper、webpages等）
     */
    public static final String RELATEDINFO = "http://kejso.com/Kejso1.0/servlet/FieldsMoreInfo";
    /**
     * 科搜搜索url 参数：query:质谱仪 //查询词 core:fields//(所查询板块)ret:json//(指定返回格式，默认为网页，若ret=json则返回json, 若ret=cache_only，则仅做缓存处理)
     */
    public static final String SEARCHURL = "http://kejso.com/Kejso1.0/servlet/SearchServlet";
    /**
     * 高级搜索2.0可能感兴趣的领域接口 参数:searchword:质谱仪 //查询词 thisType:field//查询板块
     */
    public static final String INTERESTURL = "http://47.93.86.15:32242/fieldinfo/recommendfield";
    /**
     * 高级搜索2.0相关领域接口(echarts) 参数:searchword:质谱仪 //查询词 thisType:field//查询板块
     */
    public static final String RELATEDFIELDTURL = "http://47.93.86.15:32242/fieldinfo/relatedfield";
    /**
     * 高级搜索2.0相关咨询接口 参数:searchword:质谱仪 //查询词 thisType:field//查询板块 start:0//查询页码(留空默认为0，每页10条)
     */
    public static final String RELATEDNEWSURL = "http://47.93.86.15:32242/fieldinfo/relatednews";
    /**
     * 高级搜索2.0论文项目信息接口 参数:searchword:质谱仪 //查询词 thisType:field//查询板块 pagenum:0//查询页码(留空默认为0，每页10条)
     * which: project//查询数据类型(主要包括：project/paper等)//留空默认返回全部数据
     */
    public static final String INFOURL = "http://47.93.86.15:32242/fieldinfo/relatedinfo";
    /**
     * 高级搜索2.0领域相关人物、机构排名接口 参数:searchword:质谱仪 //查询词 thisType:field//查询板块ret: cache-only//返回数据类型(主要包括:json/cache_only等)
     * //(缓存接口)cache-only不返回数据，做服务器端缓存
     */
    public static final String RANKURL = "http://47.93.86.15:32242/fieldinfo/rankinfo";
    /**
     * 高级搜索2.0论文详情接口 get请求 拼接参数:id
     * http://kejso.com/kejso_2/peopleinfo/paperinfo/{id}
     */
    public static final String PAPERINFOURL = "http://47.93.86.15:32242/peopleinfo/paperinfo/";

    /**
     * 新站同步注册用户到主站
     */
    public static final String OLDWEBURL = "http://www.renrenlab.com/api/user/dataShare";

    /**
     * 阿里云 图片路径(测试站)
     */
//   public static final String TESTPICURL = "http://renrenlab-test.oss-cn-shanghai.aliyuncs.com";
    public static final String TESTPICURL = "http://renrenlab.oss-cn-shanghai.aliyuncs.com";

    public static final String DEFAULT_INS_PIC = "http://www.renrenlab.com/rlab/common/common_img/default/ins_140X110.jpg";

    public static final String Z_INS_PIC_END_URL = "?x-oss-process=style/renrenlab140_110";

    public static final String INS_PIC_END_URL = "?x-oss-process=style/renrenlabpic140_110";

    /**
     * 图片上传路径
     */
    public static final String UPLOADIMG = TESTPICURL + "/image/";

    /**
     * 身份证照片路径
     */
    public static final String IDENIMG = TESTPICURL + "/identity/";

    /**
     * 机构LOGO照片路径
     */
    public static final String ORGIMG = TESTPICURL + "/orgimage/";

    public static final String XOSS = "?x-oss-process=style/renrenlabpic";

    public static final String XOSSCONG = "?x-oss-process=style/renrenlab";

    /**
     * 获取客户端地理位置接口
     */
    public static final String BAIDU_IP = "http://api.map.baidu.com/location/ip?ak=ZlEwMqIMtChz8MEj1mV6Tc6v&coor=bd09ll&ip=";

    /**
     * 微信获取code值接口
     */
    public static final String WX_OPEN_QRCONNECT = "https://open.weixin.qq.com/connect/qrconnect?appid=wxcfbe1711126dfd23&redirect_uri=http%3a%2f%2fwww.renrenlab.com%2frlab%2ffront%2fuser%2fwx%2fcallback&response_type=code&scope=snsapi_login&state=STATE#wechat_redirect";

    /**
     * 微信获取access_token接口
     */
    public static final String WX_OPEN_ACCESS_TOKEN = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=wxcfbe1711126dfd23&secret=22a3786375fafc5c3b77c023b1d6ebbc&code=CODE&grant_type=authorization_code";

    /**
     * 微信获取用户信息接口
     */
    public static final String WX_OPEN_USER_INFO = "https://api.weixin.qq.com/sns/userinfo?access_token=ACCESS_TOKEN&openid=OPENID";

    /*
     *  管理用户
     */
    public static final int USER_MANAGE = 1;

    /*
     * 客服用户
     */
    public static final int USER_SERVICE = 2;

    /*
     * 认证用户
     */
    public static final int USER_AUTH = 4;

    /**
     * 需求管理分组
     */
    public interface Requirement {
        /**
         * 审核通过or拒绝，短信通知申请人
         */
        String REQSTATEMODIFY = "【人人实验】尊敬的用户您好，您发布的微需求审核状态已更新，敬请登录人人实验官网www.renrenlab.com查看。如有疑问，欢迎拨打客服热线4001029559咨询。";
        /**
         * 需求还剩3天过期，则上午十点给用户发信息提醒
         */
        String WILLBEOUTDATE = "【人人实验】尊敬的用户您好，您发布的微需求将于3日后过期。若需求已解决，敬请登录人人实验官网www.renrenlab.com更新需求状态；若需求尚未解决，我们建议您登录官网设置延长有效期。如有疑问，欢迎拨打客服热线4001029559咨询。";
        /**
         * 需求已延长过一次有效期，还剩3天的时候仍然发短信给用户
         */
        String WILLBEOUTDATE2 = "【人人实验】尊敬的用户您好，您发布的微需求将于3日后过期。若需求已解决，敬请登录人人实验官网www.renrenlab.com更新需求状态。如有疑问，欢迎拨打客服热线4001029559咨询。";
    }

    public interface RolePermission {
        /**
         * 记录修改角色权限时间
         */
        String ROLE_KEY = "role_modify_time";
    }

}
