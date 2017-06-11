<jsp:include page="_header.jsp"></jsp:include>
<style>
	
</style>
<body>
	<jsp:include page="_banner.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<div class="col-lg-7">
				<div id="tutorial" class="carousel slide" data-ride="carousel" style="background-color: rgb(63,63,63)">
				  <!-- Indicators -->
					<ol class="carousel-indicators">
				    <li data-target="#tutorial" data-slide-to="0" class="active"></li>
				    <li data-target="#tutorial" data-slide-to="1"></li>
				    <li data-target="#tutorial" data-slide-to="2"></li>
				    <li data-target="#tutorial" data-slide-to="3"></li>
				  </ol>
				
				  <!-- Wrapper for slides -->
				  
				  <div class="carousel-inner" role="listbox">
				    <div class="item active">
				      <img src="Slider_Images/Slide1.jpg" alt="Tutorial">
				    </div>
				    <div class="item">
				      <img src="Slider_Images/Slide2.jpg" alt="Tutorial">
				    </div>
				    <div class="item">
				      <img src="Slider_Images/Slide3.jpg" alt="Tutorial">
				    </div>
				    <div class="item">
				      <img src="Slider_Images/Slide4.jpg" alt="Tutorial">
				    </div>
				    <div class="item">
				      <img src="Slider_Images/Slide5.jpg" alt="Tutorial">
				    </div>
				    <div class="item">
				      <img src="Slider_Images/Slide6.jpg" alt="Tutorial">
				    </div>
				    <div class="item">
				      <img src="Slider_Images/Slide7.jpg" alt="Tutorial">
				    </div>
				  </div>
				  <!-- Left and right controls -->
				  <a class="left carousel-control" href="#tutorial" role="button" data-slide="prev">
				    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				    <span class="sr-only">Previous</span>
				  </a>
				  <a class="right carousel-control" href="#tutorial" role="button" data-slide="next">
				    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				    <span class="sr-only">Next</span>
				  </a>
				</div>
			</div> <!-- end carousel div -->
			<div class="col-lg-5">
				<div class="panel panel-info" id="loginPanel">
					<div class="panel-heading">
						<h3 class="text-center">Sign In</h3>
					</div>
					<div class="panel-body">
						<p class="text-danger text-center" id="errorMessage"></p>
						<!-- Add java code in action tab or ajax script after form.submit() in landingValidation.js -->
						<form class="form-horizontal" action="Redirect" id="signInForm" name="signInForm" role="form" method="post">
							<div class="form-group">
								<label for="email" class="control-label col-lg-2 col-lg-offset-1">Email: </label>
								<div class="col-lg-8">
									<input type="email" id="email" class="form-control" name="email" />
								</div>
							</div>
							<div class="form-group">
								<label for="password" class="control-label col-lg-2 col-lg-offset-1">Password: </label>
								<div class="col-lg-8">
									<input type="password" id="password" class="form-control" name="password"/>
									<div class="text-right"><a href="forgotPassword.jsp">Forgot Password?</a></div>
								</div>
							</div>
							<br/>
							<div class="form-group text-center">
								<button type="button" id="signIn" class="btn btn-info" name="signIn">Sign In!</button>
							</div>
						</form>
						<hr/>
						<div class="text-center">
							<a href="register.jsp" class="btn btn-primary">Register</a>
						</div>
					</div>
				</div> 
			</div> <!-- end login panel -->
		</div> <!-- end row -->
		<br/>
	</div> <!-- end container -->
	<script src="js/landingPageValidation.js"></script>
	<script src="sauce/landingSauce.js"></script>
	<jsp:include page="_footer.jsp"></jsp:include>
</body>
</html>