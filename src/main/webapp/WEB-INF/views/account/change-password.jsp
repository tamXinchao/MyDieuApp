<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
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
										<h1 class="h4 text-gray-900 mb-4">Đổi mật khẩu</h1>
									</div>
									<form action="/change-password" method="POST" class="user">
										<div class="form-group">
											<input type="text" name="username"
												class="form-control form-control-user"
												id="exampleInputUsername" placeholder="Tài khoản">
											<!-- Error messages will be handled by the server and can be displayed here if needed -->
											<div class="invalid-feedback text-center">Vui lòng nhập
												tài khoản!</div>
										</div>
										<div class="form-group">
											<input type="password" name="oldPassword"
												class="form-control form-control-user"
												id="exampleInputPassword" placeholder="Mật khẩu">
											<div class="invalid-feedback text-center">Vui lòng nhập
												mật khẩu!</div>
										</div>
										<div class="form-group row">
											<div class="col-sm-6 mb-3 mb-sm-0">
												<input type="password" name="newPassword"
													class="form-control form-control-user"
													id="exampleInputPassword"
													placeholder="Mật khẩu mới...">
												<div class="invalid-feedback text-center">Vui lòng
													nhập địa chỉ!</div>
											</div>
											<div class="col-sm-6">
												<input type="password" name="reNewPassword"
													class="form-control form-control-user"
													id="exampleRepeatPassword" placeholder="Nhập lại mật khẩu mới">
												<div class="invalid-feedback text-center">Vui lòng nhập lại mật khẩu mới</div>
											</div>
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
											class="btn btn-primary btn-user btn-block">Đổi mật khẩu</button>
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

