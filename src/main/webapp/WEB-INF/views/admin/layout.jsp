<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="au theme template">
<meta name="author">
<meta name="keywords" content="au theme template">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<meta name="keywords"
	content="bootstrap, bootstrap admin template, admin theme, admin dashboard, dashboard template, admin template, responsive" />
<meta name="author" content="Codedthemes" />

<!-- Title Page-->
<title>Home Pages Admin</title>

<!-- Fontfaces CSS-->
<link href="/adminTemplate/css/font-face.css" rel="stylesheet"
	media="all">
<link
	href="/adminTemplate/vendor/font-awesome-4.7/css/font-awesome.min.css"
	rel="stylesheet" media="all">
<link
	href="/adminTemplate/vendor/font-awesome-5/css/fontawesome-all.min.css"
	rel="stylesheet" media="all">
<link
	href="/adminTemplate/vendor/mdi-font/css/material-design-iconic-font.min.css"
	rel="stylesheet" media="all">

<!-- Bootstrap CSS-->
<link href="/adminTemplate/vendor/bootstrap-4.1/bootstrap.min.css"
	rel="stylesheet" media="all">

<!-- Vendor CSS-->
<link href="/adminTemplate/vendor/animsition/animsition.min.css"
	rel="stylesheet" media="all">
<link
	href="/adminTemplate/vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css"
	rel="stylesheet" media="all">
<link href="/adminTemplate/vendor/wow/animate.css" rel="stylesheet"
	media="all">
<link href="/adminTemplate/vendor/css-hamburgers/hamburgers.min.css"
	rel="stylesheet" media="all">
<link href="/adminTemplate/vendor/slick/slick.css" rel="stylesheet"
	media="all">
<link href="/adminTemplate/vendor/select2/select2.min.css"
	rel="stylesheet" media="all">
<link
	href="/adminTemplate/vendor/perfect-scrollbar/perfect-scrollbar.css"
	rel="stylesheet" media="all">

<!-- Main CSS-->
<link href="/adminTemplate/css/theme.css" rel="stylesheet" media="all">
<jsp:include page="/WEB-INF/views/admin/common/css_admin.jsp"></jsp:include>

</head>
<body>
	<jsp:include page="/WEB-INF/views/admin/components/loader.jsp"></jsp:include>
	<jsp:include page="slideBar.jsp"></jsp:include>
	<jsp:include page="header.jsp"></jsp:include>

	<jsp:include page="${view }"></jsp:include>
	<jsp:include page="scrip.jsp"></jsp:include>
</body>
</html>