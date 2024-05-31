<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Topbar Start -->
<div class="container-fluid">
	<div class="row align-items-center py-3 px-xl-5">
		<div class="col-lg-3 d-none d-lg-block">
			<a href="/trang-chu" class="text-decoration-none">
				<h1 class="m-0 display-5 font-weight-semi-bold">
					<span class="text-primary font-weight-bold border px-3 mr-1">E</span>Shopper
				</h1>
			</a>
		</div>
		<div class="col-lg-6 col-6 text-left">
			<form action="">
				<div class="input-group">
					<input type="text" class="form-control"
						placeholder="Search for products">
					<div class="input-group-append">
						<span class="input-group-text bg-transparent text-primary">
							<i class="fa fa-search"></i>
						</span>
					</div>
				</div>
			</form>
		</div>
		<div class="col-lg-3 col-6 text-right">
			<a href="" class="btn border"> <i
				class="fas fa-heart text-primary"></i> <span class="badge">0</span>
			</a> <a href="/gio-hang" class="btn border"> <i
				class="fas fa-shopping-cart text-primary"></i> <span class="badge">0</span>
			</a>
		</div>
	</div>
</div>
<!-- Topbar End -->


<!-- Navbar Start -->
<div class="container-fluid">
	<div class="row border-top px-xl-5">
		<div class="col-lg-3 d-none d-lg-block">
			<a
				class="btn shadow-none d-flex align-items-center justify-content-between bg-primary text-white w-100"
				data-toggle="collapse" href="#navbar-vertical"
				style="height: 65px; margin-top: -1px; padding: 0 30px;">
				<h6 class="m-0">Categories</h6> <i
				class="fa fa-angle-down text-dark"></i>
			</a>
			<nav
				class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0 bg-light"
				id="navbar-vertical" style="width: calc(100% - 30px); z-index: 1;">
				<div class="navbar-nav w-100 overflow-hidden" style="height: 410px">
					
					<c:forEach var="c" items="${categories}">	
						<a href="/shop/category/${c.cateId}" class="nav-item nav-link">${c.name}</a>
						</c:forEach>
				</div>
			</nav>
		</div>
		<div class="col-lg-9">
			<nav
				class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0">
				<a href="/trang-chu" class="text-decoration-none d-block d-lg-none">
					<h1 class="m-0 display-5 font-weight-semi-bold">
						<span class="text-primary font-weight-bold border px-3 mr-1">E</span>Shopper
					</h1>
				</a>
				<button type="button" class="navbar-toggler" data-toggle="collapse"
					data-target="#navbarCollapse">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse justify-content-between"
					id="navbarCollapse">
					<div class="navbar-nav mr-auto py-0">
						<a href="/trang-chu" class="nav-item nav-link">Home</a> <a
							href="/shop" class="nav-item nav-link">Shop</a>
						<div class="nav-item dropdown">
							<a href="#" class="nav-link dropdown-toggle active"
								data-toggle="dropdown">Pages</a>
							<div class="dropdown-menu rounded-0 m-0">
								<a href="/admin/trang-chu" class="dropdown-item">Admin pages</a>
							</div>
						</div>
						<a href="contact.html" class="nav-item nav-link">Contact</a>
					</div>
					<div class="navbar-nav ml-auto py-0">
						<a href="/login" class="nav-item nav-link">Login</a> <a
							href="/register" class="nav-item nav-link">Register</a>
					</div>
				</div>
			</nav>
		</div>
	</div>
</div>
<!-- Navbar End -->