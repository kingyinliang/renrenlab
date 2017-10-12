var address = null;

/**
 * 无参数加载script
 * @param addr
 */
function loadJScript(addr) {
    address = addr;
    var script = document.createElement("script");
    script.type = "text/javascript";
    script.src = "https://api.map.baidu.com/api?v=2.0&ak=ZlEwMqIMtChz8MEj1mV6Tc6v&callback=initMap&s=1";
    document.body.appendChild(script);
}

/**
 * 根据参数或者经纬度加载Sscript
 * @param addr
 * @param x
 * @param y
 */
function loadJScriptMove(addr, x, y) {
    address = addr;
    var script = document.createElement("script");
    script.type = "text/javascript";
    script.src = "https://api.map.baidu.com/api?v=2.0&ak=ZlEwMqIMtChz8MEj1mV6Tc6v&callback=initMapMove(" + x + "," + y + ")&s=1";
    document.body.appendChild(script);
}

// var map = new BMap.Map("map");    // 创建Map实例
// map.centerAndZoom(new BMap.Point(116.404, 39.915), 11);  // 初始化地图,设置中心点坐标和地图级别
// map.addControl(new BMap.MapTypeControl());   //添加地图类型控件
// map.setCurrentCity("北京");          // 设置地图显示的城市 此项是必须设置的
// map.enableScrollWheelZoom(true);
//

/**
 * 初始化Map
 */
function initMap(address) {
    // 初始化
    var map = new BMap.Map("baidumap");
    map.centerAndZoom(new BMap.Point(116.404, 39.915), 11);
    map.addControl(new BMap.MapTypeControl());   //添加地图类型控件
    map.enableScrollWheelZoom(true);
    map.enableDragging();
    map.setCurrentCity(address);
    // 设置地图显示的城市 此项是必须设置的

    // var geoc = new BMap.Geocoder();
    // if (address) {
    //     geoc.getPoint(address, function (point) {
    //         if (point) {
    //             map.centerAndZoom(point, 16);
    //             var maker = new BMap.Marker(point);
    //             map.addOverlay(maker);
    //         } else {
    //             alert("您选择地址没有解析到结果!");
    //         }
    //     });
    // }
    return map;
}

function initMapMove(x, y) {
    // 初始化
    var map = new BMap.Map("baidumap");
    map.centerAndZoom(new BMap.Point(116.404, 39.915), 11);
    map.enableScrollWheelZoom(true);
    map.enableDragging();
    var geoc = new BMap.Geocoder();
    if (address) {
        geoc.getPoint(address, function (point) {
            if (point) {
                map.centerAndZoom(point, 16);
                map.panBy(x, y);
                var maker = new BMap.Marker(point);
                map.addOverlay(maker);
            } else {
                alert("您选择地址没有解析到结果!");
            }
        });
    }
}


/**
 * 通过地址获取坐标
 * @param map
 * @param site
 */
function getCordByAddress(map, site) {

    var localSearch = new BMap.LocalSearch(map);

    map.clearOverlays();// 清空原来的标注
    // var keyword = site;

    localSearch.setSearchCompleteCallback(function (searchResult) {
        var poi = searchResult.getPoi(0);
        console.log("----------------------")
        console.log(poi)

        // document.getElementById("longitude").value = poi.point.lng;
        //
        // $("#lat").val(poi.point.lat);
        //
        // map.centerAndZoom(poi.point, 13);
        //
        // var marker = new BMap.Marker(new BMap.Point(poi.point.lng, poi.point.lat));  // 创建标注，为要查询的地方对应的经纬度
        //
        // map.addOverlay(marker);
        //
        // var content = keyword + "<br/><br/>经度：" + poi.point.lng + "<br/>纬度：" + poi.point.lat;
        // var infoWindow = new BMap.InfoWindow("<p style='font-size:14px;'>" + content + "</p>");
        //
        // marker.addEventListener("click", function () {
        //     this.openInfoWindow(infoWindow);
        // });

        // marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画

    });

    localSearch.search(keyword);
}