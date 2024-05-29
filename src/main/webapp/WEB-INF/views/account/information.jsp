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
<link href="/template/cssInformation/informationcss" rel="stylesheet">

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
										<h1 class="h4 text-gray-900 mb-4">Thông tin khách hàng</h1>
									</div>
									<form action="/information" method="POST" class="user">
										<div class="form-group">
											<input type="text" name="fullname"
												class="form-control rounded-input" id="exampleInputUsername"
												placeholder="${userSession.fullname}" disabled>
										</div>
										<div class="form-group">
											<input type="text" name="gender"
												class="form-control rounded-input" id="exampleInputPassword"
												placeholder="${userSession.gender ? 'Nam' : 'Nữ'}" disabled>
										</div>
										<div class="form-group">
											<input type="number" name="number"
												class="form-control rounded-input" id="exampleInputPassword"
												placeholder="${addressSession.phoneNumber}" disabled>
										</div>
										<div class="form-group">
											<input type="email" name="email"
												class="form-control rounded-input" id="exampleInputPassword"
												placeholder="${addressSession.email}" disabled>
										</div>
										<!-- Button trigger modal -->
										<button type="button" class="btn btn-primary"
											data-bs-toggle="modal" data-bs-target="#updateInformation">
											Cập nhật tài khoản</button>

										<!-- Modal -->

										<div class="modal fade" id="updateInformation" tabindex="-1"
											aria-labelledby="exampleModalLabel" aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title text-gray-900"
															id="exampleModalLabel">Cập nhật tài khoản</h5>
													</div>
													</form>
													<form action="/updateInformation" method="GET" class="user">
														<div class="modal-body">
															<div class="form-group">
																<input type="text" name="fullname"
																	class="form-control rounded-input"
																	id="exampleInputUsername"
																	value="${userSession.fullname}">
															</div>
															<div class="form-group row">
																<div class="col-sm-6">
																	<div
																		class="custom-control custom-radio custom-control-inline">
																		<input type="radio" id="genderMale" name="gender"
																			class="custom-control-input" value="male"> <label
																			class="custom-control-label" for="genderMale">Nam</label>
																	</div>
																</div>
																<div class="col-sm-6">
																	<div
																		class="custom-control custom-radio custom-control-inline">
																		<input type="radio" id="genderFemale" name="gender"
																			class="custom-control-input" value="female">
																		<label class="custom-control-label" for="genderFemale">Nữ</label>
																	</div>
																</div>
															</div>
															<div class="form-group">
																<input type="number" name="PhoneNumber"
																	class="form-control rounded-input"
																	id="exampleInputPassword"
																	value="${addressSession.phoneNumber}">
															</div>
															<div class="form-group">
																<input type="email" name="Email"
																	class="form-control rounded-input"
																	id="exampleInputPassword"
																	value="${addressSession.email}">
															</div>
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-secondary"
																data-bs-dismiss="modal">Đóng</button>
															<button type="submit" class="btn btn-primary">Lưu
																thay đổi</button>
														</div>

													</form>
												</div>
											</div>
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
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</html>
