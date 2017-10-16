/**
 * Created by user on 2017/3/25.
 */
(function ($) {

    var labUtil = function () {
        var util = {
            //isEmpty: isEmpty, //判断是否为空
            //fileSize: fileSize, //格式化文件大小
            //stringToHtml: stringToHtml, //字符串转HTML
            //htmlToString: htmlToString, //HTMl转字符串
            //getLocalTime: getLocalTime, //将时间戳格式换为日期
            //setItem: setItem, //存储数据到session/cookie
            //getItem: getItem, //获取session/cookie存储数据
            //delItem: delItem, //删除session/cookie数据
            //setLocalStorage: setLocalStorage, //存储数据到local
            //getLocalStorage: getLocalStorage, //获取local存储数据
            //delLocalStorage: delLocalStorage, //删除local数据
            //fillData: fillData, // 填充数据
            //formatDate: formatDate, // 格式化日期
            //getQueryStr: getQueryStr, //获取地址栏参数
            isObj: isObj,// 判断是否为对象
            isFn: isFn,// 判断是否为函数
            getTime: getTime,//时间戳转换标准时间
            getLeftTime:getLeftTime,//获取剩余时间
            strToJson:strToJson,// 字符串转JSON
            getStrWithLength:getStrWithLength,//根据长度从头截取字符串
            formatStr:formatStr,// 压缩空格和换行
            REG:{
                isLetterOrNumber: "[0-9A-Za-z]",
                isPassword: "^[0-9A-Za-z]{6,20}$",
                isEmail: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}",
                isUserName: "[\u4e00-\u9fa5A-Za-z0-9]{1,20}$",
                isPhone: "^1[34578]\\d{9}$",
                isPostCode: "^[1-9]\\d{5}(?!\\d)$",
                isUserID: "^([0-9]{15}$)|([0-9]{17}([0-9]|X)$)",
                isRealName: "^[\u4e00-\u9fa5]{2,5}$",
                isNumber: "^[0-9]+$",
                isNumberAndDot: "^[0-9.]+$"
            },
            stringFilter:stringFilter,
            splitNumber:splitNumber,//限制数字小数点位数
        }

        return util;

        //function  isLetter(){
        //    var text = "220104199403300000";
        //    var reg = util.REG.isUserID;
        //
        //    //console.log(req);
        //    //console.log(util.REG.isLetterOrNumber);
        //    if (new RegExp(reg).test(text)){
        //        console.log("------------true");
        //    }else {
        //        console.log("------------false");
        //    }
        //}

        function splitNumber(e,len) {
            var obj=e.srcElement || e.target;
            var dot=obj.value.indexOf(".");//alert(e.which);
            console.log(dot);
            len =(typeof(len)=="undefined")?2:len;
            var  key=e.keyCode|| e.which;
            if(key==8 || key==9 || key==110 || (key>=37  && key<=40))//这里为了兼容Firefox的backspace,tab,del,方向键
                return true;
            if (key<=57 && key>=48 || key <= 104 && key >= 96) { //数字
                if(dot==-1)//没有小数点
                {
                    return true;
                }
                else if(obj.value.length<=dot+len)//小数位数
                {
                    return true;
                }
            } else if((key==110) && dot==-1){//小数点
                return true;
            }
            return false;
        }

        function stringFilter(string) {
            //var reg = /<[^<>]+>/g;
            string = string.replace(/&#62;/g, ">");
            string = string.replace(/&#60;/g, "<");

            string = string.replace(/&#160;/g, " ");
            string = string.replace(/&#60;/g, "<");
            string = string.replace(/&#38;/g, "&");
            string = string.replace(/&#13;&#10;/g, " ");
            string = string.replace(/&#009;/g, "\t");

            //string = string.replace(/>/g, "&#62;");

            //
            //specail = specail.replaceAll("\\\\", "\\\\\\\\");
            //specail = specail.replaceAll("\"", "\\\\\"");
            //specail = specail.replaceAll("&", "&#38;");
            //specail = specail.replaceAll("<", "&#60;");
            //specail = specail.replaceAll(">", "&#62;");

            //specail = specail.replaceAll(" ", "&#160;");
            //specail = specail.replaceAll("\\r", "&#13;&#10;");
            //specail = specail.replaceAll("\\n", "&#13;&#10;");
            //specail = specail.replaceAll("\\t", "&#009;");
            //specail = specail.replaceAll("\\f", "&012;");

            //string = string.replace("\\\\", "\\\\\\\\");
            //string = string.replace("\"", "\\\\\"");
            return string;
        }


        function isObj(obj) {
            return !!obj && typeof obj === 'object' && Object.prototype.toString.call(obj).toLowerCase() === '[object object]';
        }

        function isFn(obj) {
            return !!obj && typeof  obj === "function"
        }

        function getTime(timestamp) {
            //return new Date(parseInt(timestamp)).toLocaleString().replace(/:\d{1,2}$/,' ');
            var time = new Date(timestamp);
            var y = time.getFullYear();
            var m = time.getMonth()+1;
            var d = time.getDate();
            var h = time.getHours();
            var mm = time.getMinutes();
            var s = time.getSeconds();
            return y+'-'+add0(m)+'-'+add0(d)+' '+add0(h)+':'+add0(mm)+':'+add0(s);
        }

        function add0(m){
            return m<10?'0'+m:m ;
        }

        function getLeftTime(timestamp) {
            //var endTimestamp = Date.parse(new Date()) + 2 * 24 * 60 * 60 * 1000;

            var ed = timestamp + 2 * 24 * 60 * 60 * 1000;
            var current = Date.parse(new Date());

            var leftTime = (ed - current);

            var days = Math.floor(leftTime/(24*3600*1000));
            var leave1=leftTime%(24*3600*1000);    //计算天数后剩余的毫秒数
            var hours=Math.floor(leave1/(3600*1000));
            var leave2=leave1%(3600*1000);        //计算小时数后剩余的毫秒数
            var minutes=Math.floor(leave2/(60*1000));
            var leave3=leave2%(60*1000);      //计算分钟数后剩余的毫秒数
            //var seconds=Math.round(leave3/1000);

            return days+'天'+hours+'小时'+minutes+'分';
            //return days+'天'+hours+'小时'+minutes+'分'+seconds+'秒';

            //console.log('-----'+currentTimestamp);
            //console.log('-----'+timestamp);
            //var hours = leftTime / 1000 / 3600;
            //console.log(getTime(currentTimestamp));
        }

        function strToJson(jsonStr){
            return JSON.parse(jsonStr);
        }

        function getStrWithLength (str, length) {
            if (str.length <= length) {
                return str;
            }
            str = str.substring(0, length);
            str = str+'...';
            return str;
        }

        function formatStr(str) {
            str=str.replace(/\s{2,}/g, " ");
            str=str.replace(/\n{2,}/g, "\r\n");
            str=str.replace(/\r{2,}/g, "\r\r");
            return str;
        }

    }

    window.labUtil = labUtil();// 沙箱模式
})($)
