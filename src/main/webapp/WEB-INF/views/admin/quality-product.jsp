<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<div class="main-content">
    <div class="section__content section__content--p30">
        <div class="container-fluid">
            <div class="row justify-content-center">
                <form method="post" class="form-material w-75" style="background: #FFF;" action="/admin/product-quality/${product.productId}">
                    <div class="col-md-12">
                        <div class="form-group form-primary">
                            <label for="productName">Tên Sản Phẩm</label>
                            <input type="text" id="productName" name="productName" disabled value="${product.productName}" class="form-control">
                        </div>
                        <div id="product-details-container">
                            <c:forEach var="pscItem" items="${pscList}">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <div class="form-group form-primary">
                                            <label for="sizeSelect-${pscItem.color.colorId}-${pscItem.size.sizeId}">Size</label>
                                            <select id="sizeSelect-${pscItem.color.colorId}-${pscItem.size.sizeId}" name="sizeIds" class="form-control">
                                                <c:forEach var="size" items="${sizes}">
                                                    <option value="${size.sizeId}" <c:if test="${size.sizeId == pscItem.size.sizeId}">selected</c:if>>${size.name}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-group form-primary">
                                            <label for="colorSelect-${pscItem.color.colorId}-${pscItem.size.sizeId}">Màu</label>
                                            <select id="colorSelect-${pscItem.color.colorId}-${pscItem.size.sizeId}" name="colorIds" class="form-control">
                                                <c:forEach var="color" items="${colors}">
                                                    <option value="${color.colorId}" <c:if test="${color.colorId == pscItem.color.colorId}">selected</c:if>>${color.name}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-group form-primary">
                                            <label>Số Lượng</label>
                                            <input type="number" name="quantity" value="${pscItem.quality}" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-group form-primary">
                                            <label>Giá</label>
                                            <input type="number" name="price" value="${pscItem.price}" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <div class="text-right">
                            <button type="button" class="btn btn-primary" onclick="addNewRow()">Thêm Số Lượng</button>
                            <button type="submit" class="btn btn-primary">Cập Nhật</button>
                            <a href="/admin/tableEditProduct" class="btn btn-secondary">Hủy</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    function addNewRow() {
        const container = document.getElementById("product-details-container");
        const newRow = document.createElement("div");
        newRow.className = "row";

        newRow.innerHTML = `
            <div class="col-sm-3">
                <div class="form-group form-primary">
                    <label for="newSizeSelect">Size</label>
                    <select id="newSizeSelect" name="sizeIds" class="form-control">
                        <c:forEach var="size" items="${sizes}">
                            <option value="${size.sizeId}">${size.name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="form-group form-primary">
                    <label for="newColorSelect">Màu</label>
                    <select id="newColorSelect" name="colorIds" class="form-control">
                        <c:forEach var="color" items="${colors}">
                            <option value="${color.colorId}">${color.name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="form-group form-primary">
                    <label>Số Lượng</label>
                    <input type="number" name="quantity" value="0" class="form-control">
                </div>
            </div>
            <div class="col-sm-3">
                <div class="form-group form-primary">
                    <label>Giá</label>
                    <input type="number" name="price" value="0" class="form-control">
                </div>
            </div>
        `;
        container.appendChild(newRow);
    }
</script>
