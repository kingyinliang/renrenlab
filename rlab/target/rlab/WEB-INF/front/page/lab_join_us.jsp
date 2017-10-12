<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>人人实验（renrenlab.com）官方网站-互联网+科技服务平台</title>
    <%--<jsp:include page="../template/shujike.jsp" flush="true"/>--%>
    <%@ include file="../../config/taglibs.jsp" %>

    <link rel="shortcut icon" href="${rlab}/front/imgs/favicon.png" type="image/x-icon">
    <!--jquery-->
    <script src="${rlab}/front/assets/jquery-1.12.4/jquery.js"></script>

    <!--my css-->
    <link rel="stylesheet" href="${rlab}/front/css/base.css?v_=20170905">
    <link rel="stylesheet" href="${rlab}/front/css/footpage.css?v_=20170905">

    <!--[if lt IE 8]>
    <link rel="stylesheet" href="${rlab}/front/fonts/ie7/ie7.css">
    <!--<![endif]-->

    <!--[if lt IE 9]>
    <script src="${rlab}/front/assets/html5shiv/html5shiv.min.js"></script>
    <script src="${rlab}/front/assets/respond/respond.min.js"></script>
    <style type="text/css">
        /*兼容右侧悬浮窗*/
        .rt_bar {
            right: 20px;
        }

        .header_content > .city_btn .dorpdow {
            border: 1px solid red;
        }
    </style>
    <![endif]-->

    <style type="text/css">
        .callus{
            padding: 69px 16px 0 0;
        }
        .leftext{
            font-size: 16px;
            color: #333333;
            line-height: 39px;
            float: left;
            width: 437px;
        }
        .leftext span{
            color: #999999;
        }
    </style>

    <script type="text/javascript">
        var isLtIE9 = false;
    </script>
    <!--[if lt IE 10]>
    <script type="text/javascript">
        isLtIE9 = true;
    </script>
    <![endif]-->

</head>
<body>
<div class="wrapper">
    <!--右侧公用模块-->
    <jsp:include page="../template/right_bar.jsp" ></jsp:include>
    <!--头部公用模块-->
    <jsp:include page="../template/header.jsp" ></jsp:include>


    <div id="content">
        <div class="main clearfix">
            <div class="lef">
                <div class="tab">
                    <p style="font-size: 20px;color: #508df0;">人人实验</p>
                    <p><a href="${rlab}/page/aboutus">关于我们</a></p>
                    <p><a href="${rlab}/page/ournews">媒体报道</a></p>
                    <p class="select"><a href="${rlab}/page/joinus">加入我们</a></p>
                    <p><a href="${rlab}/page/callus">联系我们</a></p>
                </div>
                <div class="tab protocol">
                    <p style="font-size: 20px;color: #508df0;">服务条款</p>
                    <p><a href="${rlab}/page/server">用户服务协议</a></p>
                    <p><a href="${rlab}/page/equity">知识产权协议</a></p>
                </div>
            </div>
            <div class="content">
                <div class="bigtit">人人实验，招贤纳才</div>
                <div class="littleTit">商务经理</div>
                <div class="intro">
                    <p style="color: #333333;line-height: 40px;">岗位职责：</p>
                    <p>1. 根据部门运营计划，协助运营完成部门工作任务安排；</p>
                    <p>2. 负责公司产品在企业、高校、科研院所进行推广，以及收集推广期间问题信息；</p>
                    <p>3. 积极调查反馈工作中所遇问题，并结合工作情况作出合理的信息反馈；</p>
                    <p>4. 挖掘社会科研服务资源，协助公司与优质合作资源达成合作；</p>
                    <p>5. 积极开展公司业务相关调查分析，掌握了解市场动态，为运营部分出谋划策。</p>
                </div>
                <div class="intro">
                    <p style="color: #333333;line-height: 40px;">任职资格：</p>
                    <p>1. 有仪器销售、BD工作经历、理工科毕业背景优先；</p>
                    <p>2. 思维活跃，观察力敏锐，交际能力强；</p>
                    <p>3. 擅长规划、总结、工作富有激情，熟悉洽谈技巧优先；</p>
                    <p>4. 在企业市场部以及科研院所有人脉者加分。</p>
                </div>
                <div class="littleTit">产品经理</div>
                <div class="intro">
                    <p style="color: #333333;line-height: 40px;">岗位职责：</p>
                    <p>1、负责公司产品及产品线的规划，负责需求访谈及调研工作，完成相关产品及项目的需求获取；</p>
                    <p>2、对产品有深刻的认识，定期分析产品市场数据，提出分析报告，确定产品的发展方向；</p>
                    <p>3、负责业务需求范围控制，承担项目需求周期内的需求跟踪分析；</p>
                    <p>4、协调需求的利益相关者，明确需求的定义，并对需求内容的合理性进行判断；</p>
                    <p>5、主导产品规划，产品设计，完成需求分析、产品文档撰写。</p>
                </div>
                <div class="intro">
                    <p style="color: #333333;line-height: 40px;">任职资格：</p>
                    <p>1、本科及以上学历，计算机、设计类相关专业；</p>
                    <p>2、三年以上移动互联网产品经理的工作经验，有著名互联网电商公司或者参与过成功产品设计运营的经验；</p>
                    <p>3、有丰富产品定位的工作经验，能独立撰写产品策划和编写产品流程；</p>
                    <p>4、深入理解技术开发流程，技术背景优先考虑；</p>
                    <p>5、有化学化工、材料、生命科学及工程领域实验室经验者优先。</p>
                </div>
                <div class="littleTit">运营总监</div>
                <div class="intro">
                    <p style="color: #333333;line-height: 40px;">岗位职责：</p>
                    <p>1、负责科技资源端运营工作的流程制定，任务分配，监督执行；</p>
                    <p>2、负责日常数据运营工作，通过数据带动业务发展；</p>
                    <p>3、负责对接产品、技术处理产品在业务流上面的问题，提升用户体验；</p>
                    <p>4、协助日常活动策划运营工作。</p>
                </div>
                <div class="intro">
                    <p style="color: #333333;line-height: 40px;">任职资格：</p>
                    <p>1、大学本科及以上学历；</p>
                    <p>2、三年以上的互联网运营工作经验，具备良好的沟通与团队管理能力，能够独立组建团队，制定相关政策和管理制度；</p>
                    <p>3、具备丰富的互联网平台运营经验，较强的数据统计和分析的能力，能够挖掘用户的需求提升用户的粘性，熟悉互联网技术、产品，能够在运营中结合业务对配合产品和技术提升网站的体验；</p>
                    <p>4、有较强的执行能力，责任心强，踏实肯干、诚实敬业，能够主动承受工作压力；</p>
                    <p>5、有大型第三方检测机构、科研机构实验室经验者优先</p>
                </div>
                <div class="intro">
                    <p style="color: #999999;margin-top: 45px;font-size: 16px;line-height: 30px;">
                        也许一开始你是拒绝的，可是，但是，结果是。。。</br>
                        水果软饮，贱贱俘获你那颗吃货心</br>
                        丰盛晚餐，不再担心一个人的孤单</br>
                        定期体检，总有人比你自己更爱你</br>
                        弹性工时，潇洒上下班不用挤成狗</br>
                        生日礼物，节日礼物，软妹子将惊喜送到你身边，不能更圆满！</br>
                        高bigger团建，高大上旅游，无底线生日趴，你的青春你做主！这些都是肤浅的，马上投递简历，你就是人生赢家！！！
                    </p>
                    <p style="color: #333333;margin-top: 30px;font-size: 16px;line-height: 30px;">
                        联系人：李女士15210361160</br>
                        简历投递邮箱：lijiale@renrenlab.com
                    </p>
                </div>
            </div>
        </div>
    </div>
    <!--底部底边栏-->
    <jsp:include page="../template/footer.jsp" ></jsp:include>
</div>
<script src="${rlab}/front/js/common/main.js?v_=20170905"></script>
</body>
</html>