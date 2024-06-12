<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>

<div class="container-fluid">
	<!-- Outer Row -->
	<div class="row justify-content-center">
		<div class="col-xl-10 col-lg-12 col-md-9">
			<div class="card o-hidden border-0 shadow-lg my-5">
				<div class="card-body p-0">
					<!-- Nested Row within Card Body -->
					<div class="row">
						<!-- Sidebar -->
						<div class="col-lg-4 border-right">
							<div class="p-4">
								<nav class="navbar navbar-expand-lg navbar-light bg-light">
									<button class="navbar-toggler" type="button"
										data-toggle="collapse" data-target="#navbarNav"
										aria-controls="navbarNav" aria-expanded="false"
										aria-label="Toggle navigation">
										<span class="navbar-toggler-icon"></span>
									</button>
									<div class="collapse navbar-collapse" id="navbarNav">
										<ul class="navbar-nav flex-column">
											<li class="nav-item has-sub"><a
												class="nav-link js-arrow" href="#" onclick="showOrders()">
													<i class="fas fa-tachometer-alt"></i> Đơn Hàng
											</a></li>
											<li class="nav-item has-sub"><a
												class="nav-link js-arrow" href="#thongTinCaNhan"
												onclick="showPersonalInfo()"> <i class="fas fa-table"></i>
													Thông tin cá nhân
											</a></li>
										</ul>
									</div>
								</nav>
							</div>
						</div>
						<!-- End Sidebar -->

						<!-- Content Area -->
						<div class="col-lg-8">
							<div class="p-5" id="content-area">
								<!-- Default Content -->
								<div class="text-center">
									<h1 class="h4 text-gray-900 mb-4">Chào mừng!</h1>
									<p>Vui lòng chọn chức năng bên trái của bạn.</p>
								</div>
							</div>
						</div>
						<!-- End Content Area -->
					</div>
					<!-- End Row within Card Body -->
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Orders Table Template -->
<template id="orders-template">
	<div>
		<h1 class="h4 text-gray-900 mb-4">Đơn Hàng</h1>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th scope="col">STT</th>
					<th scope="col">Mặt hàng</th>
					<th scope="col">Ngày đặt</th>
					<th scope="col">Tổng</th>
					<th scope="col">Trạng thái</th>
					<th scope="col"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="order" items="${listOrder}" varStatus="loop">
					<tr>
						<th>${loop.index+1}</th>
						<td>
							<c:forEach var="item" items="${listCountOrderDetail}">
								<c:if test="${item.orderId == order.orderId}">
									${item.countOrderDetail}
								</c:if>
							</c:forEach>
						</td>
						<td>
							<fmt:formatDate value="${order.date}"
								pattern="HH:mm:ss dd/MM/yyyy" />
						</td>
						<td class="text-success">
							<fmt:formatNumber value="${order.totalAmount}" type="number" />
							đ
						</td>
						<td>${order.status}</td>
						<td>
							<a href="#"
								class="btn bg-warning py-1 px-3 rounded-pill">
								Xem<i class="fa fa-arrow-right"></i>
							</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</template>

<!-- Personal Info Template -->
<template id="personal-info-template">
	<div>
		<div class="text-center">
			<h1 class="h4 text-gray-900 mb-4">Thông tin khách hàng</h1>
		</div>
		<form action="/information" method="POST" class="user">
			<div class="row">
				<div class="col-2">Họ Tên:</div>
				<div class="col-10">
					<div class="form-group">
						<input type="text" name="fullname"
							class="form-control rounded-input"
							placeholder="${userSession.fullname}" disabled>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-2">Giới tính:</div>
				<div class="col-10">
					<div class="form-group">
						<input type="text" name="gender"
							class="form-control rounded-input"
							placeholder="${userSession.gender ? 'Nam' : 'Nữ'}" disabled>
					</div>
				</div>
			</div>
			<hr>
			<form action="/delete-address" method="POST" id="delete-address-form">
				<div class="form-group">
					<label for="address-select">Chọn Địa chỉ:</label> <select
						id="address-select" name="addressId" class="form-control"
						onchange="updateAddressInfo()">
						<c:forEach var="a" items="${addressSession}">
							<option value="${a.addressId}" data-phone="${a.phoneNumber}"
								data-email="${a.email}" data-address="${a.address}"
								data-provincial="${a.provincial}">${a.address}</option>
						</c:forEach>
					</select>
				</div>
				<button type="submit" class="btn btn-danger">Xóa Địa chỉ</button>
			</form>

			<div id="address-info">
				<!-- Default Address Info -->
				<c:if test="${not empty addressSession}">
					<div class="row">
						<div class="col-3">Số điện thoại:</div>
						<div class="col-9">
							<div class="form-group">
								<input type="number" id="phone-number"
									class="form-control rounded-input"
									placeholder="${addressSession[0].phoneNumber}" disabled>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-3">Email:</div>
						<div class="col-9">
							<div class="form-group">
								<input type="email" id="email"
									class="form-control rounded-input"
									placeholder="${addressSession[0].email}" disabled>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-3">Địa chỉ:</div>
						<div class="col-6">
							<div class="form-group">
								<input type="text" id="address"
									class="form-control rounded-input"
									placeholder="${addressSession[0].address}" disabled>
							</div>
						</div>
						<div class="col-3">
							<div class="form-group">
								<input type="text" id="provincial"
									class="form-control rounded-input"
									placeholder="${addressSession[0].provincial}" disabled>
							</div>
						</div>
					</div>
				</c:if>
			</div>
			<!-- Button trigger modal -->
			<button type="button" class="btn btn-primary" data-toggle="modal"
				data-target="#updateInformation">Cập nhật tài khoản</button>
			<button type="button" class="btn btn-primary" data-toggle="modal"
				data-target="#newAddress">Thêm địa chỉ mới</button>
			<a type="button" href="/forgot-password" class="btn btn-primary">Quên mật khẩu</a>
			<a href="/change-password" type="button"  class="btn btn-primary ">Đổi mật khẩu</a>
		</form>
		<!-- Modal cập nhật tài khoản -->
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
									value="${userSession.fullname}">
							</div>
							<div class="form-group row">
								<div class="col-sm-6">
									<div class="custom-control custom-radio custom-control-inline">
										<input type="radio" id="genderMale" name="gender"
											class="custom-control-input" value="male"
											${userSession.gender ? 'checked' : ''}> <label
											class="custom-control-label" for="genderMale">Nam</label>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="custom-control custom-radio custom-control-inline">
										<input type="radio" id="genderFemale" name="gender"
											class="custom-control-input" value="female"
											${!userSession.gender ? 'checked' : ''}> <label
											class="custom-control-label" for="genderFemale">Nữ</label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<select id="modal-address-select" class="form-control"
									onchange="updateModalAddressInfo()">
									<c:forEach var="a" items="${addressSession}">
										<option value="${a.address}" data-phone="${a.phoneNumber}"
											data-email="${a.email}" data-address="${a.address}"
											data-provincial="${a.provincial}">${a.address}</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group">
								<input type="number" name="PhoneNumber" id="modal-phone-number"
									class="form-control rounded-input">
							</div>
							<div class="form-group">
								<input type="email" name="email" id="modal-email"
									class="form-control rounded-input">
							</div>
							<div class="form-group">
								<input type="text" name="address" id="modal-address"
									class="form-control rounded-input">
							</div>
							<div class="form-group">
								<input type="text" name="provincial" id="modal-provincial"
									class="form-control rounded-input">
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Đóng</button>
							<button type="submit" class="btn btn-primary">Lưu thay
								đổi</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- End Modal cập nhật tài khoản-->
		<!-- Modal thêm địa chỉ mới -->
		<div class="modal fade" id="newAddress" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title text-gray-900" id="exampleModalLabel">Thêm
							địa chỉ mới</h5>
					</div>
					<form action="/new-address" method="GET" class="user">
						<div class="modal-body">
							<div class="form-group">
								<input type="number" name="PhoneNumber" id="modal-phone-number"
									class="form-control rounded-input"
									placeholder="Số điện thoại...">
							</div>
							<div class="form-group">
								<input type="email" name="email" id="modal-email"
									class="form-control rounded-input" placeholder="Email...">
							</div>
							<div class="form-group">
								<input type="text" name="address" id="modal-address"
									class="form-control rounded-input"
									placeholder="Địa chỉ của bạn...">
							</div>
							<div class="form-group">
								<input type="text" name="provincial" id="modal-provincial"
									class="form-control rounded-input" placeholder="Tỉnh...">
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Đóng</button>
							<button type="submit" class="btn btn-primary">Lưu thay
								đổi</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- End Modal thêm địa chỉ mới-->
	</div>
</template>

<script>
    function showOrders() {
        const template = document.getElementById('orders-template').content.cloneNode(true);
        const contentArea = document.getElementById('content-area');
        contentArea.innerHTML = '';
        contentArea.appendChild(template);
    }

    function showPersonalInfo() {
        const template = document.getElementById('personal-info-template').content.cloneNode(true);
        const contentArea = document.getElementById('content-area');
        contentArea.innerHTML = '';
        contentArea.appendChild(template);
    }

    function updateAddressInfo() {
        const selectElement = document.getElementById('address-select');
        const selectedOption = selectElement.options[selectElement.selectedIndex];

        document.getElementById('phone-number').placeholder = selectedOption.getAttribute('data-phone');
        document.getElementById('email').placeholder = selectedOption.getAttribute('data-email');
        document.getElementById('address').placeholder = selectedOption.getAttribute('data-address');
        document.getElementById('provincial').placeholder = selectedOption.getAttribute('data-provincial');
    }

    function updateModalAddressInfo() {
        const selectElement = document.getElementById('modal-address-select');
        const selectedOption = selectElement.options[selectElement.selectedIndex];

        //document.getElementById('address-id').value = selectedOption.value;
        
        document.getElementById('modal-phone-number').value = selectedOption.getAttribute('data-phone');
        document.getElementById('modal-email').value = selectedOption.getAttribute('data-email');
        document.getElementById('modal-address').value = selectedOption.getAttribute('data-address');
        document.getElementById('modal-provincial').value = selectedOption.getAttribute('data-provincial');
    }
</script>
