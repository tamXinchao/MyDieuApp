
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<c:forEach var="dsSp" items="${dsSp }">
	<div id="product-list" class="col-lg-4 col-md-6 col-sm-12 pb-1">
		<div class="card product-item border-0 mb-4">
			<div
				class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
				<a href="/product/detail/${dsSp[3]}/${dsSp[4]}"><img
					class="img-fluid w-100" src="/user/img/${dsSp[0]}" alt=""></a>

			</div>
			<div
				class="card-body border-left border-right text-center p-0 pt-4 pb-3">
				<h6 class="text-truncate mb-3">${dsSp[1]}</h6>
				<div class="d-flex justify-content-center">
					<h6>
						<fmt:formatNumber value="${dsSp[2]}"/>
					</h6>
				</div>
			</div>
			<div
				class="card-footer d-flex justify-content-between bg-light border">
				<a href="/product/detail/${dsSp[3]}/${dsSp[4]}"
					class="btn btn-sm text-dark p-0"><i
					class="fas fa-eye text-primary mr-1"></i>View Detail</a> <a
					href="/gio-hang" class="btn btn-sm text-dark p-0"><i
					class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
			</div>
		</div>
	</div>
</c:forEach>