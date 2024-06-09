<%@ page language="java" pageEncoding="UTF-8"%>
<div class="main-content">
	<div class="section__content section__content--p30">
		<!-- Main-body start -->
		<div class="container-fluid">
			<div class="page-wrapper">
				<!-- Page-body start -->
				<div class="page-body" id="main_content">
					<!-- Basic table card start -->
					<div class="card">
						<div class="card-header">
							<h5>Order Manament</h5>
							<span>checkout and delete function</span>
							<div class="card-header-right"></div>
						</div>
						<div class="card-body bg-transparent table-border-style">
							<div class="table-responsive">
								<table class="table" id="table-edit">
									<thead>
										<tr>
											<th>#</th>
											<th>Fullname</th>
											<th>Phone</th>
											<th>Create Date</th>
											<th>Status</th>
											<th>Total Price</th>
											<th></th>
										</tr>
									</thead>
									<tbody>

										<tr>
											<th scope="row">1</th>
											<td><img src="/manager/avatar/thangnnc.jpg" alt=""
												class="rounded-circle" style="width: 40px; height: 40px;">
												Thăng Nguyễn</td>
											<td>0949006346</td>
											<td>2022-06-18</td>
											<td><label class="badge badge-warning p-2"
												style="font-size: 12px;">Waiting confirm</label></td>
											<td class="text-success">150,000 VND</td>
											<td>
												<button onclick="confirmOrder('13',this)"
													class="btn bg-transparent text-primary text-center p-1 mr-2">
													<i class="fa fa-check-square m-0" aria-hidden="true"
														style="font-size: 24px;"></i>
												</button>
												<button onclick="deleteOrder('13',this)"
													class="btn bg-transparent text-danger text-center p-1 mr-2">
													<i class="fa fa-trash m-0" style="font-size: 24px;"
														aria-hidden="true"></i>
												</button> <a href="/admin/form-admin-order-detail"
												class="btn bg-success py-1 px-3 rounded-pill"> Detail <i
													class="fa fa-arrow-right"></i>
											</a>
											</td>
										</tr>

									</tbody>
								</table>
							</div>
						</div>
						<div class="card-footer" style="border-top: 2px solid #d7dce0;">
							<nav aria-label="Page navigation example"
								class=" d-flex justify-content-between">
								<ul class="pagination" id="pageNumber">
									<li class="page-item">
										<button class="btn page-link" onclick="select(this,0)">First</button>
									</li>
									<li class="page-item"><button class="btn page-link"
											onclick="select(this,0)">Prev</button></li>
									<li class="page-item"><button class="btn page-link">1/1</button></li>
									<li class="page-item"><button class="btn page-link"
											onclick="select(this,0)">Next</button></li>
									<li class="page-item">
										<button class="btn page-link" onclick="select(this,0)">Last</button>
									</li>
								</ul>
							</nav>
						</div>
					</div>
					<!-- Basic table card end -->
				</div>

				<!-- Page-body end -->
			</div>
			<div id="styleSelector"></div>
		</div>
	</div>
</div>