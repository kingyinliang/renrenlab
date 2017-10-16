// 按鈕切換
function changeCheck($this) {
    var checkedFlag = $($this).prop("checked");

    var $_this = $($this);
    if (checkedFlag) {
        $_this.parent().removeClass("checkbox_cancel").addClass("checkbox_checked");
    } else {
        $_this.parent().removeClass("checkbox_checked").addClass("checkbox_cancel");
    }
}
// 三证合一
function slideUp($_this) {
    if ($($_this).prop("checked")) {
        $("#orgPapers2").hide();
        $("#orgPapers3").hide();
    } else {
        $("#orgPapers2").show();
        $("#orgPapers3").show();
    }
}

