<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" pageEncoding="UTF-8"%>
<div class="main-content">
    <div class="section__content section__content--p30">
        <div class="container-fluid">
            <div class="page-wrapper">
                <div class="page-body" id="main_content">
                    <div class="card">
                        <div class="card-header">
                            <h5>Form Edit User</h5>
                        </div>
                        <div class="card-block">
                            <form action="/admin/edit-user" method="post" class="form-material" id="userForm" enctype="multipart/form-data">
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="form-group form-primary">
                                            <input type="text" name="fullname" class="form-control">
                                            <span class="form-bar"></span>
                                            <label class="float-label">Tên người dùng</label>
                                        </div>
                                        <div class="form-group form-primary">
                                            <input type="text" name="username" class="form-control">
                                            <span class="form-bar"></span>
                                            <label class="float-label">Tài khoản</label>
                                        </div>
                                        <div class="form-group form-primary">
                                            <input type="password" name="password" class="form-control">
                                            <span class="form-bar"></span>
                                            <label class="float-label">Mật khẩu</label>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group form-primary">
                                                    <select name="gender" id="gender" class="form-control">
                                                        <c:forEach items="${genders}" var="gender">
                                                            <option value="${gender}">${gender}</option>
                                                        </c:forEach>
                                                    </select>
                                                    <span class="form-bar"></span>
                                                    <label class="float-label">Giới tính</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group form-primary">
                                                    <select name="role" id="role" class="form-control">
                                                        <c:forEach items="${roles}" var="role">
                                                            <option value="${role.role_Id}">${role.name}</option>
                                                        </c:forEach>
                                                    </select>
                                                    <span class="form-bar"></span>
                                                    <label class="float-label">Vai trò</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group form-primary">
                                                    <input type="number" name="phoneNumber" class="form-control">
                                                    <span class="form-bar"></span>
                                                    <label class="float-label">Số điện thoại</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group form-primary">
                                                    <input type="email" name="email" class="form-control">
                                                    <span class="form-bar"></span>
                                                    <label class="float-label">Email</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group form-primary">
                                                    <input type="text" name="address" class="form-control">
                                                    <span class="form-bar"></span>
                                                    <label class="float-label">Địa chỉ</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group form-primary">
                                                    <input type="text" name="provincial" class="form-control">
                                                    <span class="form-bar"></span>
                                                    <label class="float-label">Tỉnh</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="mt-3 row">
                                    <div class="col-sm-3">
                                        <button type="submit" name="action" value="create" class="btn btn-primary w-100 font-weight-bold">Create</button>
                                    </div>
                                    <div class="col-sm-3">
                                        <button type="submit" name="action" value="update" class="btn btn-warning w-100 font-weight-bold">Update</button>
                                    </div>
                                    <div class="col-sm-3">
                                        <button type="reset" class="btn btn-primary w-100 font-weight-bold">Reset</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- Page-body end -->
                </div>
                <div id="styleSelector"></div>
            </div>
        </div>
    </div>
</div>

