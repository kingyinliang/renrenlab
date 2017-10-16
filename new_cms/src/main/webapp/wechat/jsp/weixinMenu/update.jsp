<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改菜单</title>
</head>
<body>
	<sf:form modelAttribute="menu" id="adminForm" method="post">
		<table cellpadding="0" cellspacing="0">
		<tr>
		<td>名称</td>
		<td><sf:input path="wmName"/></td>
		</tr>
		<tr>
			<td>排序</td>
			<td><sf:input path="wmSeq"/></td>
		</tr>
		<tr>
		<td>content</td>
		<td><sf:input path="wmContent"/></td>
		</tr>
		<tr>
		<td>url</td>
		<td><sf:input path="wmUrl"/></td>
		</tr>
		<tr>
		<td>type</td>
		<td><sf:input path="wmType"/></td>
		</tr>
		<tr>
		<td>响应类型</td>
		<td><sf:input path="wmRespType"/></td>
		</tr>
		<tr>
		<td>pid</td>
		<td><sf:input path="wmPid"/></td>
		</tr>
		<tr>
		<td colspan="2"><input type="submit"/></td>
		</tr>
		</table>
	</sf:form>
</body>
</html>