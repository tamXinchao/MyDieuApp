
$(document).ready(function() {

	// validate of product form
    $("#productForm").validate({
        rules: {
            productName: {
                required: true,
            },
            slug: {
                required: true,
            },
            category: {
                required: true,
            },
            quantity: {
                required: true,
            },
            price: {
                required: true,
            },
            thumbnail: {
                required: true,
            },
            color1: {
                required: true,
            },
            hex1: {
                required: true,
            },
            image1_1: {
                required: true,
            },
        },
        messages: {
            productName: {
                required: "Please enter a product name!"
            },
            slug: {
                required: "Please enter a slug!"
            },
            category: {
                required: "Please choose a category!"
            },
            quantity: {
                required: "Please enter a quantity!"
            },
            price: {
                required: "Please enter a price!"
            },
            thumbnail: {
                required: "Please enter a thumbnail!"
            }
        }
    });
    
	$.validator.addMethod('accept', function () { return true; });
    // validate model register
    $("#registerForm").validate({
        rules: {
            username: {
                required: true,
            },
            password: {
                required: true,
            },
            confirm: {
                required: true,
            },
            fullname: {
                required: true,
            },
            email: {
                required: true,
            },
            gender: {
                required: true,
            },
            phone: {
                required: true,
            },
            avatar: {
                required: true,
                accept: true
            },
            address: {
                required: true,
            }
        },
        messages: {
            username: {
                required: "Hãy nhập tài khoản muốn đăng kí!",
            },
            password: {
                required: "Hãy nhập mật khẩu của bạn!",
            },
            confirm: {
                required: "Hãy nhập xác nhận mật khẩu của bạn!",
            },
            fullname: {
                required: "Hãy nhập họ tên của bạn!",
            },
            email: {
                required: "Hãy nhập email của bạn!",
            },
            gender: {
                required: "Hãy chọn giới tính của bạn!",
            },
            phone: {
                required: "Hãy nhập số điện thoại của bạn!",
            },
            avatar: {
                required: "Hãy chọn hình ảnh đại diện của bạn!",
            },
            address: {
                required: "Hãy nhập địa chỉ của bạn!",
            }
        }
    });
    
    // validate model login
    $("#loginForm").validate({
        rules: {
			username: {
                required: true,
            },
            password: {
                required: true,
            }
        },
        messages: {
			username: {
                required: "Hãy nhập tên tài khoản của bạn!",
            },
            password: {
                required: "Hãy nhập mật khẩu của bạn!",
            }
        }
    });
    
    // validate model edit profile
    $("#edit_profile").validate({
        rules: {
            fullname: {
                required: true,
            },
            email: {
                required: true,
            },
            gender: {
                required: true,
            },
            phone: {
                required: true,
            },
            avatar: {
                required: true,
                accept: true
            },
            address: {
                required: true,
            }
        },
        messages: {
            fullname: {
                required: "Hãy nhập họ tên của bạn!",
            },
            email: {
                required: "Hãy nhập email của bạn!",
            },
            gender: {
                required: "Hãy chọn giới tính của bạn!",
            },
            phone: {
                required: "Hãy nhập số điện thoại của bạn!",
            },
            avatar: {
                required: "Hãy chọn hình ảnh đại diện của bạn!",
            },
            address: {
                required: "Hãy nhập địa chỉ của bạn!",
            }
        }
    });
    
    // validate change password
    $("#change_password").validate({
        rules: {
            password: {
                required: true,
            },
            newpassword: {
                required: true,
            },
            newconfirm: {
                required: true,
            }
        },
        messages: {
            password: {
                required: "Hãy nhập mật khẩu của bạn!",
            },
            newpassword: {
                required: "Hãy nhập mật khẩu mới của bạn!",
            },
            newconfirm: {
                required: "Hãy nhập xác nhận mật khẩu mới của bạn!",
            }
        }
    });
    
    
    // validate check out
    $("#checkout").validate({
        rules: {
            address: {
                required: true,
            },
            phone: {
                required: true,
            }
        },
        messages: {
            address: {
                required: "Hãy nhập địa chỉ của bạn!",
            },
            phone: {
                required: "Hãy nhập số điện thoại của bạn!",
            }
        }
    });
    
    // validate model fogot
    $("#forgotForm").validate({
        rules: {
			username: {
                required: true,
            },
            email: {
                required: true,
            }
        },
        messages: {
			username: {
                required: "Hãy nhập tên tài khoản của bạn!",
            },
            email: {
                required: "Hãy nhập email của bạn!",
            }
        }
    });
})