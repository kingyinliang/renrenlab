<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="rlab" value="${pageContext.request.contextPath}"/>
<%--<%!--%>
<%--String env = ConfigUtil.getProperty("env");--%>
<%--String baseUrl = "http://localhost:8080";--%>
<%--%>--%>
<script type="text/javascript">
    <%--<%--%>
    <%--switch (env){--%>
    <%--case "1":--%>
    <%--baseUrl = "http://localhost:8080";--%>
    <%--break;--%>
    <%--case "2":--%>
    <%--baseUrl = "http://fix.renrenlab.com/rlab";--%>
    <%--break;--%>
    <%--case "3":--%>
    <%--baseUrl = "http://www.renrenlab.com/rlab";--%>
    <%--break;--%>
    <%--default:--%>
    <%--break;--%>
    <%--}--%>
    <%--%>--%>
    <%--var BASE_URL = "<%=baseUrl%>";--%>
    var BASE_URL = window.location.protocol + '//' + window.location.host;
</script>

