<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
									<h1 class="h4 text-gray-900 mb-4">Đăng Nhập</h1>
								</div>
								<form:form action="/login" method="POST" modelAttribute="user" 
									class="user" enctype="multipart/form-data">
									<div class="form-group">
										<form:input type="text" path="username"
											class="form-control form-control-user"
											id="exampleInputUsername" placeholder="Tài khoản" />
										<!-- Error messages will be handled by the server and can be displayed here if needed -->
										<form:errors path="username"
											cssClass="error" />
									</div>
									<div class="form-group">
										<form:input type="password" path="password"
											class="form-control form-control-user"

											id="exampleInputPassword" placeholder="Mật khẩu" value="125073" />

										<form:errors path="password"
											cssClass="error" />
									</div>
									<div>${message}</div>
									<button type="submit"
										class="btn btn-primary btn-user btn-block">Đăng nhập</button>
								</form:form>

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
