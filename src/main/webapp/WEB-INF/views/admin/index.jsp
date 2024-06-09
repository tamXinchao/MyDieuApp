

	<!-- MAIN CONTENT-->
	<div class="main-content">
		<div class="section__content section__content--p30">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<div class="overview-wrap">
							<h2 class="title-1">overview</h2>
							<button class="au-btn au-btn-icon au-btn--blue">
								<i class="zmdi zmdi-plus"></i>add item
							</button>
						</div>
					</div>
				</div>
				<div class="row m-t-25">
					<div class="col-sm-6 col-lg-3">
						<div class="overview-item overview-item--c1">
							<div class="overview__inner">
								<div class="overview-box clearfix">
									<div class="icon">
										<i class="zmdi zmdi-account-o"></i>
									</div>
									<div class="text">
										<h2>10368</h2>
										<span>members online</span>
									</div>
								</div>
								<div class="overview-chart">
									<canvas id="widgetChart1"></canvas>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-lg-3">
						<div class="overview-item overview-item--c2">
							<div class="overview__inner">
								<div class="overview-box clearfix">
									<div class="icon">
										<i class="zmdi zmdi-shopping-cart"></i>
									</div>
									<div class="text">
										<h2>388,688</h2>
										<span>items solid</span>
									</div>
								</div>
								<div class="overview-chart">
									<canvas id="widgetChart2"></canvas>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-lg-3">
						<div class="overview-item overview-item--c3">
							<div class="overview__inner">
								<div class="overview-box clearfix">
									<div class="icon">
										<i class="zmdi zmdi-calendar-note"></i>
									</div>
									<div class="text">
										<h2>1,086</h2>
										<span>this week</span>
									</div>
								</div>
								<div class="overview-chart">
									<canvas id="widgetChart3"></canvas>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-lg-3">
						<div class="overview-item overview-item--c4">
							<div class="overview__inner">
								<div class="overview-box clearfix">
									<div class="icon">
										<i class="zmdi zmdi-money"></i>
									</div>
									<div class="text">
										<h2>$1,060,386</h2>
										<span>total earnings</span>
									</div>
								</div>
								<div class="overview-chart">
									<canvas id="widgetChart4"></canvas>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-6">
						<div class="au-card recent-report">
							<div class="au-card-inner">
								<h3 class="title-2">recent reports</h3>
								<div class="chart-info">
									<div class="chart-info__left">
										<div class="chart-note">
											<span class="dot dot--blue"></span> <span>products</span>
										</div>
										<div class="chart-note mr-0">
											<span class="dot dot--green"></span> <span>services</span>
										</div>
									</div>
									<div class="chart-info__right">
										<div class="chart-statis">
											<span class="index incre"> <i
												class="zmdi zmdi-long-arrow-up"></i>25%
											</span> <span class="label">products</span>
										</div>
										<div class="chart-statis mr-0">
											<span class="index decre"> <i
												class="zmdi zmdi-long-arrow-down"></i>10%
											</span> <span class="label">services</span>
										</div>
									</div>
								</div>
								<div class="recent-report__chart">
									<canvas id="recent-rep-chart"></canvas>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="au-card chart-percent-card">
							<div class="au-card-inner">
								<h3 class="title-2 tm-b-5">char by %</h3>
								<div class="row no-gutters">
									<div class="col-xl-6">
										<div class="chart-note-wrap">
											<div class="chart-note mr-0 d-block">
												<span class="dot dot--blue"></span> <span>products</span>
											</div>
											<div class="chart-note mr-0 d-block">
												<span class="dot dot--red"></span> <span>services</span>
											</div>
										</div>
									</div>
									<div class="col-xl-6">
										<div class="percent-chart">
											<canvas id="percent-chart"></canvas>
										</div>
									</div>
								</div>
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
</div>
<script>
	// Function to render the Recent Report Chart
	function renderRecentReportChart() {
		var ctx = document.getElementById('recent-rep-chart').getContext('2d');
		new Chart(ctx, {
			type : 'line',
			data : {
				labels : [ 'January', 'February', 'March', 'April', 'May',
						'June' ],
				datasets : [ {
					label : 'Products',
					backgroundColor : 'rgba(54, 162, 235, 0.2)',
					borderColor : 'rgba(54, 162, 235, 1)',
					data : [ 65, 59, 80, 81, 56, 55 ],
					fill : false
				}, {
					label : 'Services',
					backgroundColor : 'rgba(75, 192, 192, 0.2)',
					borderColor : 'rgba(75, 192, 192, 1)',
					data : [ 28, 48, 40, 19, 86, 27 ],
					fill : false
				} ]
			},
			options : {
				responsive : true,
				scales : {
					x : {
						display : true,
						title : {
							display : true,
							text : 'Month'
						}
					},
					y : {
						display : true,
						title : {
							display : true,
							text : 'Value'
						}
					}
				}
			}
		});
	}

	// Function to render the Percent Chart
	function renderPercentChart() {
		var ctx = document.getElementById('percent-chart').getContext('2d');
		new Chart(ctx, {
			type : 'doughnut',
			data : {
				labels : [ 'Products', 'Services' ],
				datasets : [ {
					data : [ 60, 40 ],
					backgroundColor : [ 'rgba(54, 162, 235, 0.2)',
							'rgba(255, 99, 132, 0.2)' ],
					borderColor : [ 'rgba(54, 162, 235, 1)',
							'rgba(255, 99, 132, 1)' ]
				} ]
			},
			options : {
				responsive : true
			}
		});
	}

	// Render the charts when the window loads
	window.onload = function() {
		renderRecentReportChart();
		renderPercentChart();
	};
</script>
