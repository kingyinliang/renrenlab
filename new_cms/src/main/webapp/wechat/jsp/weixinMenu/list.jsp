<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>菜单列表</title>
</head>
<body>
<a href="add.do">添加</a><a href="publishMenu.do">发布</a>
openId:${openId}
<table width="900" align="center" border="1">
<tr>
<td>ID</td><td>排序</td><td>名称</td><td>键值</td><td>链接</td><td>返回文本内容</td><td>菜单类型</td><td>父ID</td>
</tr>
<c:forEach items="${menus}" var="menu">
	<tr>
		<td>${menu.id }</td>
		<td>${menu.wmSeq }</td>
		<td>${menu.wmName }[<a href="update/${menu.id }.do">更新</a>&nbsp;<a href="delete/${menu.id }.do">删除</a>]</td>
		<td>${menu.wmMenuKey}</td>
		<td>${menu.wmUrl }</td>
		<Td>${menu.wmContent }</Td>
		<td>${menu.wmType }[${menu.wmRespType }]</td>
		<td>${menu.wmPid}</td>
	</tr>
</c:forEach> 
</table>
<div>
<c:forEach items="${wmds }" var="wmd">
	<div>
		${wmd.name }--->${wmd.type }-->${wmd.key }--->${wmd.id }
		<br/>
		&nbsp;
			<c:forEach items="${wmd.sub_button }" var="sbm">
				${sbm.name }--->${sbm.type }-->${sbm.key }--->${sbm.id }
				<br/>&nbsp;
			</c:forEach>
	</div>
</c:forEach>
</div>
</body>
</html>