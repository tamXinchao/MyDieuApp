<div class="alert alert-dismissible fade in show fixed-bottom" style="left: auto;right: 20px; width: 500px" role="alert">
	<strong id="message-strong">! </strong>
	<span id="message"></span>
		<button type="button" class="close" data-dismiss="alert" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
</div>
<script type="text/javascript">
	$('.alert').hide();
	<c:if test="${success != null}">
		alertResult('alert-success', 'Success!', '${success}');
	</c:if>
	<c:if test="${param.success != null}">
		alertResult('alert-success', 'Success!', '${param.success}');
	</c:if> 
	<c:if test="${error != null}">
		alertResult('alert-danger', 'Error!', '${error}');
	</c:if> 
	<c:if test="${param.error != null}">
		alertResult('alert-danger', 'Error!', '${param.error}');
	</c:if> 
	
	function alertResult(cls,strong, mess){
		$('.alert').addClass(cls);
		$('.alert #message-strong').html(strong);
		$('.alert #message').html(mess);
		$('.alert').show();
		
		setTimeout(function() {
			$('button.close').click();
		},5000);
	}
	
</script>
<nav class="navbar header-navbar pcoded-header">
	<div class="navbar-wrapper">
	    <div class="navbar-logo">
	        <a class="mobile-menu waves-effect waves-light" id="mobile-collapse" href="#!">
	            <i class="ti-menu"></i>
	        </a>
	        <div class="mobile-search waves-effect waves-light">
	            <div class="header-search">
	                <div class="main-search morphsearch-search">
	                    <div class="input-group">
	                        <span class="input-group-prepend search-close"><i
	                                class="ti-close input-group-text"></i></span>
	                        <input type="text" class="form-control" placeholder="Enter Keyword">
	                        <span class="input-group-append search-btn"><i
	                                class="ti-search input-group-text"></i></span>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <a href="/admin/home">
	            <h4 class="font-weight-bold"><i class="fa fa-shopping-bag mr-3" aria-hidden="true"></i>PT SHOP</h4>
	        </a>
	        <a class="mobile-options waves-effect waves-light">
	            <i class="ti-more"></i>
	        </a>
	    </div>
	    <div class="navbar-container container-fluid">
	        <ul class="nav-left">
	            <li>
	                <div class="sidebar_toggle"><a href="javascript:void(0)"><i class="ti-menu"></i></a>
	                </div>
	            </li>
	            <li>
	                <a href="#!" onclick="javascript:toggleFullScreen()" class="waves-effect waves-light">
	                        <i class="ti-fullscreen"></i>
	                    </a>
	                </li>
	            </ul>
	            <ul class="nav-right">
	                <li class="header-notification">
	                    <a href="#!" class="waves-effect waves-light">
	                        <i class="ti-bell"></i>
	                        <span class="badge bg-c-red"></span>
	                    </a>
	                    <ul class="show-notification">
	                        <li>
	                            <h6>Notifications</h6>
	                            <label class="label label-danger">New</label>
	                        </li>
	                        <li class="waves-effect waves-light">
	                            <div class="media">
	                                <img class="d-flex align-self-center img-radius"
	                                    src="/assets/images/avatar-2.jpg" alt="Generic placeholder image">
	                                <div class="media-body">
	                                    <h5 class="notification-user">John Doe</h5>
	                                    <p class="notification-msg">Lorem ipsum dolor sit amet, consectetuer
	                                        elit.</p>
	                                    <span class="notification-time">30 minutes ago</span>
	                                </div>
	                            </div>
	                        </li>
	                        <li class="waves-effect waves-light">
	                            <div class="media">
	                                <img class="d-flex align-self-center img-radius"
	                                    src="/assets/images/avatar-4.jpg" alt="Generic placeholder image">
	                                <div class="media-body">
	                                    <h5 class="notification-user">Joseph William</h5>
	                                    <p class="notification-msg">Lorem ipsum dolor sit amet, consectetuer
	                                        elit.</p>
	                                    <span class="notification-time">30 minutes ago</span>
	                                </div>
	                            </div>
	                        </li>
	                        <li class="waves-effect waves-light">
	                            <div class="media">
	                                <img class="d-flex align-self-center img-radius"
	                                    src="/assets/images/avatar-3.jpg" alt="Generic placeholder image">
	                                <div class="media-body">
	                                    <h5 class="notification-user">Sara Soudein</h5>
	                                    <p class="notification-msg">Lorem ipsum dolor sit amet, consectetuer
	                                        elit.</p>
	                                    <span class="notification-time">30 minutes ago</span>
	                                </div>
	                            </div>
	                        </li>
	                    </ul>
	                </li>
	                <li class="user-profile header-notification">
	                    <a href="#!" class="waves-effect waves-light">
	                        <img src="/avatar/${sessionScope.account.avatar}" class="img-radius" style="width: 40px; height: 40px" alt="User-Profile-Image">
	                        <span>Hi, ${sessionScope.account.fullname}</span>
	                        <i class="ti-angle-down"></i>
	                    </a>
	                    <ul class="show-notification profile-notification">
	                        <li class="waves-effect waves-light">
	                            <a href="/home">
	                                <i class="ti-settings"></i> Back to shop
	                            </a>
	                        </li>
	                        <li class="waves-effect waves-light">
	                            <a href="/logout">
	                                <i class="ti-layout-sidebar-left"></i> Logout
	                            </a>
	                        </li>
	                    </ul>
	                </li>
	            </ul>
	        </div>
	    </div>
	</nav>