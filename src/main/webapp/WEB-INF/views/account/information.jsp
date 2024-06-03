<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
								</form>
								<!-- Modal -->

								<div class="modal fade" id="updateInformation" tabindex="-1"
									aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title text-gray-900" id="exampleModalLabel">Cập
													nhật tài khoản</h5>
											</div>


											<form action="/updateInformation" method="GET" class="user">
												<div class="modal-body">
													<div class="form-group">
														<input type="text" name="fullname"
															class="form-control rounded-input"
															id="exampleInputUsername" value="${userSession.fullname}">
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
																	class="custom-control-input" value="female"> <label
																	class="custom-control-label" for="genderFemale">Nữ</label>
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
														<input type="email" name="email"
															class="form-control rounded-input"
															id="exampleInputPassword" value="${addressSession.email}">
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

