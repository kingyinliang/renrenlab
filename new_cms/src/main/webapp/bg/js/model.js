/**
 * Created by user on 2017/3/25.
 */
var Model = (function ($) {

    var Model = function () {
        // 注意调用时渲染this,获取DOM,调用应该在DOM渲染完成后调用
        this.$_dom = {

            leftUserList: $("#imList"),// 左侧用户列表
            rightInfo: $("#rightInfo"),// 右侧用户信息
            imComment: $("#imMain"),// 中间聊天内容部分
            imHistory: $("#historyBtn"),

            //部分功能按钮
            closeCurrentMsg: $("#closeCurrentMsg"),// 关闭消息列表
            sendPlan: $("#sendPlan"),// 发送方案
            cancelOrder: $("#cancelOrder"),// 放弃订单
            cfmOrder: $("#cfmOrder"),// 确认订单
            alterPrice: $("#alterPrice"),// 修改价格

            textarea: $("#textIpt"),// textarea 聊天输入框
            imName: $("#name"),// im框左上角显示的名字
            msgContent: $("#msgContent"),// 聊天区展示


            // 用户信息Card上的dom
            userIptName: $("#iptInfo input.name"),// input username
            userIptPhone: $("#iptInfo input.phone"),// input userPhone
            userIptCompany: $("#iptInfo input.company"),// input company
            // userIptAdress:$("#iptInfo input.address"),// input address
            userIptAdress: $("#iptInfo input.address"),// input company
            // userIptAdress:$("#iptInfo input.address"),// input address

            userSpanName: $("#changeUserInfo span.name"),// span name
            userSpanAdress: $("#changeUserInfo span.address"),// span adrsss
            userSpanPhone: $("#changeUserInfo span.phone"),// span phone
            userSpanCompany: $("#changeUserInfo span.company"),// span company
            // userSpanAdress:$("#changeUserInfo span.address"),// span address

            userInfoAvatar: $("#userInfo > img"),// 用户头像
            suerInfoNackname: $("#userInfo > p.name"),// 用户昵称


            // 项目信息Card上的DOM
            projectTitle: $("#pjctSelect span.title_txt"),// 项目下拉-标题
            projectSelectUl: $("#pjctSelect .select_ul"),//项目下拉-ul
            projectSelectLis: $("#pjctSelect .project_lis"),// 项目下拉-li的容器

            planList: $("#planItemBar"), // 方案列表
            addPlanBtn: $("#planList .add_plan"),// 添加方案按钮
            sendPlanBtn: $("#projectInfo .send_plan"),// 发送方案按钮

            // 订单CardS上的DOM
            orderTitle: $("#orderSelect span.title_txt"),// 订单下拉列表标题
            orderSelect: $("#orderSelect ul.select_ul"),// 订单下拉列表盒子

            orderList: $("#orderList"),
            orderStatus: $("#orderList .current_state p"),// 订单状态
            orderId: $("#orderList .info_detail span.orderId"),// 订单ID
            orderCreateTime: $("#orderList .info_detail span.createTime"),// 创建时间
            orderStandard: $("#orderList .info_detail span.standard"),// 使用标准
            orderFacilityName: $("#orderList .info_detail span.facilityName"),// 使用仪器
            orderGrant: $("#orderList .info_detail span.grant"),// 资质授权
            orderPeriod: $("#orderList .info_detail span.period"),// 周期
            orderService: $("#orderList .info_detail span.supportService"),// 是否提供样品制备服务
            orderDistance: $("#orderList .order_info_additional span.distanceKm"),// 距离
            orderPrice: $("#orderList .order_info_additional span.orderPrice"),// 价格

            awaitList: $("#awaitScrollBar"),//带接入列表
            sessionList: $("#testDiv"),//会话列表
            tmlWaiters: $("#adminStingBar"),//客服列表

        };
        this.$_statis = {
            focus: false, // 记录当前textarea的
            ctrlKey: false,
            shiftKey: false,
            currentUid: "212",
            userInfo: {
                uId: 0,// 当前没有正在交流的客服
                currentSsId: 0,// 当前会话Id,刷消息就刷他的
                currentPjId: 0, // 默认当前选中的项目id
                ssState:0
            },
            msgPage: {
                pages: 1,
                msgPageSize: 10
            },
        }
    };

    Model.prototype = {

        construct: Model,
        getUserHistoryMsg: getUserHistoryMsg, // 获用户历史信息函数
        getUserInfo: getUserInfo, // 获取用户信息
        getPjList: getPjList, // 获取项目列表
        getPlan: getPlan, // 获取方案
        getOrderPjList: getOrderPjList, // 获取存在订单的项目
        changeOrderInfo: changeOrderInfo,// 修改订单状态
        changeUserInfo: changeUserInfo, // 修改用户信息
        addProject: addProject, // 添加项目
        pushPlan: pushPlan,// 推送方案给用户
        addPlan: addPlan,// 添加方案
        getCustomersList: getCustomersList,//获取待接入列表
        joinup: joinup,//接入会话
        getSessionList: getSessionList,//会话列表

        getNewMsg: getNewMsg, //　轮询当前会话的新消息列表
        sendMessage: sendMessage,// 发送消息
        getWaiterList: getWaiterList,//获取客服列表
        removeWaiter: removeWaiter,//删除客服
        updataWaiterInfo: updataWaiterInfo,//更新客服
        alterPassword: alterPassword,//普通客服修改密码
        addWaiter: addWaiter,//添加客服
        logout: logout,// 退出登录
        endMsg:endMsg,// 结束会话
        joinMsg:joinMsg,// 重新接入会话
        fuzzySearchCompany:fuzzySearchCompany,// 模糊查询公司名称

    }

    var httpConfig = {
        baseUri: "/bg/api",
        port: "8080",
    }

    Model.ajax = function (params, type) {

        var option = {
            type: type,
            url: httpConfig.baseUri + params.url
        };

        // 响应成功回调函数必须有
        if (!params.success || !labUtil.isFn(params.success)) {
            throw "Model.ajax params success is not a function = > 查看Model.js文件";
        }

        if (params.data) {
            option.data = JSON.stringify(params.data);
        }

        if (!params.headers) {
            throw "must include headers param from your http methods = > 查看Model.js文件";
        }

        !!params.headers.dataType ? option.dataType = params.headers.dataType : "";
        !!params.headers.contentType ? option.contentType = params.headers.contentType : "";


        // HTTP请求发送之前
        option.beforeSend = function () {
            if (params.beforeSend && labUtil.isFn(params.beforeSend)) {
                params.beforeSend();
            }
        };

        // HTTP请求成功的回调
        option.success = function (data) {

            // 对返回的 data 进行错误处理
            if (typeof (data) == "string") {

                try {
                    data = JSON.parse(data);

                } catch (e) {

                    data = data;
                }

            }

            if (data.code === 1001) {

                layer.msg("系统异常“错误码：1001”- <br/> URL:" + option.url, {icon: 2});
                return false;

            } else if (data.code === 1002) {

                layer.msg("系统业务繁忙“错误码：1002”", {icon: 2});
                return false;

            } else if (data.code === 1003) {

                window.location.href = "../../bg/page/login.do";
                return false;

            } else if (data.code === 1004) {

                layer.msg("未找到资源“错误码：1004”", {icon: 2});
                return false;

            } else if (data.code === 1005) {

                layer.msg("系统未匹配“错误码：1005”", {icon: 2});
                return false;

            } else if (data.code === 1008) {

                layer.msg("LOWER_PERMISSION_ERROR“code：1008”", {icon: 2});
                return false;

            }
            params.success(data);

        };

        // HTTP请求失败的回调
        option.error = function () {
            if (params.fail && labUtil.isFn(params.fail)) {
                params.fail();
            }
        };

        $.ajax(option);

    };

    Model.POST = function (option) {
        Model.ajax(option, "POST");
    };

    Model.GET = function (option) {
        Model.ajax(option, "GET");
    };

    Model.PUT = function (option) {
        Model.ajax(option, "PUT");
    };

    Model.DELETE = function (option) {
        Model.ajax(option, "DELETE");
    };


    function logout(params, succeedFn, failFn) {

        Model.GET({
            url: " /cs/logout.do",
            headers: {},
            success: function (data) {
                succeedFn(data);
            },
            fail: function (data) {
                failFn(data);
            }
        })
    }

    // 结束会话
    function endMsg(params,succeedFn,failFn){

        Model.PUT({
            url: "/session/update.do",
            data: {
                sSid: params.ssId,
                sState: params.ssState
            },
            headers: {
                contentType: "application/json"
            },
            success: function (data) {
                succeedFn(data);
            },
            fail: function (data) {
                failFn(data);
            }
        });

    }
    // 重新接入会话
    function joinMsg(params,succeedFn,failFn){

        Model.PUT({
            url: "/session/update.do",
            data: {
                sSid: params.ssId,
                sState: params.ssState
            },
            headers: {
                contentType: "application/json"
            },
            success: function (data) {
                succeedFn(data);
            },
            fail: function (data) {
                failFn(data);
            }
        });
    }
    // 获取用户的历史聊天记录
    function getUserHistoryMsg(params, succeedFn, failFn) {

        Model.GET({

            url: "/session/switch.do?sessionId=" + params.sessionId + "&pageNo=" + params.pageNo + "&pageSize=" + params.pageSize,
            headers: {},
            success: function (data) {
                succeedFn(data.payload);
            },
            fail: function (data) {
                failFn(data);
            }
        })

    }

    // 查询所有项目
    function getPjList(params, succeedFn, failFn) {
        Model.GET({
            url: "/project/querypj.do?uId=" + params.uId,
            headers: {},
            success: function (data) {

                succeedFn(data.payload);

            },
            fail: function (data) {

                failFn(data);
            }
        })
    }

    // 查询方案
    function getPlan(params, succeedFn, failFn) {
        Model.GET({
            url: "/project/querysch.do?pjId=" + params.pjId,
            headers: {},
            success: function (data) {

                succeedFn(data.payload);
            },
            fail: function () {

                failFn(data);
            }
        })

    }

    // 推送方案给用户
    function pushPlan(params, succeedFn, failFn) {

        Model.POST({

            url: "/project/sendsche.do",
            data: {
                uId: params.uId,
                schId: params.schId
            },
            headers: {
                contentType: "application/json"
            },
            success: function (data) {
                succeedFn(data);
            },
            fail: function (data) {
                failFn(data);
            }

        });


    }

    // 查询所存在订单的项目列表
    function getOrderPjList(params, succeedFn, failFn) {

        Model.GET({
            url: "/order/queryorderlist.do?id=" + params.uId,
            headers: {
                contentType: "application/json"
            },
            success: function (data) {
                succeedFn(data.payload);
            },
            fail: function (data) {

                failFn(data);
            }
        })

    }

    // 修改密码
    function alterPassword(params, succeedFn, failFn) {

        //请求体
        //{
        //    "csId":1212,        客服id
        //    "oldpassword":"password" 旧密码
        //    "password":"password" 新的密码
        //}

        Model.PUT({
            url: "/cs/amendpassword.do",
            data: {
                csId: params.csId,
                oldpassword: params.oldpassword,
                password: params.password
            },
            headers: {
                contentType: "application/json"
            },
            success: function (data) {
                succeedFn(data);
            },
            fail: function (data) {
                failFn(data);
            }
        });

    }

    //获取客服列表
    function getWaiterList(params, succeedFn, failFn) {

        // 无参数：
        Model.GET({
            url: "/cs/cslist.do",
            headers: {
                contentType: "application/json"
            },
            success: function (data) {

                succeedFn(data.payload);
            },
            fail: function () {
                failFn(data);
            }
        })

    }

    //添加客服
    function addWaiter(params, succeedFn, failFn) {


        Model.POST({
            url: "/cs/addcs.do",
            headers: {
                contentType: "application/json"
            },
            data: params,
            success: function (data) {
                succeedFn(data);
            },
            fail: function (data) {
                failFn(data);
            }
        })

    }

    //删除客服
    function removeWaiter(params, succeedFn, failFn) {

        Model.DELETE({
            url: "/cs/delcs.do?csId=" + params.csId,
            headers: {
                contentType: "application/json"
            },
            success: function (data) {

                succeedFn(data);
            },
            fail: function (data) {
                failFn(data);
            }
        })
    }

    //更新客服信息
    function updataWaiterInfo(params, succeedFn, failFn) {

        Model.PUT({
            url: "/cs/updatecs.do",
            data: {
                    uUid: params.uUid,
                    uName: params.uName
                    // schOrganization: $("#jianCeJiGou").val(),
                    // schStandard: $("#shiYongBiaoZhun").val(), // 标准
                    // schInstrument: $("#shiYongYiQi").val(), // 仪器
                    // schQualifications: $("#ziZhiShouQuan").val(), // 授权
                    // schPeriod: $("#xiangMuZhouQi").val(), // 周期
                    // schOfferService: $("#yangpin input:checked").val(), // 是否提供样品制备服务
                    // schPrice: (($("#planPrice").val() - 0).toFixed(2)) * 100, // 价格
                    // schDistance: distance, // 距离
                    // schPraise: $("#starts").data("score") + "", // 口碑
                    // schFeature: "", // 特色(*)
                    // schVersion: 0 // 是否显示（1不显示，0显示）
            },
            headers: {
                contentType: "application/json"
            },
            success: function (data) {
                succeedFn(data);
            },
            fail: function (data) {
                failFn(data);
            }
        })

    }

    //添加方案
    function addPlan(params, succeedFn, failFn) {

        Model.PUT({
            url: "/project/addsch.do",
            data: {
                pjId: params.pjId,
                schProject: params.schProject,
                schOrganization: params.schOrganization,
                schStandard: params.schStandard,
                schInstrument: params.schInstrument,
                schQualifications: params.schQualifications,
                schPeriod: params.schPeriod,
                schOfferService: params.schOfferService,
                schPrice: params.schPrice,
                schDistance: params.schDistance,
                schPraise: params.schPraise,
                schFeature: params.schFeature,
                schVersion: params.schVersion
            },
            headers: {
                contentType: "application/json"
            },
            success: function (data) {
                succeedFn(data);
            },
            fail: function (data) {
                failFn(data);
            }
        })
    }

    //待接入
    function getCustomersList(params, succeedFn, failFn) {

        Model.GET({

            url: "/session/home/json.do?pageNo=" + params.pageNo + "&pageSize=" + params.pageSize,
            headers: {},
            success: function (data) {
                succeedFn(data.payload);
            },
            fail: function (data) {
                failFn(data);
            }

        })

    }

    //接入会话
    function joinup(params, succeedFn, failFn) {

        Model.GET({
            url: "/session/joinup.do?sessionId=" + params.ssId,
            headers: {
                contentType: "application/json"
            },
            success: function (data) {
                succeedFn(data);
            },
            fail: function (data) {
                failFn(data);
            }
        })

    }

    //获取当前会话消息
    function getNewMsg(params, succeedFn, failFn) {

        Model.GET({
            url: "/mt/query/json.do?sessionId=" + params.sessionId,
            headers: {
                contentType: "application/json"
            },
            success: function (data) {

                succeedFn(data.payload);
            },
            fail: function (data) {

                failFn(data);
            }
        })
    }

    // 查询相似机构（模糊查询）
    function fuzzySearchCompany(params, succeedFn, failFn){

        Model.GET({
            url: "/user/org.do?orgName=" + params.orgName ,
            headers: {},
            success: function (data) {
                if(data.code === 0){
                    succeedFn(data.payload);
                }
            },
            fail: function (data) {
                failFn();
            }
        })

    }
    //发送消息
    function sendMessage(params, succeedFn, failFn) {

        Model.POST({
            url: "/msg/add.do?sessionId=" + params.sessionId,
            data: {
                "mBody": params.msgBody
            },
            async:false,
            headers: {
                contentType: "application/json"
            },
            success: function (data) {
                succeedFn(data);
            },
            fail: function (data) {
                failFn(data);
            }
        })

    }

    //获取会话列表
    function getSessionList(params, succeedFn, failFn) {

        Model.GET({
            url: "/session/list/json.do?pageNo=" + params.pageNo + "&pageSize=" + params.pageSize,
            headers: {},
            success: function (data) {

                succeedFn(data.payload);
            },
            fail: function (data) {
                failFn(data);
            }
        })

    }

    // 获取用户信息
    function getUserInfo(params, succeedFn, failFn) {

        Model.GET({
            url: "/user/info.do?uId=" + params.uId,
            headers: {},
            success: function (data) {
                succeedFn(data.payload);
            },
            fail: function (data) {

                failFn(data);
            }
        });

    }

    // 修改客户信息
    function changeUserInfo(params, succeedFn, failFn) {

        Model.POST({
            url: "/user/update.do",
            headers: {
                contentType: "application/json"
            },
            data: {
                "uId": params.uId,
                "uName": params.uName,
                "uPhone": params.uPhone,
                "uDetailAddress": params.uDetailAddress,
                "uOrgName": params.uOrgName,
                "orgIds":params.orgIds
            },
            success: function (data) {

                succeedFn(data);
            },
            fail: function (data) {

                failFn(data);
            }
        });
    }

    // 修改价格修改订单状态
    function changeOrderInfo(params, succeedFn, failFn) {

        var reqBody = {};

        if (params.oPrice == 0 || (params.oPrice && params.oPrice != undefined)) {

            reqBody = {
                oId: params.oId,
                oPrice: params.oPrice
            }

        } else {

            reqBody = {
                oId: params.oId,
                oState: params.oState
            }

        }

        // 调用示例
        Model.PUT({
            url: "/order/update.do",
            data: reqBody,
            headers: {
                contentType: "application/json",
            },
            success: function (data) {

                succeedFn(data);
            },
            fail: function (data) {

                failFn(data);

            }
        });

    }

    // 添加项目
    function addProject(params, succeedFn, failFn) {
        // 调用示例
        Model.POST({
            url: "/project/addpj.do",
            data: params,
            headers: {
                contentType: "application/json"
            },
            success: function (data) {

                succeedFn(data);
            },
            fail: function (data) {

                failFn(data);

            }
        });
    }
    
    function java(){
        
    }

    return Model;
})($)
