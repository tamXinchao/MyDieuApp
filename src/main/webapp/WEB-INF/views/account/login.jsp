<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<!-- Custom fonts for this template-->
<link href="/manager/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/manager/css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body class="bg-gradient-primary">
	<div class="container">

		<!-- Outer Row -->
		<div class="row justify-content-center">

			<div class="col-xl-10 col-lg-12 col-md-9">

				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->
						<div class="row">
							<div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
							<div class="col-lg-6">
								<div class="p-5">
									<div class="text-center">
										<h1 class="h4 text-gray-900 mb-4">Đăng Nhập</h1>
									</div>
									<form action="/login" method="POST" class="user">
										<div class="form-group">
											<input type="text" name="username"
												class="form-control form-control-user"
												id="exampleInputUsername"
												placeholder="Tài khoản">
											<!-- Error messages will be handled by the server and can be displayed here if needed -->
											<div class="invalid-feedback text-center">Vui lòng nhập
												tài khoản!</div>
										</div>
										<div class="form-group">
											<input type="password" name="password"
												class="form-control form-control-user"
												id="exampleInputPassword" placeholder="Mật khẩu">
											<div class="invalid-feedback text-center">Vui lòng nhập
												mật khẩu!</div>
										</div>
										<div class="form-group">
											<div class="custom-control custom-checkbox small">
												<input type="checkbox" name="remember"
													class="custom-control-input" id="customCheck"> <label
													class="custom-control-label" for="customCheck">Nhớ
													tài khoản?</label>
											</div>
										</div>
										<button type="submit"
											class="btn btn-primary btn-user btn-block">Đăng nhập</button>
									</form>
									<hr>
									<div class="text-center">
										<a class="small" href="/forgot-password">Quên mật khẩu?</a>
									</div>
									<div class="text-center">
										<a class="small" href="/register">Tạo tài khoản!</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<!-- Bootstrap core JavaScript-->
<script src="/manager/vendor/jquery/jquery.min.js"></script>
<script src="/manager/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/manager/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/manager/js/sb-admin-2.min.js"></script>
</html>
