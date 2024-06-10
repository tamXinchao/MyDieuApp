<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<div class="main-content">
	<div class="section__content section__content--p30">
		<div class="container-fluid">
			<div class="row justify-content-center">
				<form method="post" class="form-material" style="background: #FFF;"
					action="/admin/product-quality/${product.productId}">
					<div class="col-md-12">
						<div class="form-group form-primary">
							<label for="productName">Tên Sản Phẩm</label> <input type="text"
								id="productName" name="productName" disabled
								value="${product.productName}" class="form-control">
						</div>
						<div class="row">
							<c:forEach var="psc" items="${psc}">
								<div class="col-sm-4">
									<div class="form-group form-primary">
										<label for="color">Màu</label> <input type="text" disabled
											value="${psc.color.name}" class="form-control">
										<%-- <input
											type="hidden" name="colorId" value="${psc.color.colorId}" /> --%>
									</div>
								</div>
								<div class="col-sm-4">
									<div class="form-group form-primary">
										<label for="color">Size</label> <input type="text" disabled
											value="${psc.size.name}" class="form-control">
										<%-- <input
											type="hidden" name="sizeId" value="${psc.size.sizeId}" /> --%>
									</div>
								</div>
								<div class="col-sm-4">
									<div class="form-group form-primary">
										<label>Số Lượng</label> <input type="number" name="quality"
											value="${psc.quality}" class="form-control">
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
					<div class="text-right">
						<!-- Align buttons to the right -->
						<button type="submit" class="btn btn-primary">Thêm</button>
						<a href="/admin/tableEditProduct" type="submit" class="btn btn-secondary">Hủy</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
