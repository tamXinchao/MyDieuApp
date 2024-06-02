<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
	<div class="container">

		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				<div class="row">
					<div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
					<div class="col-lg-7">
						<div class="p-5">
							<div class="text-center">
								<h1 class="h4 text-gray-900 mb-4">Mã xác nhận</h1>
							</div>
							<form action="/maxacnhan" method="POST" class="user">
								<div class="form-group row">
									<div class="col-sm-12">
										<input type="text" name="MaXacNhan"
											class="form-control form-control-user" id="exampleLastName"
											placeholder="Mã xác thực - OTP">
										<div class="invalid-feedback text-center">Vui lòng nhập mã xác thực!</div>
									</div>
								</div>
								<button type="submit" class="btn btn-primary btn-user btn-block">Xác nhận</button>
								<hr>
							</form>
							<div class="text-center">
								<a class="small" href="/trang-chu">Hủy -></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

