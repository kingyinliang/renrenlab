/**
 * Created by user on 2017/3/27.
 */
var model = new Model();
// 公用对象
var ControlHome = (function ($) {

    // **********construct*********
    var ControlHome = function () {
        this.name = "徐志响";
    };

    // ************private methods**************
    /**
     * tab切换卡片，组件相关事件
     * must:html的tab-bar必须存在data-tab属性，属性值和card的id相同
     * @param option must be a object;
     *  => option.tab is tabBar for jqueryDOMS;
     *  => option.activeClass is tabBar activety Class;
     */
    ControlHome.tabToCard = function (option, callback) {

        var tabCard = [],
            i = 0;

        // verify params
        if (!labUtil.isObj(option)) {
            throw "params option is not object";
        }

        if (option.tab === undefined) {
            throw "params option.tab is not defined";
        }

        // find cards (include all card)
        for (i; i < option.tab.length; i++) {
            tabCard.push($("#" + $(option.tab[i]).data("tab")));
        }

        // bind event for toggle card
        option.tab.on("click", function () {
            var $_this = $(this);
            // control tab class
            option.tab.removeClass(option.activeClass);

            $_this.addClass(option.activeClass);

            // hide all card
            for (var j = 0; j < tabCard.length; j++) {
                tabCard[j].hide();
            }

            //show origin card
            $('#' + $_this.data("tab")).show();

            // emit callback
            if (!labUtil.isFn(callback)) {
                return false;
            }
            callback({
                tabBar: $_this, // 当前选择的tab jqueryDOM
                cardId: $_this.data("tab") // 对应的card ID ,外面可以用该id获取到当前卡片的jqueryDOM/DOM
            });
        });
    };

    /**
     *下拉列表控制组件
     *parmas:
     *selectBox 下拉列表 根jqueryDOM
     *callback 切换选项时触发的change回调
     */
    ControlHome.bindSelect = function (selectBox, callback) {

        // 显示标题栏
        selectBox.css("display", "block");
        //获取DOM
        var ulContent = selectBox.find("ul");
        //点击事件
        selectBox.off().on("click", function () {

            // 点击titleBar时候的下拉列表的切换
            if ($(this).hasClass("active_bar")) {

                $(this).removeClass("active_bar");
                ulContent.hide();

            } else {

                $(this).addClass("active_bar");
                ulContent.show();
            }

        })

        //下拉列表子项点击事件
        ulContent.find("li").off().on("click", function () {

            ulContent.find("li").removeClass("activated");
            $(this).addClass("activated");
            selectBox.find("span").text($(this).text());
            //ulContent.hide();
            if (labUtil.isFn(callback)) {
                callback($(this));
            }

        })

        // 取消其他元素的事件冒泡
        if (ulContent.find("div,i,s").length > 0) {
            ulContent.find("div,i,s").on("click", function (e) {
                if (e.target.tagName.toLowerCase() != "li") {

                    e.stopPropagation();
                    return false;
                }

            })
        }

    }

    /**
     * bindTextarea:处理textarea的相关交互事件
     *
     */
        // 绑定输入框相关事件
    ControlHome.bindTextarea = function () {

        model.$_dom.textarea.on("focus", function () {
            model.$_statis.focus = true;
        })

        model.$_dom.textarea.on("blur", function () {
            model.$_statis.focus = false;
        })

        model.$_dom.textarea.on("keyup", function (e) {

            var text = $("#textIpt").val();
            //var reg = /<[^<>]+>/g;
            //text = text.replace(reg, '');

            if (e.keyCode === 13) {
                var $_this = $(this);

                // 异常处理
                if ($.trim($_this.val()) == '' || $_this.val() == '' || $_this.val() == undefined) {
                    $_this.val(""); // 清空输入框
                    layer.msg("消息不能为空", {
                        icon: 2
                    })
                    return false;
                }

                var csAvatar = localStorage.getItem("waiterInfo").csAvatar ? localStorage.getItem("waiterInfo").csAvatar : "../imgs/other/waiter_default.jpg";

                // 消息拼接HTML
                if (text.length > 50) {
                    text = labUtil.formatStr(text);
                }
                $.trim(text);
                // 把消息推给服务器
                model.sendMessage({

                    sessionId: model.$_statis.userInfo.currentSsId,
                    msgBody: text

                }, function (data) {
                    var html = "";

                    if (data.code === 0) {

                        html = bt("myMsg", {
                            msgBody: text,
                            avatar: csAvatar,
                            status: 0
                        });


                    } else if (data.code === 3001) {

                        layer.msg("消息发送失败，请重新发送");
                        html = bt("myMsg", {
                            msgBody: text,
                            avatar: csAvatar,
                            status: 1
                        });

                    } else {
                        layer.msg("消息发送失败，请重新发送");
                        return false;
                    }

                    $("#msgContent").append(html); // 消息push到当前页面去
                    $_this.val(""); // 清空输入框
                    $('#msgContent').scrollTop($('#msgContent')[0].scrollHeight); // 滚动条滚动到最底端
                    controlMsgScroll(); // 控制消息滚动条


                }, function () {

                    layer.msg("消息发送失败", {
                        icon: "2"
                    })

                })

            }


        })
    }

    // 控制复选框样式
    ControlHome.controlChecked = function ($_this) {

        // 给要绑定/更新事件的所有标签都绑定事件
        // 注意要给input注册事件，因为label会触发两次
        var $_input = $($_this);
        var $_label = $_input.parent();
        if ($_input.prop("checked")) {
            $_label.addClass("ckd_active");

        } else {
            $_label.removeClass("ckd_active");
        }
    }

    //带接入列表点击
    ControlHome.awaitListClick = function ($_this) {

        var data = $($_this).data("awaitList");
        model.joinup({ssId: data.ssId}, function (data) {

            if (data.code === 0) {
                layer.msg('接入成功！', {
                    icon: "1"
                });

                $($_this).parent().parent().remove(); // 移除此项

                // 这位置不要改
                initSessionList({
                    pageNo: 1,
                    pageSize: 100
                });

                initAwaitPage({
                    pageNo: 1,
                    pageSize: 100
                });

            } else if (data.code === 4001) {

                layer.msg('已经被其他客服接入！', {
                    icon: "2"
                });
                $($_this).parent().parent().remove(); // 移除此项

            }

        }, function (data) {

            layer.msg('接入失败，请重新操作！', {
                icon: "2"
            });

        });
    }


    // 确认完成订单
    ControlHome.cfmOrder = function ($_this) {

        var $_this = $($_this);
        var orderInfo = $_this.parent().parent().data("orderInfo");

        var params = {
            oId: orderInfo.oId,
            oState: 1 // 0进行中,1已完成,2已关闭
        }

        //询问框
        layer.confirm('确认订单？', {
            btn: ['确认', '取消'] //按钮
        }, function () {

            model.changeOrderInfo(params, function (data) {
                if (data.code === 0) {
                    layer.msg('确认订单成功！', {
                        icon: "1"
                    });

                } else if (data.code === 5001) {

                    layer.msg("确认失败，订单状态已在其他设备更改！", {
                        icon: "2"
                    })
                }
                initOrderPage(model.$_statis.userInfo);


            }, function () {

                layer.msg("确认订单失败！", {icon: "2"});

            });

        });

    }

    // 放弃/关闭订单
    ControlHome.cancelOrder = function ($_this) {

        var $_this = $($_this);
        $_this.parent().parent();
        var orderInfo = $_this.parent().parent().data("orderInfo");
        var params = {
            oId: orderInfo.oId,
            oState: 2 // 0进行中,1已完成,2已关闭
        }

        layer.confirm('关闭订单？', {
            btn: ['确认', '取消'] //按钮
        }, function () {

            model.changeOrderInfo(params, function (data) {
                if (data.code === 0) {
                    layer.msg('订单已被关闭！', {
                        icon: "1"
                    });

                } else if (data.code === 5001) {

                    layer.msg("取消失败，订单状态已在其他设备更改！", {
                        icon: "2"
                    })

                }
                initOrderPage(model.$_statis.userInfo);

            }, function () {

                layer.msg("操作失败！", {icon: "2"});
            })

        });

    }
    // 修改价格
    ControlHome.alterOrderPrice = function ($_this) {
        var $_this = $($_this);
        //prompt层
        var html =
            '<div style="width: 300px;box-shadow: 1px 1px 50px rgba(0,0,0,.3);">\
                <p style="background: #2FCBA8;height: 40px;line-height: 40px;color: #fff;">\
                    <span style="padding-left: 10px;font-size: 16px;">输入新价格</span>\
                </p>\
                <p  style="padding: 10px 10px 0px 10px;">\
                    <input id="changePrice" type="number" style="outline: none;height: 30px;width: 100%;">\
                </p>\
                <p style="color: #f86800;font-size: 12px;padding: 2px 10px 10px 10px"><i>面议情况：请输入0</i></p>\
                <p  style="padding: 0px 10px 10px 10px;" >\
                    <button id="sures" type="button" style="height: 30px;width: 137px;outline: none;border: 0 none;background-color: #2FCBA8;color: #fff;cursor: pointer; ">确定</button>\
                    <button id="cancels" type="button" style="height: 30px;width: 137px;outline: none;background-color: #CCCCCC;border:0 none; color: #000;cursor: pointer;">取消</button>\
                </p>\
            </div>';

        var layer1 = layer.open({
            type: 1,
            title: false,
            closeBtn: 0,
            shadeClose: true,
            skin: 'yourclass',
            content: html
        });

        $("#changePrice").off("input").on("input", function () {
            var field = $("#changePrice").val();
            if (field * 1 < 0 || field * 1 > 999999999) {
                $("#changePrice").val("");
            }
        });

        $("#changePrice").off("keydown").on("keydown", function (e) {
            if (e.keyCode == 110) {
                var field = $("#changePrice").val();

                if (field.indexOf(".") != -1) {
                    return false;
                }
            }
            if (labUtil.splitNumber(e, 2)) {
                //console.log("true");
                return true
            } else {
                //console.log("false");
                return false;
            }
            return false;
        });


        $("#sures").on("click", function () {

            var orderInfo = $_this.parent().parent().parent().parent().data("orderInfo");
            var params = {
                oId: orderInfo.oId,
                oPrice: $("#changePrice").val() * 100
            }

            model.changeOrderInfo(params, function (data) {
                layer.close(layer1);
                if (data.code === 0) {
                    layer.msg("订单价格修改成功！", {icon: "1"});
                    if (params.oPrice == 0) {
                        model.$_dom.orderPrice.text("面议"); // 价格
                    } else {
                        model.$_dom.orderPrice.text("￥" + (params.oPrice / 100).toFixed(2)); // 价格
                    }

                } else if (data.code === 5001) {

                    layer.msg("修改失败，订单状态已被其他设备修改！", {
                        icon: "2"
                    })
                    initOrderPage(model.$_statis.userInfo);
                }


            }, function () {

                layer.msg("添加失败", {icon: "2"});

            })

        });

        $("#cancels").on("click", function () {
            layer.close(layer1); // 关闭该弹窗
        });

    }

    // 重新接入会话
    ControlHome.joinAgain = function () {

        model.joinMsg({
            "ssId": model.$_statis.userInfo.currentSsId,
            "ssState": 1
        }, function (data) {
            model.$_statis.userInfo.ssState = 1; // 更新当前会话状态
            if (data.code === 0) {
                model.$_statis.msgPage.pages = 1;
                // 清空上个用户的信息
                emptyLastInfo();
                // 渲染IM聊天框里的信息
                initIMPage();
                // 渲染右侧所有信息
                initRightPage(model.$_statis.userInfo);
                // 判断客服权限
                // 重新渲染一下右侧
                layer.msg("会话已重新接入");
            }

        }, function () {
            layer.msg("请求发送失败");
        })

    }

    //删除客服
    ControlHome.deleteWaiter = function ($_this) {

        layer.confirm('确认要移除该客服？', {

            btn: ['确认', '取消'] //按钮

        }, function () {


            var data = JSON.parse($($_this).attr("data-waiters-list"));
            //var data = JSON.parse($($_this).attr("data-waiters-list"));
            // var data = $.toJSON($($_this).attr("data-waiters-list"));
            model.removeWaiter({
                csId: data.csId

            }, function () {

                $($_this).parent().parent().parent().remove();
                layer.msg("客服已被移除", {icon: 1});

            }, function () {

                layer.msg("操作失败", {icon: 2});

            });

        });
    }

    //更新客服
    ControlHome.updataWaiter = function ($_this) {

        $("#editWaiter").css("display", "block").animate({opacity: 1}, 170, "swing").next(".xq_modal_back").css("display", "block").animate({opacity: .5}, 170, "swing");
        $("body").css({"overflow": "hidden"});
        $("#editWaiter .xq_modal_contant").css("display", "block").animate({height: '200'}, 170, "swing");

        var data = $($_this).attr("data-waiters-list");
        var jsonData = $.parseJSON(data);
        $("#editWaiterNickName").val(jsonData.csName);

        $("#editWaiterClose").off().on("click", function () {
            $("#editWaiter").css("display", "none").animate({opacity: 0}, 50, "swing").next(".xq_modal_back").css("display", "none").animate({opacity: 0}, 50, "swing");
            $("body").css({"overflow": "visible", "padding-right": 0});
            $(".xq_modal_contant").animate({height: 0}, 0, "swing");
        });

        $("#editWaiterSubmit").off().on("click", function () {

            var name = $("#editWaiterNickName").val();
            var reg = labUtil.REG.isLetterOrNumber;

            if (!new RegExp(reg).test(name)) {
                layer.msg("用户名只允许输入英文或数字");
                return;
            }

            model.updataWaiterInfo({
                uUid: jsonData.csId,
                uName: $("#editWaiterNickName").val()
            }, function (data) {

                if (data.code === 0) {
                    $("#editWaiterClose").trigger("click");
                    getWaitersList();
                    layer.msg("客服信息修改成功", {icon: 1})
                } else if (data.code === 1007) {
                    layer.msg("客服名已存在", {icon: 2})
                }


            }, function (data) {

                $("#editWaiterClose").trigger("click");
                layer.msg("操作失败", {icon: 2})

            });
        });
    }

    //普通客服修改密码
    ControlHome.editWaiterPassword = function () {

        var oldPassword = $("#commonWaiter input").eq(0).val();
        var newPassword1 = $("#commonWaiter input").eq(1).val();
        var newPassword2 = $("#commonWaiter input").eq(2).val();

        if (oldPassword == "") {
            layer.msg("旧密码为空");
            return;
        } else if (newPassword1 == "" || newPassword2 == "") {
            layer.msg("新密码不能为空");
            return;
        } else if (newPassword1 != newPassword2) {
            layer.msg("两次输入的新密码不一致");
            return
        } else if (oldPassword.length < 6) {
            layer.msg("旧密码不能小于6位");
            return;
        } else if (newPassword1.length < 6 || newPassword1.length > 20) {
            layer.msg("新密码需要6-20位")
            return;
        }

        //var data = {
        //    csId: JSON.parse(localStorage.getItem("waiterInfo")).csId,
        //    oldpassword: $.md5(oldPassword),
        //    password: $.md5(newPassword2)
        //
        //}
        var data = {
            csId: JSON.parse(localStorage.getItem("waiterInfo")).csId,
            oldpassword: $.md5(oldPassword),
            password: $.md5(newPassword2)

        }

        model.alterPassword(data, function (data) {

            if (data.code === 1009) {

                layer.msg("旧密码输入错误");
                return false;

            }


            $("#commonWaiter input").val("");
            layer.msg("密码修改成功!", {icon: 1});


        }, function () {

            layer.msg("密码修改失败!", {icon: 2});

        });

    }

    // 模糊查询功能点击确定
    ControlHome.updateCompany = function ($this, orgIds) {


        $("#saveInfo").data("orgId", orgIds);
        var $_this = $($this);
        $("#compInfoIpt").val($_this.text());
        $("#companyList").hide();
    }


    //添加客服
    ControlHome.addWaiter = function () {

        $("#addWaiter").css("display", "block").animate({opacity: 1}, 170, "swing").next(".xq_modal_back").css("display", "block").animate({opacity: .5}, 170, "swing");

        $("body").css({"overflow": "hidden"});

        $("#addWaiter .xq_modal_contant").css("display", "block").animate({height: '270px'}, 170, "swing");

        $("#addWaiterClose").on("click", function () {
            $("#addWaiter").css("display", "none").animate({opacity: 0}, 50, "swing").next(".xq_modal_back").css("display", "none").animate({opacity: 0}, 50, "swing");
            $("body").css({"overflow": "visible", "padding-right": 0});
            $(".xq_modal_contant").animate({height: 0}, 0, "swing");
        });

        $("#addWaiterSubmit").off().on("click", function () {

            var userName = $("#addWaiterUserName").val();
            var password = $("#addWaiterPassword").val();


            var regName = labUtil.REG.isLetterOrNumber;
            var regPassword = labUtil.REG.isPassword;

            if (!new RegExp(regName).test(userName)) {
                layer.msg("用户名只允许输入英文或数字");
                return;
            } else if (!new RegExp(regPassword).test(password)) {
                layer.msg("密码允许输入6-20位英文或数字");
                return;
            }


            password = $.md5(password)
            var data = {
                uMobile: userName,
                uPassword: password
            };

            model.addWaiter(data, function (data) {

                if (data.code === 0) {

                    $("#addWaiterClose").trigger("click");
                    layer.msg("客服添加成功！", {icon: 1});
                    $("#addWaiterUserName").val("");
                    $("#addWaiterPassword").val("");
                    getWaitersList();

                } else if (data.code === 1007) {

                    layer.msg("添加失败，客服名已存在", {icon: 2});
                }

            }, function (data) {

                layer.msg("操作失败！", {icon: 2});
            });

        });

    }


    // 添加方案弹窗的控制对象
    var controlModal = {


        initPagesModal: function () {
            var score = 0;
            // 评价星星
            $("#starts > div").each(function (index) {
                $(this).on("click", function () {
                    $("#starts img").attr("src", "../imgs/icon/start_n_l.png");
                    for (var i = 0; i <= index; i++) {
                        $("#starts img").eq(i).attr("src", "../imgs/icon/start_d_l.png");
                    }
                    score = (index + 1) * 2;
                    $("#starts").data("score", score); // 绑定评分
                })
            })


            //   价格输入面议单选切换
            $("#planPrice").on("click", function () {

                $("#mianYiRadio").removeAttr("checked", "true");
            });

            // 价格输入面议单选切换
            $("#mianYiRadio").on("click", function () {
                $("#planPrice").val("");
            });

        },
        showPlanMenu: function ($_this) {

            //$(".xq_modal").css("display", "block").animate({opacity: 1}, 170, "swing").next(".xq_modal_back").css("display", "block").animate({opacity: .5}, 170, "swing");
            //$("body").css({"overflow": "hidden"});

            $(".add_xq_modal_contant").css("display", "block").animate({height: '600'}, 100, "swing");


            if ($_this) {

                var planInfo = $($_this).data("planInfo"); // 方案数据
                var $text = $.trim($($_this).parent().parent().find("div.title span").text());

                // li标签
                $("#planSelect ul > li").each(function () {
                    $(this).removeClass("activated");
                    if ($.trim($(this).text()) == $text) {
                        $(this).addClass("activated");


                    }

                })

                // 数据填充
                $("#planSelect .slect_bar span").text($text);
                $("#jianCeJiGou").val(labUtil.stringFilter(planInfo.schOrganization));
                $("#shiYongBiaoZhun").val(labUtil.stringFilter(planInfo.schStandard));
                $("#shiYongYiQi").val(labUtil.stringFilter(planInfo.schInstrument));
                $("#ziZhiShouQuan").val(labUtil.stringFilter(planInfo.schQualifications));
                $("#xiangMuZhouQi").val(planInfo.schPeriod);
                $("#yangpin input").eq(1).attr("checked", "true");
                $("#planPrice").val(planInfo.schPrice / 100);
                $("#planDistance").val(planInfo.schDistance);
                //$("#start").trigger("click");

                $("#start" + planInfo.schPraise / 2).trigger("click");

            } else {
                // li标签
                $("#planSelect ul > li").each(function (index) {

                    $(this).removeClass("activated");
                    if (index === 0) {
                        $(this).addClass("activated");
                    }
                })

                // 数据填充
                $("#planSelect .slect_bar span").text("匹配度最高");
                $("#jianCeJiGou").val("");
                $("#shiYongBiaoZhun").val("");
                $("#shiYongYiQi").val("");
                $("#ziZhiShouQuan").val("");
                $("#xiangMuZhouQi").val("");
                $("#yangpin input").eq(1).attr("checked", "true");
                $("#planPrice").val("");
                $("#planDistance").val("");
                $("#start5").trigger("click");

            }

        },
        hidePlanMenu: function () {
            $(".add_xq_modal_contant").animate({height: 0}, 0, "swing");
        },
        dragModal: function (barTag, targetTag) {

            barTag.on("mousedown", function (e) {

                var e = e || window.event;
                var x = e.offsetX;
                var y = e.offsetY;

                $(document).bind("mousemove", function (evt) {
                    var evt = evt || window.event;
                    var left = evt.clientX - x;
                    var top = evt.clientY - y;
                    var maxleft = document.documentElement.clientWidth - targetTag.offsetWidth;
                    var maxtop = document.documentElement.clientHeight - targetTag.offsetHeight;
                    if (left <= 0) {
                        left = 0;
                    }

                    if (top <= 0) {
                        top = 0;
                    }

                    if (left > maxleft) {
                        left = maxleft;
                    }
                    if (top > maxtop) {
                        top = maxtop;
                    }
                    targetTag.css("left", left);
                    targetTag.css("top", top);
                    targetTag.css("margin", 0);
                }).mouseup(function () {
                    $(this).unbind("mousemove");
                })
            })

        }

    }
    controlModal.initPagesModal(); // 渲染弹窗

    // **********public methods***************
    ControlHome.prototype = {
        construct: ControlHome,
        init: init,
        bindSelect: ControlHome.bindSelect, // 绑定下拉列表事件和选项的change事件（局部渲染时，可能会重新调用绑定）
        tabToCard: ControlHome.tabToCard, // 绑定tab切换事件
        controlChecked: ControlHome.controlChecked, // 控制复选框样式
        showPlanMenu: controlModal.showPlanMenu, // 展示方案弹窗
        cfmOrder: ControlHome.cfmOrder, // 确认订单
        cancelOrder: ControlHome.cancelOrder, // 放弃/关闭订单
        alterOrderPrice: ControlHome.alterOrderPrice, //修改订单价格
        awaitListClick: ControlHome.awaitListClick, //带接入列表点击事件
        deleteWaiter: ControlHome.deleteWaiter, //删除客服
        updataWaiter: ControlHome.updataWaiter, //更新客服
        editWaiterPassword: ControlHome.editWaiterPassword, //普通客服修改密码
        addWaiter: ControlHome.addWaiter, //添加客服
        joinAgain: ControlHome.joinAgain, // 重新接入会话
        updateCompany: ControlHome.updateCompany, // 模糊查询列表选中更新

    }

    //客服列表
    function getWaitersList() {
        model.getWaiterList("", function (data) {

            data = {
                waitersList: data,
            }
            var html = bt('tmlWaiters', data);
            model.$_dom.tmlWaiters.html(html); // 渲染客服列表
        }, function () {
            layer.msg("客服列表获取失败", {icon: 2})
        });

    }

    // *切换用户渲染函数
    function init($_this) {

        $("#planClose").trigger("click");// 隐藏方案弹窗
        // 控制左侧li标签的选中状态
        $("#testDiv li").removeClass("current_im");
        $($_this).addClass("current_im");

        // uId的数据起源
        var $_this = $($_this);
        var userInfo = $_this.data("userInfo");

        model.$_statis.userInfo.uId = userInfo.uId; // 更新全局的当前会话的uId
        model.$_statis.userInfo.currentSsId = userInfo.ssId; // 更新全局的当前会话的ssId
        model.$_statis.msgPage.pages = 1; // 初始化历史会话页面
        model.$_statis.userInfo.ssState = userInfo.ssState; // 当前用户的会话状态设置

        // 清空上个用户的信息
        emptyLastInfo();
        // 渲染IM聊天框里的信息
        initIMPage();
        // 渲染右侧所有信息
        initRightPage(userInfo);
        // 判断客服权限

    }

    function waiterRoot() {
        var waiterInfo = JSON.parse(localStorage.getItem("waiterInfo"));

        if (waiterInfo.rPermisssion.slice(0, 1) == "1") {

            $("#rootWaiter").show();
            $("#commonWaiter").remove();

        } else {

            $("#rootWaiter").remove();
            $("#commonWaiter").show();
        }
    }

    // *渲染IM界面
    function initIMPage() {

        model.$_dom.imHistory.show();
        model.$_dom.imComment.show();

        // 显示内容部分
        // 获取该用户的历史聊天信息
        model.getUserHistoryMsg({
            sessionId: model.$_statis.userInfo.currentSsId,
            pageNo: model.$_statis.msgPage.pages,
            pageSize: model.$_statis.msgPage.msgPageSize

        }, function (data) {


            model.$_statis.msgPage.pages += 1; // 当前历史会话页码+1
            addMsgToPage(data);
            // 如果状态为2，表示已经结束了会话，此时应该添加结束会话的模板
            if (model.$_statis.userInfo.ssState == 2) {

                if ($("#againJoin").length == 0) {
                    var html =
                        '<div class="item" style="margin-top: 120px;margin-bottom: 30px;">\
                            <div class="again_join" style="margin:0 auto;padding: 0px 24px;font-size: 14px;line-height: 42px;height: 42px;background: #E2E8E8;border-radius: 21px;">\
                                <i class="lab-tip" style="color: #2fcba8;vertical-align: middle;"></i>\
                                <span id="againJoin" style="color: #7a7a7a;padding-left: 10px">会话已结束，你可以<s style="color: #2fcba8;cursor: pointer;font-weight: 700;" onclick="controlHome.joinAgain(this)">重新接入</s></span>\
                            </div>\
                         </div>';
                    $("#msgContent").append(html);
                }

            }
            $('#msgContent').scrollTop($('#msgContent')[0].scrollHeight); // 滚动到最底端


        }, function (data) {

            layer.msg("本次历史消息获取失败！");
        })


    }

    // *渲染历史消息的函数(首次进入时加载，)
    function addMsgToPage(data) {

        //data数据格式
        data = {
            msgList: data.content.reverse()
        }

        var html = bt('tmlMsg', data);
        model.$_dom.imHistory.after(html); // 渲染历史消息
        //$('#msgContent').scrollTop($('#msgContent')[0].scrollHeight); // 控制滚动条每次都显示最底端
        //controlMsgScroll(topUploadHistoryCb); // 上滑加载更多（暂时不做）

    }

    // *渲染右侧页面
    function initRightPage(userInfo) {

        model.$_dom.rightInfo.show(); // 显示右侧信息
        // 渲染用户信息tab
        initUserInfo();

        // 渲染项目tab
        initProjectList(userInfo);
        // 渲染订单tab内容
        initOrderPage(userInfo);
    }

    // *初始化用户信息页面
    function initUserInfo() {

        model.getUserInfo({
            uId: model.$_statis.userInfo.uId
        }, function (data) {

            var uAvatar = data.uAvatar ? data.uAvatar : "../imgs/other/person_default.jpg";
            model.$_dom.userInfoAvatar.attr("src", uAvatar); // 初始化为访客头像
            model.$_dom.suerInfoNackname.text(data.uNickName); // 初始化为访客名字
            model.$_dom.userSpanName.text(data.uName);
            model.$_dom.userSpanPhone.text(data.uPhone);
            model.$_dom.userSpanCompany.text(data.uOrgName);
            model.$_dom.userSpanAdress.text(data.uDetailAddress);

            $("#saveInfo").data("orgId", data.uOrgId);

        }, function () {

            layer.msg("用户信息获取失败", {icon: "2"});

        })

    }

    // *初始化项目模块页面
    function initProjectList(userInfo, location) {
        $("#pjctSelect").show()
        // 渲染项目下拉列表
        model.getPjList({
            uId: userInfo.uId

        }, function (data) {

            $("#pjctSelect").removeClass("active_bar"); // 移除下拉列表的默认选项
            $("#pjctSelect ul").hide(); // 隐藏UL列表
            model.$_dom.projectSelectLis.empty();
            if (data.length > 0) {

                var activeIndex = 0;
                if (location && location === "last") {

                    model.$_dom.projectTitle.text(data[data.length - 1].pjName); // 标题默认渲染首项

                    //renderPlan renderPlan(model.$_statis.userInfo.currentPjId);// 默认渲染首项的方案
                    renderPlan(data[data.length - 1].pjId); // 默认渲染首项的方案
                    activeIndex = data.length - 1;

                } else {

                    model.$_dom.projectTitle.text(data[0].pjName); // 标题默认渲染首项
                    renderPlan(data[0].pjId); // 默认渲染首项的方案
                }

                for (var i = 0; i < data.length; i++) {
                    var node = "";

                    if (i === activeIndex) {
                        node = $('<li class="activated">' + labUtil.getStrWithLength(data[i].pjName, 9) + '</li>');

                    } else {
                        node = $('<li>' + labUtil.getStrWithLength(data[i].pjName, 12) + '</li>');
                    }
                    node.data("projectData", {
                        pjId: data[i].pjId,
                        pjName: data[i].pjName
                    })

                    model.$_dom.projectSelectLis.append(node);

                }

                // 绑定li选中事件
                // 项目列表的li标签的需要绑定data projectData
                controlHome.bindSelect($("#pjctSelect"), function ($_this) {

                    model.$_statis.userInfo.currentPjId = $_this.data("projectData").pjId;
                    renderPlan($_this.data("projectData").pjId); // 重新渲染列表

                });

            } else {

                model.$_dom.projectTitle.text("暂无项目");
                controlHome.bindSelect($("#pjctSelect"), function ($_this) {

                    model.$_statis.userInfo.currentPjId = $_this.data("projectData").pjId;
                    renderPlan($_this.data("projectData").pjId); // 重新渲染列表

                });
            }

        }, function (data) {

            layer.msg("项目获取失败", {
                icon: "2"
            })

        })

    }

    // *渲染方案
    function renderPlan(pjId) {

        model.getPlan({pjId: pjId}, function (data) {

            model.$_dom.addPlanBtn.show(); // 隐藏计划按钮
            model.$_dom.sendPlanBtn.show(); // 隐藏发送方案按钮

            var data = {
                planList: data
            }

            var html = bt('tmlPlan', data);
            model.$_dom.planList.html(html);

        }, function () {

            layer.msg("方案加载失败", {
                icon: "2"
            })

        })

    }

    // *初始化订单模块页面
    function initOrderPage(userInfo) {

        var lastLis = model.$_dom.orderSelect.find("li"); // 上次的lis列表
        var index = 0; // 默认渲染的订单
        // 判断是否有上次的记忆状态（渲染上次那个选项）
        if (lastLis.length > 0) {
            for (var j = 0; j < lastLis.length; j++) {
                $(lastLis[j]).hasClass("activated") ? index = j : "";
            }
        }

        model.$_dom.orderSelect.empty();

        // 获取订单项目列表
        //userInfo= {uId:12}
        model.getOrderPjList({

            uId: userInfo.uId

        }, function (data) {

            // 订单的下拉列表渲染
            if (data.length > 0) {


                for (var i = 0; i < data.length; i++) {
                    var node = "";

                    if (i === index) {

                        node = $('<li class="activated">' + data[i].schProject + '</li>');

                    } else {
                        node = $('<li>' + data[i].schProject + '</li>');
                    }

                    node.data("orderInfo", data[i])

                    model.$_dom.orderSelect.append(node);
                }


                model.$_dom.orderTitle.text(data[index].schProject);
                // 绑定li选中事件
                // 项目列表的li标签的需要绑定data projectData
                // 渲染订单部分列表
                controlHome.bindSelect($("#orderSelect"), function ($_this) {
                    initOrderPage(model.$_statis.userInfo);
                });

                // 根据列表渲染方案
                renderOrder(data[index]);

            } else {
                model.$_dom.orderTitle.text("暂无订单");
            }

        }, function (data) {
            // 请求失败的回调
        });
    }

    // render更新控件（局部渲染控件）
    function renderOrder(orderInfo) {


        model.$_dom.orderList.data("orderInfo", orderInfo); // 绑定订单ID，用于订单操作
        model.$_dom.orderList.css("display", "block");
        model.$_dom.orderId.text(orderInfo.oNo); // 订单ID
        model.$_dom.orderCreateTime.text(labUtil.getTime(orderInfo.createTime)); // 创建时间
        model.$_dom.orderStandard.text(orderInfo.schStandard); // 使用标准
        model.$_dom.orderFacilityName.text(orderInfo.schInstrument); // 使用仪器
        model.$_dom.orderGrant.text(orderInfo.schQualifications); // 资质授权
        model.$_dom.orderPeriod.text(orderInfo.schPeriod); // 周期
        model.$_dom.orderDistance.text(orderInfo.schDistance + "KM"); // 距离text

        if (orderInfo.oPrice == 0) {
            model.$_dom.orderPrice.text("面议"); // 价格
        } else {
            model.$_dom.orderPrice.text("￥" + (orderInfo.oPrice / 100).toFixed(2)); // 价格
        }

        // 订单状态渲染
        if (orderInfo.oState == 0) {
            model.$_dom.orderStatus.text("进行中"); // 订单状态
            model.$_dom.cfmOrder.show();
            model.$_dom.cancelOrder.show();
            model.$_dom.alterPrice.show();

        } else {

            model.$_dom.alterPrice.hide();
            // 移除确认订单按钮
            orderInfo.oState == 1 ? model.$_dom.orderStatus.text("已完成") : model.$_dom.orderStatus.text("已关闭");
            model.$_dom.cfmOrder.hide();
            model.$_dom.cancelOrder.hide();

        }

        // 是否提供样品制备服务
        orderInfo.schOfferService == 0 ? model.$_dom.orderService.text("否") : model.$_dom.orderService.text("是");

    }

    // *清空，聊天页面，以及右侧所有和上个客服有关的信息（之前动态渲染的所有信息）;
    function emptyLastInfo() {


        //model.$_dom.msgContent.empty();// 清空聊天框姓名
        model.$_dom.msgContent.find("div").not("#historyBtn").each(function () {
            $(this).remove();
        });


        // 清空除历史消息BTN以外的其他div

        model.$_dom.imName.empty() // 清空消息内容显示
        model.$_dom.textarea.val(""); // 清空聊天框信息


        // 清空用户信息tab
        model.$_dom.userIptName.val("");
        model.$_dom.userIptPhone.val("");
        model.$_dom.userIptCompany.val("");
        model.$_dom.userIptAdress.val("");

        model.$_dom.userSpanName.empty();
        model.$_dom.userSpanPhone.empty("");
        model.$_dom.userSpanCompany.empty("");
        model.$_dom.userSpanAdress.empty("");
        $("#changeUserInfo").show();
        $("#iptInfo").hide();

        // 右侧用户设置默认信息
        model.$_dom.userInfoAvatar.attr("src", "../imgs/other/person_default.jpg"); // 初始化为访客头像
        model.$_dom.suerInfoNackname.text("访客"); // 初始化为访客名字


        // 清空项目下拉列表
        //$("#pjctSelect").hide();
        model.$_dom.projectTitle.text("");
        model.$_dom.projectSelectLis.empty();

        // 清空方案
        model.$_dom.planList.empty();
        model.$_dom.addPlanBtn.hide(); // 隐藏计划按钮
        model.$_dom.sendPlanBtn.hide(); // 隐藏发送方案按钮

        // 隐藏订单部分项目列表
        //$("#orderSelect").hide();

        model.$_dom.orderTitle.text("暂无订单"); // 标题信息填充
        model.$_dom.orderSelect.empty(); // 清空订单下拉项填充

        // 隐藏订单信息卡片
        model.$_dom.orderList.css("display", "none");
        model.$_dom.orderStatus.text(""); // 订单状态
        model.$_dom.orderId.text(""); // 订单ID
        model.$_dom.orderCreateTime.text(""); // 创建时间
        model.$_dom.orderStandard.text(""); // 使用标准
        model.$_dom.orderFacilityName.text(""); // 使用仪器
        model.$_dom.orderGrant.text(""); // 资质授权
        model.$_dom.orderPeriod.text(""); // 周期
        model.$_dom.orderService.text(""); // 是否提供样品制备服务
        model.$_dom.orderDistance.text(""); // 距离text
        model.$_dom.orderPrice.text(""); // 价格
    }

    //渲染左侧已接入用户列表
    function initSessionList(params) {

        // params格式
        model.getSessionList(params, function (data) {
            var flag = false;
            //设置已接入人数气泡
            $("#joinedGad").text(data.total);

            data = {
                sessionList: data.content
            }

            for (var i = 0; i < data.sessionList.length; i++) {

                // 判断当前会话的用户还存不存在
                if (data.sessionList[i].uId == model.$_statis.userInfo.uId) {
                    flag = true;
                    //if (data.sessionList[i].ssState === 2) {
                    //
                    //
                    //}

                }


            }

            // 如果当前用户已经超过30分钟，应该触发关闭按钮

            if (!flag) {
                //$("#closeCurrentMsg").trigger("click");
                model.$_dom.imComment.hide(); // 隐藏聊天页面
                model.$_dom.rightInfo.hide(); // 隐藏右侧
            }

            var html = bt('tmlSessionList', data);
            model.$_dom.sessionList.html(html);

        }, function (data) {

            layer.msg('接入列表刷新失败！', {
                icon: "2"
            });

        });

    }

    // 渲染待接入用户列表
    function initAwaitPage(params) {

        model.getCustomersList(params, function (data) {

            // 设置已待接入人数气泡
            $("#awaitGad").text(data.total);
            var html = bt('tmAwaitList', {
                awaitList: data.content
            });

            model.$_dom.awaitList.html(html);

        }, function (data) {

            layer.msg("获取待接入客服失败！", {icon: 2})

        })

    }

    // 隐藏右侧所有列表
    function hideRight() {
        model.$_dom.imComment.hide(); // 隐藏聊天页面
        model.$_dom.rightInfo.hide(); // 隐藏右侧
    }

    // 页面按钮绑定
    function btnBind() {

        // 点击个人信息修改
        $("#alterInfo").on("click", function () {

            $("#changeUserInfo").hide();
            $("#iptInfo").show();
            model.$_dom.userIptName.val(model.$_dom.userSpanName.text());
            model.$_dom.userIptPhone.val(model.$_dom.userSpanPhone.text());
            model.$_dom.userIptCompany.val(model.$_dom.userSpanCompany.text());
            model.$_dom.userIptAdress.val(model.$_dom.userSpanAdress.text());

        });

        // 点击保存修改个人信息
        $("#saveInfo").on("click", function () {

            $("#changeUserInfo").show();
            $("#iptInfo").hide();

            var newInfo = {
                "uId": model.$_statis.userInfo.uId,
                "uName": model.$_dom.userIptName.val(),
                "uPhone": model.$_dom.userIptPhone.val(),
                "uDetailAddress": model.$_dom.userIptAdress.val(),
                "uOrgName": model.$_dom.userIptCompany.val(),
                "orgIds": $(this).data("orgId")
            }

            model.changeUserInfo(newInfo, function () {

                layer.msg("用户信息已更新", {icon: 1});
                model.$_dom.userSpanName.text(newInfo.uName);
                model.$_dom.userSpanPhone.text(newInfo.uPhone);
                model.$_dom.userSpanCompany.text(newInfo.uOrgName);
                model.$_dom.userSpanAdress.text(newInfo.uDetailAddress);

            }, function () {

                layer.msg("修改失败", {icon: 2});
            })

        });

        // 添加项目
        $("#addProject").off().on("click", function (event) {

            event.stopPropagation();
            if (event.target.tagName.toLowerCase() === "i") {

                var html =
                    '<div style="width: 300px;box-shadow: 1px 1px 50px rgba(0,0,0,.3);">\
                        <p style="background: #2FCBA8;height: 40px;line-height: 40px;color: #fff;">\
                            <span style="padding-left: 10px;font-size: 16px;">添加新项目</span>\
                        </p>\
                        <p  style="padding: 10px 10px 10px 10px;">\
                            <input id="addPjInput" type="text" maxlength="30" style="outline: none;height: 30px;width: 100%;">\
                        </p>\
                        <p  style="padding: 0px 10px 10px 10px;" >\
                            <button id="sure" type="button" style="height: 30px;width: 137px;outline: none;border: 0 none;background-color: #2FCBA8;color: #fff;cursor: pointer; ">确定</button>\
                            <button id="cancel" type="button" style="height: 30px;width: 137px;outline: none;background-color: #CCCCCC;border:0 none; color: #000;cursor: pointer;">取消</button>\
                        </p>\
                    </div>';

                var layer1 = layer.open({
                    type: 1,
                    title: false,
                    closeBtn: 0,
                    shadeClose: true,
                    skin: 'yourclass',
                    content: html
                });

                $("#sure").on("click", function () {
                    var text = $("#addPjInput").val();

                    // 获取项目名称
                    if (text === "") {
                        layer.msg("项目名称不能为空");
                    } else {


                        var params = {
                            uUid: model.$_statis.userInfo.uId,
                            pjName: text
                        }

                        model.addProject(params, function (data) {

                            // 成功后重新渲染项目列表和方案列表
                            initProjectList(model.$_statis.userInfo, "last");
                            layer.close(layer1); // 关闭该弹窗

                        }, function (data) {

                            layer.msg("添加失败", {icon: "2"});

                        })

                    }


                });

                $("#cancel").on("click", function () {
                    layer.close(layer1); // 关闭该弹窗
                });
            }

        });


        // 弹窗1提交,发布为一条新的方案
        $("#planSubmit").on("click", function () {

            var distance = $("#planDistance").val() - 0;
            distance = distance.toFixed(1);

            var params = {
                pjId: "", // 项目ID(*)
                schProject: "", // 项目名称
                schOrganization: $("#jianCeJiGou").val(), // 机构
                schStandard: $("#shiYongBiaoZhun").val(), // 标准
                schInstrument: $("#shiYongYiQi").val(), // 仪器
                schQualifications: $("#ziZhiShouQuan").val(), // 授权
                schPeriod: $("#xiangMuZhouQi").val(), // 周期
                schOfferService: $("#yangpin input:checked").val(), // 是否提供样品制备服务
                schPrice: (($("#planPrice").val() - 0).toFixed(2)) * 100, // 价格
                schDistance: distance, // 距离
                schPraise: $("#starts").data("score") + "", // 口碑
                schFeature: "", // 特色(*)
                schVersion: 0 // 是否显示（1不显示，0显示）
            }

            // 获取pjId
            $("#pjctSelect ul  li").each(function () {

                if ($(this).hasClass("activated")) {
                    params.pjId = $(this).data("projectData").pjId;
                    params.schProject = $(this).data("projectData").pjName;
                }
            })

            $("#planSelect ul li").each(function () {

                if ($(this).hasClass("activated")) {
                    params.schFeature = $(this).data("index");

                }

            })

            // 发送添加方案的请求
            model.addPlan(params, function () {

                layer.msg('方案添加成功', {
                    icon: "1"
                });

                // 调取刷新方案列表
                renderPlan(params.pjId);

                //　隐藏列表
                controlModal.hidePlanMenu();

            }, function () {
                layer.msg('方案添加失败', {
                    icon: "2"
                });
            })
        });

        function checkNumberInput(str, reg) {
            if (new RegExp(reg).test(str)) {
                return true;
            } else if (str == "Backspace") {
                return true;
            } else {
                return false;
            }
        }

        // 弹窗1：点击关闭时隐藏
        $("#planClose").on("click", function (e) {
            controlModal.hidePlanMenu();
            e.stopPropagation();

        });
        $("#planClose").on("mousedown", function (e) {
            e.stopPropagation();
        });

        // 弹窗1：点击添加方案按钮
        $("#addPlan").on("click", function () {
            controlModal.showPlanMenu();
        });

        $("#xiangMuZhouQi").on("input", function () {
            var field = $("#xiangMuZhouQi").val();

            if (field * 1 < 0 || field * 1 > 200) {
                $("#xiangMuZhouQi").val("");
            }
        });

        $("#xiangMuZhouQi").on("keydown", function (e) {
            var keycode = e.keyCode;
            if (keycode > 47 && keycode < 58 || keycode > 95 && keycode < 105 || keycode == 8 || keycode > 36 && keycode < 41) {
                return true;
            }
            return false;
        });

        $("#planPrice").on("input", function () {
            var field = $("#planPrice").val();

            if (field * 1 < 0 || field * 1 > 999999999) {
                $("#planPrice").val("");
            }
        });

        $("#planPrice").on("keydown", function (e) {
            if (e.keyCode == 110) {
                var field = $("#planPrice").val();

                if (field.indexOf(".") != -1) {
                    return false;
                }
            }
            //var keycode = e.keyCode;
            if (labUtil.splitNumber(e, 2)) {
                return true
            } else {
                return false;
            }
            return false;
        });

        $("#planDistance").on("input", function () {
            var field = $("#planDistance").val();
            if (field * 1 < 0 || field * 1 > 6000) {
                $("#planDistance").val("");
            }
        });

        $("#planDistance").on("keydown", function (e) {
            //var keycode = e.keyCode;
            //if(keycode > 47 && keycode < 58 || keycode > 95 && keycode < 105 || keycode == 8 || keycode > 36 && keycode < 41 || keycode == 110){
            //    return true;
            //}
            if (e.keyCode == 110) {
                var field = $("#planDistance").val();

                if (field.indexOf(".") != -1) {
                    return false;
                }
            }
            if (labUtil.splitNumber(e, 2)) {
                //console.log("true");
                return true
            } else {
                //console.log("false");
                return false;
            }
            return false;
        });

        // 发送方案给用户
        $("#sendPlan").on("click", function () {

            var $_inputs = model.$_dom.planList.find(".plan_item label input:checked");
            var schIds = [];

            $_inputs.each(function (index) {
                schIds.push($(this).parent().parent().parent().parent().find(".alter_plan i").data("planInfo").schId);
            })

            var params = {
                uId: model.$_statis.userInfo.uId,
                schId: schIds
            }

            if ($_inputs.length > 5) {
                var layer2 = layer.alert('最多只能推送5条方案，确认重新选择', {

                    skin: 'layui-layer-molv',
                    closeBtn: 0,
                    title: "错误操作"

                }, function () {
                    layer.close(layer2);
                });

            } else if ($_inputs.length <= 0) {

                var layer3 = layer.alert('请至少选择1个方案，确认重新选择', {

                    skin: 'layui-layer-molv',
                    closeBtn: 0,
                    title: "错误操作"

                }, function () {

                    layer.close(layer3);

                });

            } else {

                // 正常情况下，发送请求
                model.pushPlan(params, function () {

                    $("#planItemBar label > input:checked").trigger("click");

                    layer.msg('方案推送成功', {
                        icon: "1"
                    });

                }, function () {

                    layer.msg('推送失败，请重新尝试', {
                        icon: "2"
                    });

                })
            }

        })

        // 获取更多历史消息（触发：上拉滚动条，点击查看更多）
        $("#historyBtn").on("click", function () {

            model.getUserHistoryMsg({
                sessionId: model.$_statis.userInfo.currentSsId,
                pageNo: model.$_statis.msgPage.pages,
                pageSize: model.$_statis.msgPage.msgPageSize

            }, function (data) {

                if (data.content.length > 0) {

                    model.$_statis.msgPage.pages += 1; // 当前历史会话页码+1
                    addMsgToPage(data); // 添加新数据到历史消息

                } else {
                    model.$_dom.imHistory.hide();
                }


            }, function () {
                layer.msg("历史消息加载失败", {
                    icon: "2"
                })
            })
        })

        // 关闭聊天按钮事件
        $("#closeCurrentMsg").on("click", function () {

            controlModal.hidePlanMenu();
            if (model.$_statis.userInfo.ssState == 1) {

                model.endMsg({
                    "ssId": model.$_statis.userInfo.currentSsId,
                    "ssState": 2
                }, function (data) {

                    if (data.code === 0) {

                        model.$_statis.userInfo.uId = 0;
                        model.$_statis.userInfo.currentSsId = 0; // 当前的会话ID置为零
                        model.$_statis.userInfo.ssState = 0;
                        model.$_dom.imComment.hide(); // 隐藏聊天页面
                        model.$_dom.rightInfo.hide(); // 隐藏右侧

                    }

                }, function (data) {

                    layer.msg("结束会话操作失败");
                })

            } else if (model.$_statis.userInfo.ssState == 2) {

                model.$_dom.imComment.hide(); // 隐藏聊天页面
                model.$_dom.rightInfo.hide(); // 隐藏右侧
            }

        })

        $("#logout").on("click", function () {

            //询问框
            layer.confirm('确认退出？', {

                btn: ['确认', '取消'], //按钮
                title: "提示信息"

            }, function () {

                model.logout("", function () {

                    layer.msg("客服成功退出，即将跳转登录页面");
                    localStorage.removeItem("waiterInfo");
                    setTimeout(function () {
                        window.location.href = "../../bg/page/login.do";
                    }, 500)

                }, function () {

                    layer.msg("退出操作失败");

                });
            });


        })

        // 点击订单tab重新渲染订单
        $("#waiterOrderTab").on("click", function () {
            initOrderPage(model.$_statis.userInfo);

        })

        $("#compInfoIpt").on("input", function () {

            model.fuzzySearchCompany({

                orgName: $(this).val()

            }, function (data) {
                $("#companyList").show();
                var html = "";
                $.each(data, function (i) {
                    html += '<li onclick="controlHome.updateCompany(this,' + this.orgId + ')" >' + this.orgName + '</li>';
                });

                $("#companyList").html(html);

            }, function () {

                console.log("模糊查询相似公司请求失败");

            })
        })

        $("#compInfoIpt").on("blur", function () {
            setTimeout(function () {
                $("#companyList").hide();
            }, 300)

        })

    }

    // 轮询开关（开启轮询）
    function switchOn() {

        $("#waiterName").text(JSON.parse(localStorage.getItem("waiterInfo")).csName);

        // 轮询最新消息
        setInterval(function () {
            // 当前的会话ID不为0时,
            if (model.$_statis.userInfo.currentSsId && model.$_statis.userInfo.ssState === 1) {
                model.getNewMsg({
                    sessionId: model.$_statis.userInfo.currentSsId

                }, function (data) {

                    if (data.length > 0) {

                        data = {
                            newMsgList: data
                        }

                        // 渲染新消息到页面上
                        var html = bt('newMsg', data);
                        model.$_dom.msgContent.append(html); // 渲染历史消息
                        $('#msgContent').scrollTop($('#msgContent')[0].scrollHeight); // 滚动条滚动到最底端

                    }

                }, function () {

                    layer.msg("用户新消息获取失败", {
                        icon: "2"
                    })

                })
            }


        }, 2000)

        // 轮询左侧列入列表
        setInterval(function () {

            initSessionList({
                pageNo: 1,
                pageSize: 100
            });

        }, 3000)

        // 轮询客服管理系统
        setInterval(function () {

            initAwaitPage({
                pageNo: 1,
                pageSize: 100
            });

        }, 8000)

        // 测试环境
        //setInterval(function () {
        //    $("#testShow").text("uId:" + model.$_statis.userInfo.uId + "ssState:" + model.$_statis.userInfo.ssState + "SsId" + model.$_statis.userInfo.currentSsId)
        //}, 1000)


    };

    // 初始化待接入页面
    initAwaitPage({
        pageNo: 1,
        pageSize: 100
    });

    // 初始化接入列表
    initSessionList({
        pageNo: 1,
        pageSize: 100
    });

    //controlModal.showPlanMenu();

    //获取客服列表
    getWaitersList();
    // 事件初始化
    btnBind();
    ControlHome.bindTextarea();
    switchOn(); // 轮询
    waiterRoot(); // 客服权限控制
    // *绑定主页Tab事件
    ControlHome.tabToCard({

        tab: $("#tab_im,#tab_await,#tab_setting,#tab_coupon"),
        activeClass: "active"

    }, function (data) {


        if (data.cardId === "coupon") {
            $("#searching").trigger("click");
        }
        $("#planClose").trigger("click");
    });

    // *右侧选项卡tab
    ControlHome.tabToCard({
        tab: $("#waiterInfoTab,#waiterProjectTab,#waiterOrderTab"),
        activeClass: "order_tab_active"
    });

    controlModal.dragModal($("#planTitle"), $("#appPlanModal"));

    // 订单下拉列表绑定
    ControlHome.bindSelect($("#orderSelect"));
    // 方案部分下拉列表绑定
    ControlHome.bindSelect($("#planSelect"))

    return ControlHome;

})($);

var controlHome = new ControlHome();

