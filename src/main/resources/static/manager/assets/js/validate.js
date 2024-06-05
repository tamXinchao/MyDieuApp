$(document).ready(function() {
    
	$.validator.addMethod('accept', function () { return true; });
    // begin validate form product
    $("#productForm").validate({
        rules: {
            productName: {
                required: true
            },
            slug: {
                required: true
            },
            category: {
                required: true
            },
            price: {
                required: true
            },
            quantity: {
                required: true
            },
            color1: {
                required: true
            },
            hex1: {
                required: true
            },
            thumbnail: {
                required: true,
                accept: true
            },
            image1_1: {
                required: true,
                accept: true
            },
            image1_2: {
                required: true,
                accept: true
            },
            image1_3: {
                required: true,
                accept: true
            },
            image1_4: {
                required: true,
                accept: true
            },
        },
        messages: {
            productName: {
                required: "Please enter product name!"
            },
            slug: {
                required: "Please enter product slug!"
            },
            category: {
                required: "Please choose category of product!"
            },
            price: {
                required: "Please enter product price!"
            },
            quantity: {
                required: "Please enter product quantity!"
            },
            color1: {
                required: "Please enter color name!"
            },
            hex1: {
                required: "Please enter color code (HEX)!"
            },
            thumbnail: {
                required: "Please choose a image!"
            },
            image1_1: {
                required: "Please choose a image!"
            },
            image1_2: {
                required: "Please choose a image!"
            },
            image1_3: {
                required: "Please choose a image!"
            },
            image1_4: {
                required: "Please choose a image!"
            },
        }
    });
    // end validate form create
})