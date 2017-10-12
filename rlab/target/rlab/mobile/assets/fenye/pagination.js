var PAGE_SIZE = 20;//每页显示的条数
var current = 1;

/*
 *显示分页
 *total 总条数
 *from 起始位置
 *max 每页显示的条数
 *current 当前页数
 */
/**
 * 控制分页显示（jsp和ajax通用）
 * @param total 记录总条数
 * @param from 当前显示页起始位置（0开始）
 * @param max 当前显示多少条
 * @param callback 切换页码（下一页、直接点击、直接搜索页码）时成功的回调（JSP为跳转新页码，ajax为局部获取数据并且刷新）
 * @param ContainerId HTML部分的分页容器div的id名
 * @return void
 * @since 使用时应先引入jquery库
 * @author 徐志响[2017-05-15 mr_xuxiaoxiang@163.com]
 * @version v1.0.1
 * @example 示例：
 * ------------------------------------
 *
 * ** HTML容器示例
 * <div id="page_container"></div>
 *
 * ** JS调用示例
 *  showPages(100, 0, 5,function (){
 *     location.href="...."
 *  }, "page_container");
 *
 *-------------------------------------
 *
 */
// 分页样式1
function showPages(total, from, max, callback, ContainerId) {

    var count = 0;// 总页数
    current = from / max + 1;//当前页
    var blocksize = 5;//连续显示的块数
    //计算出总页数
    if (total % max == 0) {
        count = parseInt(total / max);
    } else {
        count = parseInt(total / max) + 1;
    }
    $('#' + ContainerId).empty();

    // 上一页
    //$prev = $("<li '><a><span class='lab-godTime'></span></a></li>");
    $prev = $("<button class='items pre' id='prePage' type='button'><span>上一页</span></button>");

    if (current == 1) {
        $prev.addClass('prev disabled');
        $prev.attr({"disabled":"disabled"});
    } else {
        $prev.removeClass('prev disabled');
        $prev.removeAttr("disabled");//将按钮可用
    }

    $prev.click(function () {
        pageClick(max, current - 1, callback);
    });

    $prev.appendTo('#' + ContainerId);

    // 中间数字按钮
    // if (count < blocksize + 1) {
    //
    //     for (var i = 1; i < count + 1; i++) {
    //         $page = $("<li><a>" + i + "</a></li>");
    //
    //         $page.click(function () {
    //             var pagenum = $(this).text();
    //             pageClick(max, pagenum, callback);
    //         });
    //
    //         if (current == i) {
    //             $page.addClass('active');
    //         }
    //
    //         $page.appendTo('#' + ContainerId);
    //     }
    //
    // } else {
    //     if (current < blocksize) {
    //         for (var i = 1; i < blocksize + 1; i++) {
    //             $page = $("<li><a>" + i + "</a></li>");
    //             $page.click(function () {
    //                 var pagenum = $(this).text();
    //                 pageClick(max, pagenum, callback);
    //             });
    //             if (current == i) {
    //                 $page.addClass('active');
    //             }
    //             $page.appendTo('#' + ContainerId);
    //         }
    //         $page = $("<li style='border:0 none;''><a>...</a></li>");
    //         $page.appendTo('#' + ContainerId);
    //         $page = $("<li><a>" + count + "</a></li>");
    //         $page.click(function () {
    //             var pagenum = $(this).text();
    //             pageClick(max, pagenum, callback);
    //         });
    //         $page.appendTo('#' + ContainerId);
    //     } else if (current <= count - blocksize + 1) {
    //         $page = $("<li><a>" + 1 + "</a></li>");
    //         $page.click(function () {
    //             var pagenum = $(this).text();
    //             pageClick(max, pagenum, callback);
    //         });
    //         $page.appendTo('#' + ContainerId);
    //         $page = $("<li style='border:0 none;''><a>...</a></li>");
    //         $page.appendTo('#' + ContainerId);
    //
    //         for (var i = current - 2; i < current + 3; i++) {
    //             $page = $("<li><a>" + i + "</a></li>");
    //             $page.click(function () {
    //                 var pagenum = $(this).text();
    //                 pageClick(max, pagenum, callback);
    //             });
    //             if (current == i) {
    //                 $page.addClass('active');
    //             }
    //             $page.appendTo('#' + ContainerId);
    //         }
    //
    //         $page = $("<li style='border:0 none;''><a>...</a></li>");
    //         $page.appendTo('#' + ContainerId);
    //         $page = $("<li><a>" + count + "</a></li>");
    //         $page.click(function () {
    //             var pagenum = $(this).text();
    //             pageClick(max, pagenum, callback);
    //         });
    //         $page.appendTo('#' + ContainerId);
    //     } else {
    //         $page = $("<li><a>" + 1 + "</a></li>");
    //         $page.click(function () {
    //             var pagenum = $(this).text();
    //             pageClick(max, pagenum, callback);
    //         });
    //         $page.appendTo('#' + ContainerId);
    //         $page = $("<li style='border:0 none;''><a>...</a></li>");
    //         $page.appendTo('#' + ContainerId);
    //         for (var i = count - blocksize + 1; i < count + 1; i++) {
    //             $page = $("<li><a>" + i + "</a></li>");
    //             $page.click(function () {
    //                 var pagenum = $(this).text();
    //                 pageClick(max, pagenum, callback);
    //             });
    //             if (current == i) {
    //                 $page.addClass('active');
    //             }
    //             $page.appendTo('#' + ContainerId);
    //         }
    //     }
    // }

    //下一页
    //$next = $("<li class='items'><a><span class='lab-godTime'></span></a></li>");
    $next = $("<button id='nextPage' class='items next'><span>下一页</span></button>");

    if (current == count) {
        $next.addClass('next disabled');
        $next.attr({"disabled":"disabled"});
    } else {
        $next.removeClass('prev disabled');
        $next.removeAttr("disabled");//将按钮可用
    }

    $topage = $('<li style="display: block;" class="page_seach" style="padding-left:5px">' + current + '/'+ count + '</li>');
    $topage.find('button').click(function (event) {
        var aimPage = $topage.find('input').val();
        if (aimPage != "" && aimPage <= count && aimPage > 0) {
            pageClick(max, aimPage, callback);
        }
    });

    $next.click(function () {
        pageClick(max,  current + 1, callback);
    });

    $next.appendTo('#' + ContainerId);
    $topage.appendTo('#' + ContainerId);
}

/*
 * 点击事件
 */
function pageClick(max, current, callback) {
    console.log({
        max:max,
        current:current,
        callback:callback
    })
    var from = max * (current - 1);
    callback(from, max);
}

// 刷新当前页面
function VC(max, current, callback) {
    var from = max * (current - 1);
    callback(from, max);
}