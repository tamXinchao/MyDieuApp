
<div class="page-container">
	<!-- HEADER DESKTOP-->
	<header class="header-desktop">
		<div class="section__content section__content--p30">
			<div class="container-fluid">
				<div class="header-wrap">
					<form class="form-header" action="" method="POST">
						<input class="au-input au-input--xl" type="text" name="search"
							placeholder="Search for datas &amp; reports..." />
						<button class="au-btn--submit" type="submit">
							<i class="zmdi zmdi-search"></i>
						</button>
					</form>
					<div class="header-button">
						<div class="noti-wrap">
							<div class="noti__item js-item-menu">
								<i class="zmdi zmdi-comment-more"></i> <span class="quantity">1</span>
								<div class="mess-dropdown js-dropdown">
									<div class="mess__title">
										<p>You have 2 news message</p>
									</div>
									<div class="mess__item">
										<div class="image img-cir img-40">
											<img src="images/icon/avatar-06.jpg" alt="Michelle Moreno" />
										</div>
										<div class="content">
											<h6>Michelle Moreno</h6>
											<p>Have sent a photo</p>
											<span class="time">3 min ago</span>
										</div>
									</div>
									<div class="mess__item">
										<div class="image img-cir img-40">
											<img src="images/icon/avatar-04.jpg" alt="Diane Myers" />
										</div>
										<div class="content">
											<h6>Diane Myers</h6>
											<p>You are now connected on message</p>
											<span class="time">Yesterday</span>
										</div>
									</div>
									<div class="mess__footer">
										<a href="#">View all messages</a>
									</div>
								</div>
							</div>
							<div class="noti__item js-item-menu">
								<i class="zmdi zmdi-email"></i> <span class="quantity">1</span>
								<div class="email-dropdown js-dropdown">
									<div class="email__title">
										<p>You have 3 New Emails</p>
									</div>
									<div class="email__item">
										<div class="image img-cir img-40">
											<img src="images/icon/avatar-06.jpg" alt="Cynthia Harvey" />
										</div>
										<div class="content">
											<p>Meeting about new dashboard...</p>
											<span>Cynthia Harvey, 3 min ago</span>
										</div>
									</div>
									<div class="email__item">
										<div class="image img-cir img-40">
											<img src="images/icon/avatar-05.jpg" alt="Cynthia Harvey" />
										</div>
										<div class="content">
											<p>Meeting about new dashboard...</p>
											<span>Cynthia Harvey, Yesterday</span>
										</div>
									</div>
									<div class="email__item">
										<div class="image img-cir img-40">
											<img src="images/icon/avatar-04.jpg" alt="Cynthia Harvey" />
										</div>
										<div class="content">
											<p>Meeting about new dashboard...</p>
											<span>Cynthia Harvey, April 12,,2018</span>
										</div>
									</div>
									<div class="email__footer">
										<a href="#">See all emails</a>
									</div>
								</div>
							</div>
							<div class="noti__item js-item-menu">
								<i class="zmdi zmdi-notifications"></i> <span class="quantity">3</span>
								<div class="notifi-dropdown js-dropdown">
									<div class="notifi__title">
										<p>You have 3 Notifications</p>
									</div>
									<div class="notifi__item">
										<div class="bg-c1 img-cir img-40">
											<i class="zmdi zmdi-email-open"></i>
										</div>
										<div class="content">
											<p>You got a email notification</p>
											<span class="date">April 12, 2018 06:50</span>
										</div>
									</div>
									<div class="notifi__item">
										<div class="bg-c2 img-cir img-40">
											<i class="zmdi zmdi-account-box"></i>
										</div>
										<div class="content">
											<p>Your account has been blocked</p>
											<span class="date">April 12, 2018 06:50</span>
										</div>
									</div>
									<div class="notifi__item">
										<div class="bg-c3 img-cir img-40">
											<i class="zmdi zmdi-file-text"></i>
										</div>
										<div class="content">
											<p>You got a new file</p>
											<span class="date">April 12, 2018 06:50</span>
										</div>
									</div>
									<div class="notifi__footer">
										<a href="#">All notifications</a>
									</div>
								</div>
							</div>
						</div>
						<div class="account-wrap">
							<div class="account-item clearfix js-item-menu">
								<div class="image">
									<img src="images/icon/avatar-01.jpg" alt="John Doe" />
								</div>
								<div class="content">
									<a class="js-acc-btn" href="#">john doe</a>
								</div>
								<div class="account-dropdown js-dropdown">
									<div class="info clearfix">
										<div class="image">
											<a href="#"> <img src="images/icon/avatar-01.jpg"
												alt="John Doe" />
											</a>
										</div>
										<div class="content">
											<h5 class="name">
												<a href="#">john doe</a>
											</h5>
											<span class="email">johndoe@example.com</span>
										</div>
									</div>
									<div class="account-dropdown__body">
										<div class="account-dropdown__item">
											<a href="#"> <i class="zmdi zmdi-account"></i>Account
											</a>
										</div>
										<div class="account-dropdown__item">
											<a href="#"> <i class="zmdi zmdi-settings"></i>Setting
											</a>
										</div>
										<div class="account-dropdown__item">
											<a href="#"> <i class="zmdi zmdi-money-box"></i>Billing
											</a>
										</div>
									</div>
									<div class="account-dropdown__footer">
										<a href="#"> <i class="zmdi zmdi-power"></i>Logout
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
	<!-- END HEADER DESKTOP-->

	<!-- MAIN CONTENT-->
	<div class="main-content">
		<div class="section__content section__content--p30">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-6">
						<div class="au-card m-b-30">
							<div class="au-card-inner">
								<h3 class="title-2 m-b-40">Yearly Sales</h3>
								<canvas id="sales-chart"></canvas>
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="au-card m-b-30">
							<div class="au-card-inner">
								<h3 class="title-2 m-b-40">Team Commits</h3>
								<canvas id="team-chart"></canvas>
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="au-card m-b-30">
							<div class="au-card-inner">
								<h3 class="title-2 m-b-40">Bar chart</h3>
								<canvas id="barChart"></canvas>
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="au-card m-b-30">
							<div class="au-card-inner">
								<h3 class="title-2 m-b-40">Rader chart</h3>
								<canvas id="radarChart"></canvas>
							</div>
						</div>
					</div>

				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="copyright">
							<p>
								Copyright © 2018 Colorlib. All rights reserved. Template by <a
									href="https://colorlib.com">Colorlib</a>.
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- END MAIN CONTENT-->
</div>

<script>
	document.addEventListener('DOMContentLoaded', function() {
		// Yearly Sales Chart
		var ctx1 = document.getElementById('sales-chart').getContext('2d');
		var salesChart = new Chart(ctx1, {
			type : 'line',
			data : {
				labels : [ 'January', 'February', 'March', 'April', 'May',
						'June', 'July' ],
				datasets : [ {
					label : 'Sales',
					data : [ 65, 59, 80, 81, 56, 55, 40 ],
					borderColor : 'rgba(75, 192, 192, 1)',
					borderWidth : 1
				} ]
			},
			options : {
				responsive : true,
				scales : {
					y : {
						beginAtZero : true
					}
				}
			}
		});

		// Team Commits Chart
		var ctx2 = document.getElementById('team-chart').getContext('2d');
		var teamChart = new Chart(ctx2, {
			type : 'bar',
			data : {
				labels : [ 'January', 'February', 'March', 'April', 'May',
						'June', 'July' ],
				datasets : [ {
					label : 'Commits',
					data : [ 12, 19, 3, 5, 2, 3, 9 ],
					backgroundColor : 'rgba(153, 102, 255, 0.2)',
					borderColor : 'rgba(153, 102, 255, 1)',
					borderWidth : 1
				} ]
			},
			options : {
				responsive : true,
				scales : {
					y : {
						beginAtZero : true
					}
				}
			}
		});

		// Khởi tạo các biểu đồ khác tương tự...
	});
</script>
