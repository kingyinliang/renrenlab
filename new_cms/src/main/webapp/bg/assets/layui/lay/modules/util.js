/** layui-v1.0.9_rls MIT License By http://www.layui.com */
;layui.define("jquery", function (l) {
    "use strict";
    var o = layui.jquery, i = {
        fixbar: function (l) {
            l = l || {}, l.bgcolor = l.bgcolor ? "background-color:" + l.bgcolor : "";
            var i, a, c = "layui-fixbar-top", t = [l.bar1 === !0 ? "&#xe606;" : l.bar1, l.bar2 === !0 ? "&#xe607;" : l.bar2, "&#xe604;"], r = o(['<ul class="layui-fixbar">', l.bar1 ? '<li class="layui-icon" lay-type="bar1" style="' + l.bgcolor + '">' + t[0] + "</li>" : "", l.bar2 ? '<li class="layui-icon" lay-type="bar2" style="' + l.bgcolor + '">' + t[1] + "</li>" : "", '<li class="layui-icon ' + c + '" lay-type="top" style="' + l.bgcolor + '">' + t[2] + "</li>", "</ul>"].join("")), e = r.find("." + c), s = function () {
                var i = o(document).scrollTop();
                i >= (l.showHeight || 200) ? a || (e.show(), a = 1) : a && (e.hide(), a = 0)
            };
            o(".layui-fixbar")[0] || ("object" == typeof l.css && r.css(l.css), o("body").append(r), s(), r.find("li").on("click", function () {
                var i = o(this), a = i.attr("lay-type");
                "top" === a && o("html,body").animate({scrollTop: 0}, 200), l.click && l.click.call(this, a)
            }), o(document).on("scroll", function () {
                i && clearTimeout(i), i = setTimeout(function () {
                    s()
                }, 100)
            }))
        }
    };
    l("util", i)
});