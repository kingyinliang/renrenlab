<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加菜单</title>
</head>
<body>
	<div>type填写view时需填url，不需要填写content</br>type填写click时需填content，不需要填写url，响应类型为1</div>
	<br></br>
	<sf:form modelAttribute="menu" id="adminForm" method="post">
		<table cellpadding="0" cellspacing="0">
		<tr>
		<td>菜单名称</td>
		<td><sf:input path="wmName"/></td>
		</tr>
		<tr>
		<td>排序</td>
		<td><sf:input path="wmSeq"/></td>
		</tr>
		<tr>
		<td>点击返回文本内容content</td>
		<td><sf:input path="wmContent"/></td>
		</tr>
		<tr>
		<td>链接url</td>
		<td><sf:input path="wmUrl"/></td>
		</tr>
		<tr>
		<td>菜单类型type</td>
		<td><sf:input path="wmType"/></td>
		</tr>
		<tr>
		<td>响应类型（默认0）repType</td>
		<td><sf:input path="wmRespType"/></td>
		</tr>
		<tr>
		<td>父ID</td>
		<td><sf:input path="wmPid"/></td>
		</tr>
		<tr>
		<td colspan="2"><input type="submit"/></td>
		</tr>
		</table>
	</sf:form>

</body>
</html>