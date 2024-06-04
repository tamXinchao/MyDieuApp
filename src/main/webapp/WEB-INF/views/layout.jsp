<%@ page pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<meta content="Free HTML Templates" name="keywords">
<meta content="Free HTML Templates" name="description">


<!-- Favicon -->
<link href="/template/img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">

<!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="/template/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="/template/css/style.css" rel="stylesheet">
<title>Layout</title>
</head>
<body>
	<jsp:include page="navbar.jsp"></jsp:include>
	<jsp:include page="${view}"></jsp:include>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
