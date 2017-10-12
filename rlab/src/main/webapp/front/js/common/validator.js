var Consts={
    avatar:{
        minWidth:100,
        minHeight:100,
        maxWidth:200,
        maxHeight:200
    }
};

var DEFAULT_MESSAGE = '无效的输入';

var DEFAULT_FEEDBACK_ICONS = {
    valid: 'glyphicon glyphicon-ok',
    invalid: 'glyphicon glyphicon-remove',
    validating: 'glyphicon glyphicon-refresh'
};

var DEFAULT_SUBMIT_HANDLER = function(validator, form, submitButton){
    // Do nothing
};
var USER_CODE_VALIDATOR={
    validators:{
        notEmpty:{
            message:'验证码不能为空'
        }
    }
};
// login
var USER_LOGIN_PHONE={
    validators:{
        notEmpty:{
            message:'手机号不能为空'
        },
    }
};
var USER_LOGIN_ACCOUNT={
    validators:{
        notEmpty:{
            message:'QQ账号不能为空'
        }
    }
};
var USER_LOGIN_PWD={
    validators:{
        notEmpty:{
            message:'密码不能为空'
        }
    }
};

// regist
var USER_REGIST_PHONE={
    validators:{
        notEmpty:{
            message:'手机号不能为空'
        },
    }
};

//10是为了解决爬虫数据的问题
var PHONEVALIDATE_LOGIN={
    regexp: /^0?(10|13|15|18|14|17)[0-9]{9}$/,
    message: '请输入正确的手机号'
}
var PWDVALIDATE_LOGIN={
    regexp: /^[a-zA-Z0-9_]+$/,
    message: '密码只能包含字母，数字和下划线',
    lengthMessage:'密码长度为5~20个字符',
}
var PHONEVALIDATE={
    regexp: /^0?(13|15|18|14|17)[0-9]{9}$/,
    message: '请输入正确的手机号'
}

var USER_REGIST_PASSWORD = {
    validators: {
        notEmpty: {
            message: '密码不能为空'
        },
//    stringLength: {
//      min: 5,
//      max: 20,
//      message: '密码长度为5~20个字符'
//    },
//    regexp: {
//      regexp: /^[a-zA-Z0-9_]+$/,
//      message: '密码只能包含字母，数字和下划线'
//    }
    }
};
var USER_REGIST_PASSWORDAGAIN = {
    validators: {
        notEmpty: {
            message: '密码不能为空'
        },
//    stringLength: {
//      min: 5,
//      max: 20,
//      message: '密码长度为5~20个字符'
//    },
//    regexp: {
//      regexp: /^[a-zA-Z0-9_]+$/,
//      message: '密码只能包含字母，数字和下划线'
//    },
//    identical: {
//      field: 'password',
//      message: '密码不一致'
//    }
    }
};
var USER_REGIST_PROTOCOL={
    validators:{
        notEmpty:{
            message:'同意协议之后才能注册'
        }
    }
};
//user center
var USER_AVATAR_VALIDATOR={
    validators:{
        notEmpty:{
            message:'用户头像不能为空'
        },
        file:{
            extension:'jpg,jpeg,png',
            type:'image/jpg,image/jpeg,image/png',
            message:'头像的格式只能为jpg,jpeg,png'
        },
        callback:{
            message:'头像的像素最小100*100px，最大200*200px'
        }
    }
};
var USER_NICKNAME_VALIDATOR = {
    validators: {
        notEmpty: {
            message: '昵称不能为空'
        },
        stringLength: {
            max: 20,
            message: '昵称不能超过20个字符'
        }
    }
};
var USER_EMAIL_VALIDATOR = {
    validators: {
//    notEmpty: {
//      message: '邮箱不能为空'
//    },
        stringLength: {
            max:50,
            message:'邮箱不能超过50个字符'
        },
        emailAddress: {
            message: '请确保输入有效的邮箱'
        }
    }
};
var USER_REALNAME_VALIDATOR = {
    validators: {
        notEmpty: {
            message:'姓名不能为空'
        },
        stringLength:{
            max:20,
            message:'姓名不能超过20个字符'
        }
    }
};
var USER_IDCARD_VALIDATOR = {
    validators: {
        notEmpty: {
            message: '身份证号不为空'
        },
        regexp:{
            regexp:/^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/,
            message: '请输入正确的身份证号'
        }
    }
};
/*
 var IDCARDREP={
 regexp:/^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/,
 message: '请输入正确的身份证号'
 }
 */
//收货人手机号
var USER_CONTACT_PHONE = {
    validators: {
        notEmpty:{
            message:'联系电话不能为空'
        }
    },
    regexp:/^(0[0-9]{2,3}\-)?([2-9][0-9]{6,7})+(\-[0-9]{1,4})?$|(^(13[0-9]|15[0|3|6|7|8|9]|18[8|9])\d{8}$)/,
    regexpmob:/^1[3|4|5|7|8]\d{9}$/,
    message:'联系电话只能为手机号或座机号'
}
var USER_POSTCODE_VALIDATOR = {
    validators: {
        notEmpty:{
            message:'邮政编码不能为空'
        },
        regexp:{
            regexp:/^[1-9][0-9]{5}(?![0-9])$/,
            message:'邮政编码格式错误'
        }
    }
}
var USER_PROVINCECODE_VALIDATOR = {
    validators:{
        notEmpty:{
            message:'省份不能为空'
        }
    }
};
var USER_CITYCODE_VALIDATOR = {
    validators:{
        notEmpty:{
            message:'城市不能为空'
        }
    }
};
var USER_DISTRICTCODE_VALIDATOR = {
    validators:{
        notEmpty:{
            message:'地区不能为空'
        }
    }
};
var USER_ADDRDETAIL_VALIDATOR = {
    validators:{
        notEmpty:{
            message:'详细地址不能为空'
        },
        stringLength:{
            max:50,
            message:'详细地址不能超过50个字符'
        }
    }
};
var USER_IDCARDPOSITIVE_VALIDATOR = {
    validators:{
        notEmpty:{
            message:'身份证正面图片不能为空'
        }
    }
}
var USER_IDCARDNEGATIVE_VALIDATOR = {
    validators:{
        notEmpty:{
            message:'身份证反面图片不能为空'
        }
    }
}
var USER_IDCARDHANDHELD_VALIDATOR = {
    validators:{
        notEmpty:{
            message:'手持图片不能为空'
        }
    }
}
var USER_LICENSE_VALIDATOR = {
    validators:{
        notEmpty:{
            message:'营业执照图片不能为空'
        }
    }
}
var USER_ORGNAME_VALIDATOR = {
    validators: {
        notEmpty: {
            message:'机构名称不能为空'
        },
        stringLength:{
            max:50,
            message:'机构名称不能超过50个字符'
        }
    }
};
var USER_ORGTYPE_VALIDATOR = {
    validators: {
        notEmpty: {
            message:'机构性质不能为空'
        }
    }
};
var USER_ORGCODE_VALIDATOR = {
    validators: {
        notEmpty: {
            message:'组织机构代码号不能为空'
        },
        stringLength:{
            max:50,
            message:'组织机构代码号不能超过50个字符'
        }
    }
};
var USER_ORGDESC_VALIDATOR = {
    validators: {
        notEmpty: {
            message:'机构简介不能为空'
        }
    }
};
var USER_ORGFOUNDINGTIME_VALIDATOR = {
    validators: {
        notEmpty: {
            message:'机构成立时间不能为空'
        }
    }
};
var USER_ORGAPTITUDE_VALIDATOR = {
    validators: {
        stringLength:{
            max:1000,
            message:'机构资质不能超过1000个字符'
        }
    }
};
var USER_ORGFIELD_VALIDATOR = {
    validators: {
        stringLength:{
            max:255,
            message:'服务范围不能超过255个字符'
        }
    }
};
var USER_ORGCASENAME_VALIDATOR = {
    validators: {
        notEmpty:{
            message:'案例名称不能为空'
        },
        stringLength:{
            max:255,
            message:'案例名称不能超过255个字符'
        }
    }
};
var USER_ORGCASEDESC_VALIDATOR = {
    validators: {
        notEmpty:{
            message:'案例介绍不能为空'
        }
    }
};
// 兑换发票
var USER_COMPANYTITLE_VALIDATOR = {
    validators:{
        notEmpty:{
            message:'发票抬头不能为空'
        },
        stringLength:{
            max:50,
            message:'发票抬头不能超过50个字符'
        }
    }
};
var USER_AMOUNT_VALIDATOR = {
    validators:{
        notEmpty:{
            message:'发票金额不能为空'
        },
        between:{
            min:0.01,
            max:99999.99,
            message:'发票金额必须在0.01和99999.99之间'
        },
        regexp:{
            regexp:/^([0-9][0-9]{0,4})(\.[0-9]{0,2})?$/,
            message:'发票金额最多精确到分'
        },
    }
};
//商品
var GOODS_NAME_VALIDATOR = {
    validators:{
        notEmpty:{
            message:'商品名字不能为空'
        },
        stringLength:{
            max:50,
            message:'商品名称不能超过50个字符'
        }
    }
};
var GOODS_IMAGES_VALIDATOR = {
    validators:{
        file:{
            extension:'jpg,jpeg,png',
            type:'image/jpg,image/jpeg,image/png',
            message:'图片的格式只能为jpg,jpeg,png'
        }
        //callback:{
        //  message:'商品图片最少1张最多5张'
        //},
    }
};

var USER_BIGTYPE_VALIDATOR = {
    validators:{
        notEmpty:{
            message:'一级分类不能为空'
        }
    }
};
var USER_MIDDLETYPE_VALIDATOR = {
    validators:{
        notEmpty:{
            message:'二级分类不能为空'
        }
    }
};
var USER_SMALLTYPE_VALIDATOR = {
    validators:{
        notEmpty:{
            message:'三级分类不能为空'
        }
    }
};

var GOODS_USEPRICE_VALIDATOR = {
    validators:{
        notEmpty:{
            message:'价格不能为空'
        },
        integer:{
            message:'价格必须是整数'
        },
        between:{
            min:1,
            max:99999,
            message:'价格必须在1和99999之间'
        }
    }
};

//已废弃
var GOODS_APTITUDE_VALIDATOR = {
    validators:{
        notEmpty:{
            message:'具备资质不能为空'
        },
        stringLength:{
            max:50,
            message:'具备资质不能超过50个字符'
        }
    }
};

var GOODS_CONTACT_NAME = {
    validators : {
        notEmpty : {
            message : '联系人姓名不能为空'
        },
    }
}
var GOODS_CONTACT_PHONE = {
    validators : {
        notEmpty : {
            message : '联系人电话不能为空'
        },
    }
}
var GOODS_CONTACT_EMAIL = {
    validators : {
        //notEmpty : {
        //	message : '联系人邮箱不能为空'
        //},
    }
}
// 仪器
var INSTRUMENT_BRIEF_VALIDATOR = {
    validators:{
        //stringLength:{
        //  max:1000,
        //  message:'仪器简介不能超过1000个字符'
        //}
    }
};
var INSTRUMENT_VERSION_VALIDATOR = {
    validators:{
        //notEmpty:{
        //  message:'仪器型号不能为空'
        //},
        stringLength:{
            max: 255,
            message: '仪器型号不能超过255个字符'
        }
    }
};
var INSTRUMENT_MANUFACTURER_VALIDATOR = {
    validators:{
        //notEmpty:{
        //  message:'制造厂商不能为空'
        //},
        stringLength:{
            max: 255,
            message: '制造厂商不能超过255个字符'
        }
    }
};
var INSTRUMENT_PARAMEYER_VALIDATOR = {
    validators:{
        //notEmpty:{
        //  message:'技术参数不能为空'
        //},
        stringLength:{
            max: 255,
            message: '技术参数不能超过255个字符'
        }
    }
};
var INSTRUMENT_PARAMEYER_KEY_VALIDATOR = {
    validators:{
        notEmpty:{
            message: '技术参数名称不能为空'
        },
        stringLength:{
            max: 255,
            message: '技术参数名称不能超过255个字符'
        }
    }
};
var INSTRUMENT_PARAMEYER_VALUE_VALIDATOR = {
    validators:{
        notEmpty:{
            message: '技术参数内容不能为空'
        },
        stringLength:{
            max: 255,
            message: '技术参数内容不能超过255个字符'
        }
    }
};
var INSTRUMENT_CHARACTER_VALIDATOR = {
    validators:{
        //notEmpty:{
        //  message: '设备特色不能为空'
        //},
        stringLength:{
            max: 5000,
            message: '设备特色不能超过5000个字符'
        }
    }
};
var INSTRUMENT_AREA_VALIDATOR = {
    validators:{
        //notEmpty:{
        //  message: '应用领域不能为空'
        //},
        stringLength:{
            max: 5000,
            message: '应用领域不能超过5000个字符'
        }
    }
};
var INSTRUMENT_USEYEAR_VALIDATOR = {
    validators:{
        stringLength:{
            max: 255,
            message: '使用寿命不能超过255个字符'
        }
    }
};
var INSTRUMENT_MAINTAIN_VALIDATOR = {
    validators:{
        stringLength:{
            max: 255,
            message: '保养情况不能超过255个字符'
        }
    }
};
var INSTRUMENT_USETYPE_VALIDATOR = {
    validators:{
        stringLength:{
            max: 255,
            message: '使用方式不能超过255个字符'
        }
    }
};
var INSTRUMENT_OTHER_VALIDATOR = {
    validators:{
        //stringLength:{
        //  max: 5000,
        //  message: '其他说明不能超过5000个字符'
        //}
    }
};
//服务
var SERVICE_TEAM_VALIDATOR = {
    validators:{
        stringLength:{
            max: 255,
            message: '服务团队不能超过255个字符'
        }
    }
};
var SERVICE_TESTING_VALIDATOR = {
    validators:{
        stringLength:{
            max: 255,
            message: '服务方法不能超过255个字符'
        }
    }
};
var SERVICE_OTHER_VALIDATOR = {
    validators:{
        //stringLength:{
        //  max: 5000,
        //    message: '其他描述不能超过5000个字符'
        //}
    }
};
var SERVICE_PERIOD_VALIDATOR = {
    validators:{
        //notEmpty:{
        //  message:'服务周期不能为空'
        //},
        stringLength:{
            max: 255,
            message: '服务周期不能超过255个字符'
        }
    }
};
var SERVICE_KEYWORD_VALIDATOR = {
    validators:{
        //notEmpty:{
        //  message:'关键字不能为空'
        //},
        stringLength:{
            max: 255,
            message: '关键字不能超过255个字符'
        }
    }
};
var SERVICE_USETECH_VALIDATOR = {
    validators:{
        //notEmpty:{
        //  message:'使用设备不能为空'
        //},
        stringLength:{
            max: 255,
            message: '使用设备不能超过255个字符'
        }
    }
};
var SERVICE_BRIEF_VALIDATOR = {
    validators:{
        //stringLength:{
        //  max: 1000,
        //  message: '服务描述不能超过1000个字符'
        //}
    }
};

var SERVICE_AREA_VALIDATOR = {
    validators:{
        //notEmpty:{
        //  message:'服务领域不能为空'
        //},
        stringLength:{
            max: 5000,
            message: '服务领域不能超过5000个字符'
        }
    }
};
var SERVICE_CHARACTER_VALIDATOR = {
    validators:{
        //notEmpty:{
        //  message: '技术特点不能为空'
        //},
        stringLength:{
            max: 5000,
            message: '技术特点不能超过5000个字符'
        }
    }
};
var SERVICE_STANDERED_VALIDATOR = {
    validators:{
        //notEmpty:{
        //  message: '服务依据标准不能为空'
        //},
        stringLength:{
            max: 1000,
            message: '服务依据标准不能超过1000个字符'
        }
    }
};
var SERVICE_SIMPLENEED_VALIDATOR = {
    validators:{
        stringLength:{
            max: 1000,
            message:'样品要求不能超过1000个字符'
        }
    }
};

//评价
var SERVICE_COMMENT_VALIDATOR = {
    validators:{
        notEmpty:{
            message:'评价不能为空'
        },
        //stringLength:{
        //  max:500,
        //  message:'评价不能超过500个字符'
        //}
    }
};
//站内留言
var SERVICE_LEAVEMESSAGE_VALIDATOR = {
    validators:{
        stringLength:{
            max: 255,
            message:'留言不能超过255个字符'
        }
    }
};
//购买数量
var BUY_NUM_VALIDATAOR={
    validators:{
        notEmpty:{
            message:'购买次数不能为空'
        },
        regexp:{
            regexp:/^[1-9][0-9]{0,3}$/,
            message:'购买数量是1－9999的整数'
        }
    }
}
// 专家团
var EXPERTS_CONTENT_VALIDATAOR = {
    validators : {
        notEmpty : {
            message : '问题描述不能为空'
        }
    }
}
var EXPERTS_PHONE_VALIDATAOR = {
    validators : {
        notEmpty : {
            message : '手机号不能为空'
        },
        regexp:{
            regexp: /^0?(13|15|18|14|17)[0-9]{9}$/,
            message: '请输入正确的手机号'
        }
    }
}