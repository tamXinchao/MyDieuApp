"use strict";
$(document).ready(function() {
	// card js start
	$(".card-header-right .close-card").on('click', function() {
		var $this = $(this);
		$this.parents('.card').animate({
			'opacity': '0',
			'-webkit-transform': 'scale3d(.3, .3, .3)',
			'transform': 'scale3d(.3, .3, .3)'
		});

		setTimeout(function() {
			$this.parents('.card').remove();
		}, 800);
	});
	$(".card-header-right .reload-card").on('click', function() {
		var $this = $(this);
		$this.parents('.card').addClass("card-load");
		$this.parents('.card').append('<div class="card-loader"><i class="fa fa-circle-o-notch rotate-refresh"></div>');
		setTimeout(function() {
			$this.parents('.card').children(".card-loader").remove();
			$this.parents('.card').removeClass("card-load");
		}, 3000);
	});
	$(".card-header-right .card-option .open-card-option").on('click', function() {
		var $this = $(this);
		if ($this.hasClass('fa-times')) {
			$this.parents('.card-option').animate({
				'width': '30px',
			});
			$(this).removeClass("fa-times").fadeIn('slow');
			$(this).addClass("fa-wrench").fadeIn('slow');
		} else {
			$this.parents('.card-option').animate({
				'width': '140px',
			});
			$(this).addClass("fa-times").fadeIn('slow');
			$(this).removeClass("fa-wrench").fadeIn('slow');
		}
	});
	$(".card-header-right .minimize-card").on('click', function() {
		var $this = $(this);
		var port = $($this.parents('.card'));
		var card = $(port).children('.card-block').slideToggle();
		$(this).toggleClass("fa-minus").fadeIn('slow');
		$(this).toggleClass("fa-plus").fadeIn('slow');
	});
	$(".card-header-right .full-card").on('click', function() {
		var $this = $(this);
		var port = $($this.parents('.card'));
		port.toggleClass("full-card");
		$(this).toggleClass("fa-window-restore");
	});
	$("#more-details").on('click', function() {
		$(".more-details").slideToggle(500);
	});
	$(".mobile-options").on('click', function() {
		$(".navbar-container .nav-right").slideToggle('slow');
	});
	$(".search-btn").on('click', function() {
		$(".main-search").addClass('open');
		$('.main-search .form-control').animate({
			'width': '200px',
		});
	});
	$(".search-close").on('click', function() {
		$('.main-search .form-control').animate({
			'width': '0',
		});
		setTimeout(function() {
			$(".main-search").removeClass('open');
		}, 300);
	});
	$(document).ready(function() {
		$(".header-notification").click(function() {
			$(this).find(".show-notification").slideToggle(500);
			$(this).toggleClass('active');
		});
	});
	$(document).on("click", function(event) {
		var $trigger = $(".header-notification");
		if ($trigger !== event.target && !$trigger.has(event.target).length) {
			$(".show-notification").slideUp(300);
			$(".header-notification").removeClass('active');
		}
	});

	// card js end
	$.mCustomScrollbar.defaults.axis = "yx";
	$("#styleSelector .style-cont").slimScroll({
		setTop: "1px",
		height: "calc(100vh - 320px)",
	});
	$(".main-menu").mCustomScrollbar({
		setTop: "1px",
		setHeight: "calc(100% - 56px)",
	});
	/*chatbar js start*/
	/*chat box scroll*/
	var a = $(window).height() - 80;
	$(".main-friend-list").slimScroll({
		height: a,
		allowPageScroll: false,
		wheelStep: 5,
		color: '#1b8bf9'
	});

	// search
	$("#search-friends").on("keyup", function() {
		var g = $(this).val().toLowerCase();
		$(".userlist-box .media-body .chat-header").each(function() {
			var s = $(this).text().toLowerCase();
			$(this).closest('.userlist-box')[s.indexOf(g) !== -1 ? 'show' : 'hide']();
		});
	});

	// open chat box
	$('.displayChatbox').on('click', function() {
		var my_val = $('.pcoded').attr('vertical-placement');
		if (my_val == 'right') {
			var options = {
				direction: 'left'
			};
		} else {
			var options = {
				direction: 'right'
			};
		}
		$('.showChat').toggle('slide', options, 500);
	});

	//open friend chat
	$('.userlist-box').on('click', function() {
		var my_val = $('.pcoded').attr('vertical-placement');
		if (my_val == 'right') {
			var options = {
				direction: 'left'
			};
		} else {
			var options = {
				direction: 'right'
			};
		}
		$('.showChat_inner').toggle('slide', options, 500);
	});
	//back to main chatbar
	$('.back_chatBox').on('click', function() {
		var my_val = $('.pcoded').attr('vertical-placement');
		if (my_val == 'right') {
			var options = {
				direction: 'left'
			};
		} else {
			var options = {
				direction: 'right'
			};
		}
		$('.showChat_inner').toggle('slide', options, 500);
		$('.showChat').css('display', 'block');
	});
	$('.back_friendlist').on('click', function() {
		var my_val = $('.pcoded').attr('vertical-placement');
		if (my_val == 'right') {
			var options = {
				direction: 'left'
			};
		} else {
			var options = {
				direction: 'right'
			};
		}
		$('.p-chat-user').toggle('slide', options, 500);
		$('.showChat').css('display', 'block');
	});
	// /*chatbar js end*/

	$('[data-toggle="tooltip"]').tooltip();

	// wave effect js
	Waves.init();
	Waves.attach('.flat-buttons', ['waves-button']);
	Waves.attach('.float-buttons', ['waves-button', 'waves-float']);
	Waves.attach('.float-button-light', ['waves-button', 'waves-float', 'waves-light']);
	Waves.attach('.flat-buttons', ['waves-button', 'waves-float', 'waves-light', 'flat-buttons']);

	$('.form-control').on('blur', function() {
		if ($(this).val().length > 0) {
			$(this).addClass("fill");
		} else {
			$(this).removeClass("fill");
		}
	});
	$('.form-control').on('focus', function() {
		$(this).addClass("fill");
	});
});
$(document).ready(function() {
	$(".theme-loader").animate({
		opacity: "0"
	}, 1000);
	setTimeout(function() {
		$(".theme-loader").remove();
	}, 1000);

});

// toggle full screen
function toggleFullScreen() {
	var a = $(window).height() - 10;

	if (!document.fullscreenElement && // alternative standard method
		!document.mozFullScreenElement && !document.webkitFullscreenElement) { // current working methods
		if (document.documentElement.requestFullscreen) {
			document.documentElement.requestFullscreen();
		} else if (document.documentElement.mozRequestFullScreen) {
			document.documentElement.mozRequestFullScreen();
		} else if (document.documentElement.webkitRequestFullscreen) {
			document.documentElement.webkitRequestFullscreen(Element.ALLOW_KEYBOARD_INPUT);
		}
	} else {
		if (document.cancelFullScreen) {
			document.cancelFullScreen();
		} else if (document.mozCancelFullScreen) {
			document.mozCancelFullScreen();
		} else if (document.webkitCancelFullScreen) {
			document.webkitCancelFullScreen();
		}
	}
}

var color = 1;
// Add color on create page
function addcolor() {
	color++;
	$('#color-block').append(`
<div class="col-12" style="border-top: 2px solid #d7dce0;">
										<div class="row"">
											<div class="col-12 row px-5 mt-3 mb-4 text-left">
												<div class="col-sm-3 px-0">
													<h3 class="my-0 mt-2">Color 1:</h3>
												</div>
												<div class="col-sm-3 px-0 mr-4">
													<input type="text" name="color1" class="form-control color"
														placeholder="Enter color name">
												</div>
											</div>

											<div class="col-sm-6 col-md-4 col-xl-3 ">
												<label for="image1_1" class="border border-primary mt-2"
													style="border-width: 4px !important; width: 200px; height: 250px;">
													<img src="/manager/assets/images/no_image.jpg"
													id="imagePreview1_1" class="over " />
												</label> <input type="file" class="custom-file-input image"
													style="height: 0;" id="image1_1" name="image1_1"
													accept=".jpg,.png,.jpeg"
													onchange="readURL(this,event,'1_1')">
											</div>
											<div class="col-sm-6 col-md-4 col-xl-3">
												<label for="image1_2" class="border border-primary mt-2"
													style="border-width: 4px !important; width: 200px; height: 250px;">
													<img src="/manager/assets/images/no_image.jpg"
													id="imagePreview1_2" class="over " />
												</label> <input type="file" class="custom-file-input image"
													style="height: 0;" id="image1_2" name="image1_2"
													accept=".jpg,.png,.jpeg"
													onchange="readURL(this,event,'1_2')">
											</div>
											<div class="col-sm-6 col-md-4 col-xl-3">
												<label for="image1_2" class="border border-primary mt-2"
													style="border-width: 4px !important; width: 200px; height: 250px;">
													<img src="/manager/assets/images/no_image.jpg"
													id="imagePreview1_2" class="over " />
												</label> <input type="file" class="custom-file-input image"
													style="height: 0;" id="image1_2" name="image1_2"
													accept=".jpg,.png,.jpeg"
													onchange="readURL(this,event,'1_2')">
											</div>
											<div class="col-sm-6 col-md-4 col-xl-3">
												<label for="image1_2" class="border border-primary mt-2"
													style="border-width: 4px !important; width: 200px; height: 250px;">
													<img src="/manager/assets/images/no_image.jpg"
													id="imagePreview1_2" class="over " />
												</label> <input type="file" class="custom-file-input image"
													style="height: 0;" id="image1_2" name="image1_2"
													accept=".jpg,.png,.jpeg"
													onchange="readURL(this,event,'1_2')">
											</div>
										</div>
									</div>
    `);
	$("#productForm").validate();
	$(".color").each(function() {
		$(this).rules("add", {
			required: true,
			messages: {
				required: "Please enter color name!"
			}
		});
	});
	$(".hex").each(function() {
		$(this).rules("add", {
			required: true,
			messages: {
				required: "Please enter color code (HEX)!"
			}
		});
	});
	$(".image").each(function() {
		$(this).rules("add", {
			required: true,
			messages: {
				required: "Please choose a image!"
			}
		});
	});
}