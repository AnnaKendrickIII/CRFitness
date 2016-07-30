<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:remove var="LoginOK" scope="session" />
<%
  session.invalidate();
%>

<c:redirect url="/${this_contextPath}/admin/adminIndex.jsp"></c:redirect>
