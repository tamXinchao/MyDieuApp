<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mã xác nhận</title>
<!-- Custom fonts for this template-->
<link href="/manager/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/manager/css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body class="bg-gradient-primary">
	<div class="container">

		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				<div class="row">
					<div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
					<div class="col-lg-7">
						<div class="p-5">
							<div class="text-center">
								<h1 class="h4 text-gray-900 mb-4">Mã xác nhận</h1>
							</div>
							<form action="/maxacnhan" method="POST" class="user">
								<div class="form-group row">
									<div class="col-sm-12">
										<input type="text" name="MaXacNhan"
											class="form-control form-control-user" id="exampleLastName"
											placeholder="Mã xác thực - OTP">
										<div class="invalid-feedback text-center">Vui lòng nhập mã xác thực!</div>
									</div>
								</div>
								<button type="submit" class="btn btn-primary btn-user btn-block">Xác nhận</button>
								<hr>
							</form>
							<div class="text-center">
								<a class="small" href="/trang-chu">Hủy -></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<!-- Bootstrap core JavaScript-->
<script src="/manager/vendor/jquery/jquery.min.js"></script>
<script src="/manager/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/manager/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/manager/js/sb-admin-2.min.js"></script>

<!-- Đoạn js này lấy đọc mail và gửi về server bằng HTTP -->
<script>
    // Xử lý sự kiện khi nhấn nút "Gửi"
    document.getElementById("sendEmail").addEventListener("click", function() {
        // Lấy trường email và giá trị của nó
        var emailField = document.getElementById("Email");
        var emailValue = emailField.value;

        // Gửi giá trị email đến code Java thông qua yêu cầu HTTP
        fetch('/register', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ email: emailValue }),
        })
        .then(response => {
            // Xử lý phản hồi từ server nếu cần
            console.log(response);
        })
        .catch(error => {
            console.error('Error:', error);
        });
    });
</script>
</html>
