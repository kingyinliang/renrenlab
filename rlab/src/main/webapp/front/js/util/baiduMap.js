var address=null;
function loadJScript(addr) {
  address=addr;
  var script = document.createElement("script");
  script.type = "text/javascript";
  script.src = "https://api.map.baidu.com/api?v=2.0&ak=ZlEwMqIMtChz8MEj1mV6Tc6v&callback=initMap&s=1";
  document.body.appendChild(script);
}
function loadJScriptMove(addr,x,y){
	address = addr;
    var script = document.createElement("script");
	script.type = "text/javascript";
	script.src = "https://api.map.baidu.com/api?v=2.0&ak=ZlEwMqIMtChz8MEj1mV6Tc6v&callback=initMapMove("+x+","+y+")&s=1";
	document.body.appendChild(script);	
}

function initMap() {
  // 初始化
  var map=new BMap.Map("baidumap");
  map.centerAndZoom(new BMap.Point(116.404,39.915),11);
    map.enableScrollWheelZoom(true);
    map.enableDragging();
  var geoc = new BMap.Geocoder();
  if(address) {
    geoc.getPoint(address, function(point){
      if (point) {
        map.centerAndZoom(point, 16);
        var maker=new BMap.Marker(point);
        map.addOverlay(maker);
      }else{
        // alert("您选择地址没有解析到结果!");
          console.log("您选择地址没有解析到结果!");
      }
    });
  }
}
function initMapMove(x,y){
	 // 初始化
	  var map=new BMap.Map("baidumap");
	  map.centerAndZoom(new BMap.Point(116.404,39.915),11);
    map.enableScrollWheelZoom(true);
    map.enableDragging();
	  var geoc = new BMap.Geocoder();
	  if(address) {
	    geoc.getPoint(address, function(point){
	      if (point) {
	        map.centerAndZoom(point, 16);
	    	map.panBy(x,y);
	        var maker=new BMap.Marker(point);
	        map.addOverlay(maker);
	      }else{
	        // alert("您选择地址没有解析到结果!");
              console.log("您选择地址没有解析到结果!");
	      }
	    });
	  }
}