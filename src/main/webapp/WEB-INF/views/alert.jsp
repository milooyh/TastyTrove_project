<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
	    var msg = "<c:out value='${alertMessage}'/>";
	    var url = "<c:out value='${url}'/>";
	    alert(msg);
	    location.href = url;
	    
	    var url1 = "<c:out value='${url1}'/>";
	    alert(msg);
	    location.href = url1;
	</script>
</body>
</html>