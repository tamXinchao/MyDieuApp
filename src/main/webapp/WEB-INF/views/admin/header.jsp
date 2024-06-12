<%@ page pageEncoding="UTF-8"%>
<!-- PAGE CONTAINER-->

<div class="page-container">
	<!-- HEADER DESKTOP-->
	<header class="header-desktop">
		<div class="section__content section__content--p30">
			<div class="container-fluid" >
				<div class="header-wrap">
					<form class="form-header" action="" method="POST">
					</form>
					<div class="header-button">
						<div class="noti-wrap">
						<div class="account-wrap">
							<div class="account-item clearfix js-item-menu">
								<div class="image">
									<img src="/adminTemplate/images/icon/avatar-01.jpg"
										alt="John Doe" />
								</div>
								<div class="content">
									<a class="js-acc-btn" href="#">${userSession.fullname }</a>
								</div>
								<div class="account-dropdown js-dropdown">
									<div class="info clearfix">
										<div class="image">
											<a href="#"> <img
												src="/adminTemplate/images/icon/avatar-01.jpg"
												alt="John Doe" />
											</a>
										</div>
										<div class="content">
											<h5 class="name">
												<a href="#">${userSession.fullname}</a>
											</h5>
											<span class="email">${addressSession[0].email}</span>
										</div>
									</div>
									<div class="account-dropdown__body">
										<div class="account-dropdown__item">
											<a href="/information"> <i class="zmdi zmdi-account"></i>Thông tin cá nhân 
											</a>
										</div>
									</div>
									<div class="account-dropdown__footer">
										<a href="/logout"> <i class="zmdi zmdi-power"></i>Đăng xuất
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>