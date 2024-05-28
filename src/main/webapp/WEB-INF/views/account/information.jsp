<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thông tin khách hàng</title>
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

		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				<div class="row">
					<div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
					<div class="col-lg-7">
						<div class="p-5">
							<div class="text-center">
								<h1 class="h4 text-gray-900 mb-4">Thông tin của bạn</h1>
							</div>
							<form action="/information" method="POST" class="user">
								<div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input type="text" name="PhoneNumber"
											class="form-control form-control-user" id="exampleFirstName"
											placeholder="Số điện thoại...">
										<!-- Error messages will be handled by the server and can be displayed here if needed -->
										<div class="invalid-feedback text-center">Vui lòng nhập đúng số điện thoai</div>
									</div>
									<div class="col-sm-6">
										<input type="text" name="MaXacThuc"
											class="form-control form-control-user" id="exampleLastName"
											placeholder="Mã xác thực - OTP">
										<div class="invalid-feedback text-center">Vui lòng nhập mã xác thực!</div>
									</div>
								</div>
								<div class="form-group">
									<div class="input-group is-invalid mb-3">
										<input type="email" name="Email"
											class="form-control form-control-user"
											placeholder="Nhập địa chỉ email"
											aria-label="Recipient's username"
											aria-describedby="button-addon2">
										<div class="input-group-append">
											<button type="button" data-toggle="modal"
												data-target="#exampleModal"
												class="btn btn-outline-secondary btn-user"
												id="button-addon2">Gửi</button>
										</div>
									</div>
									<div class="invalid-feedback text-center">Vui lòng nhập địa chỉ email!</div>
								</div>

								<div class="modal fade" id="exampleModal" tabindex="-1"
									aria-labelledby="exampleModalLabel" aria-hidden="true"
									style="border-radius: 0;">
									<div class="modal-dialog" style="border-radius: 0;">
										<div class="modal-content" style="border-radius: 0;">
											<div class="modal-header">
												<h5 class="modal-title text-danger" id="exampleModalLabel">Thông
													báo</h5>
											</div>
											<div class="modal-body">Đường dẫn làm mới mật khẩu đã
												được gửi qua email của bạn. Vui lòng check email!</div>
											<div class="modal-footer">
												<button type="submit" formaction="/register/mailSender"
													class="btn btn-primary" style="border-radius: 0;">Xác
													nhận</button>
											</div>
										</div>
									</div>
								</div>

								<div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input type="text" name="Address"
											class="form-control form-control-user"
											id="exampleInputPassword" placeholder="Địa chỉ. VD: số nhà, tên đường, phường...">
										<div class="invalid-feedback text-center">Vui lòng nhập
											địa chỉ!</div>
									</div>
									<div class="col-sm-6">
										<input type="text" name="Provincial"
											class="form-control form-control-user"
											id="exampleRepeatPassword" placeholder="Tỉnh">
										<div class="invalid-feedback text-center">Chọn tỉnh của bạn</div>
									</div>
								</div>
								<button type="submit" class="btn btn-primary btn-user btn-block">Xác nhận</button>
								<hr>
							</form>
							<div class="text-center">
								<a class="small" href="/trang-chu">Bỏ qua -></a>
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
