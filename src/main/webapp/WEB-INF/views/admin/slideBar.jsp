<%@ page language="java" pageEncoding="UTF-8"%>
<!-- HEADER MOBILE-->
<header class="header-mobile d-block d-lg-none">
	<div class="header-mobile__bar">
		<div class="container-fluid">
			<div class="header-mobile-inner">
				<a class="logo" href="/admin/trang-chu"> <img
					src="/adminTemplate/images/icon/logo.png" alt="CoolAdmin" />
				</a>
				<button class="hamburger hamburger--slider" type="button">
					<span class="hamburger-box"> <span class="hamburger-inner"></span>
					</span>
				</button>
			</div>
		</div>
	</div>
	<nav class="navbar-mobile">
		<div class="container-fluid">
			<ul class="navbar-mobile__list list-unstyled">
				<li><a href="/admin/trang-chu"> <i class="fas fa-chart-bar"></i>Trang
						Chủ
				</a></li>
				<li><a href="/admin/chart"> <i class="fas fa-chart-bar"></i>Biểu
						Đồ
				</a></li>
				<li class="has-sub"><a class="js-arrow" href="#"> <i
						class="fas fa-table"></i>Product
				</a>
					<ul class="navbar-mobile-sub__list list-unstyled js-sub-list">
						<li><a href="login.html">Login</a></li>
						<li><a href="register.html">Register</a></li>
						<li><a href="forget-pass.html">Forget Password</a></li>
					</ul></li>
				<li><a href="form.html"> <i class="far fa-check-square"></i>Forms
				</a></li>
				<li><a href="calendar.html"> <i class="fas fa-calendar-alt"></i>Calendar
				</a></li>
				<li><a href="map.html"> <i class="fas fa-map-marker-alt"></i>Maps
				</a></li>

				<li class="has-sub"><a class="js-arrow" href="#"> <i
						class="fas fa-desktop"></i>UI Elements
				</a>
					<ul class="navbar-mobile-sub__list list-unstyled js-sub-list">
						<li><a href="button.html">Button</a></li>
						<li><a href="badge.html">Badges</a></li>
						<li><a href="tab.html">Tabs</a></li>
						<li><a href="card.html">Cards</a></li>
						<li><a href="alert.html">Alerts</a></li>
						<li><a href="progress-bar.html">Progress Bars</a></li>
						<li><a href="modal.html">Modals</a></li>
						<li><a href="switch.html">Switchs</a></li>
						<li><a href="grid.html">Grids</a></li>
						<li><a href="fontawesome.html">Fontawesome Icon</a></li>
						<li><a href="typo.html">Typography</a></li>
					</ul></li>
			</ul>
		</div>
	</nav>
</header>
<!-- END HEADER MOBILE-->

<!-- MENU SIDEBAR-->
<aside class="menu-sidebar d-none d-lg-block">
	<div class="logo">
		<a href="/trang-chu" class="text-decoration-none">
			<h1 class="m-0 display-5 font-weight-semi-bold">
				<span class="text-primary font-weight-bold border px-2 mr-1">M</span>Mỹ
				Diệu
			</h1>
		</a>
	</div>
	<div class="menu-sidebar__content js-scrollbar1">
		<nav class="navbar-sidebar">
			<ul class="list-unstyled navbar__list">
				<li class=" has-sub"><a href="/admin/trang-chu"> <i
						class="fas fa-tachometer-alt"></i>Trang Chủ
				</a></li>
				<li class="has-sub"><a class="js-arrow" href="#"> <i
						class="fas fa-table"></i>Quản Lý
				</a>
					<ul class="navbar-mobile-sub__list list-unstyled js-sub-list">
						<li><a href="/admin/tableEditProduct"> Product</a></li>
						<li><a href="/admin/edit-category">Category</a></li>
						<li><a href="">Thương Hiệu</a></li>
						<li><a href="/admin/users">Người dùng</a></li>
					</ul></li>
				<li class="has-sub"><a class="js-arrow fw-bold" href="#"> <i
						class="fas fa-table"></i>Quản lý hóa đơn
				</a>
					<ul class="navbar-mobile-sub__list list-unstyled js-sub-list">
						<li><a href="/admin/form-admin-order-confirm">Chờ xác nhận</a></li>
						<li><a href="/admin/form-admin-order-pending">Đang chuẩn bị</a></li>
						<li><a href="/admin/form-admin-order-delivering">Đang giao</a></li>
						<li><a href="/admin/form-admin-order-delivered">Giao hàng thành công</a></li>
						<li><a href="/admin/form-admin-order-returned">Trả hàng</a></li>
						<li><a href="/admin/form-admin-order-canceled">Đã hủy</a></li>
					</ul></li>

				</a>
				</li>
				<li><a href="/admin/chart"> <i class="fas fa-chart-bar"></i>Biểu
						Đồ
				</a></li>
				<li><a href="map.html"> <i class="fas fa-map-marker-alt"></i>Maps
				</a></li>
			</ul>
		</nav>
	</div>
</aside>
<!-- END MENU SIDEBAR-->