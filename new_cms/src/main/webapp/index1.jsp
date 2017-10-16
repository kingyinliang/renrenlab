<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>人人实验（renrenlab.com）官方网站-互联网+科技服务平台</title>
    <meta name="description" content="login page" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<script src="./bg/assets/jquery-2.1.1/jquery.min.js"></script>
<body>
aaaaa
<button onclick="test()">bbbb</button>

<script>


    var param = {
        "action":2,
        "phone":"18513957736",
        "password":"123456",
        "validateCode":"123456"
    }

  function test () {
      console.log("111111");
      $.ajax({
          type: "POST",
          headers: {
              "Content-Type": "application/json;charset=UTF-8"
          },
          url: "http://localhost:8080/wx/user/wxBindPhone.do?token=66666666",
          data: JSON.stringify(param),
          success: function (data) {
              console.log(data);
          }
      })
  }


</script>
</body>
</html>
