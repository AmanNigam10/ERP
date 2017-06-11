<jsp:include page="_headerWithoutSession.jsp"></jsp:include>
<body>
<body>
	<jsp:include page="_banner.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<div class="col-sm-8 col-sm-offset-2">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="text-center">New User Registration</h3>
					</div> <!-- End panel-heading -->
					<div class="panel-body">
						<p class="text-center text-warning">All the fields are mandatory to fill</p>
						<div class="alert alert-danger" id="alert">
							<p class="text-center"></p>
							<!-- Add error message with jQuery -->
						</div>
						<form action="Registeration" role="form" class="form-horizontal" id="registerForm" name="registerForm" method="post">
							<div class="form-group">
								<label for="firstName" class="control-label col-lg-2 col-lg-offset-1">First Name: </label>
								<div class="col-lg-8">
									<input type="text" class="form-control" id="firstName" name="firstName"/>
								</div>
							</div>
							<div class="form-group">
								<label for="lastName" class="control-label col-lg-2 col-lg-offset-1">Last Name: </label>
								<div class="col-lg-8">
									<input type="text" class="form-control" id="lastName" name="lastName"/>
								</div>
							</div>
							<div class="form-group">
								<label for="email" class="control-label col-lg-2 col-lg-offset-1">Email: </label>
								<div class="col-lg-8">
									<input type="email" class="form-control" id="email" name="email"/>
								</div>
							</div>
							<div class="form-group">
								<label for="newPassword" class="control-label col-lg-2 col-lg-offset-1">Password: </label>
								<div class="col-lg-8">
									<input type="password" class="form-control" id="newPassword" name="newPassword"/>
								</div>
							</div>
							<div class="form-group">
								<label for="confirmPassword" class="control-label col-lg-2 col-lg-offset-1">Re-enter Password: </label>
								<div class="col-lg-8">
									<input type="password" class="form-control" id="confirmPassword" name="confirmPassword"/>
								</div>
							</div>
							<div class="form-group">
								<label for="address" class="control-label col-lg-2 col-lg-offset-1">Address: </label>
								<div class="col-lg-8">
									<textarea class="form-control" id="address" style="min-height: 100px" name="address"></textarea>
								</div>
							</div>
							<div class="form-group">
								<label for="contact" class="control-label col-lg-2 col-lg-offset-1">Contact Number: </label>
								<div class="col-lg-8">
									<input type="text" class="form-control" id="contact" name="contact"/>
								</div>
							</div>
							<div class="form-group">
								<label for="securityQue" class="control-label col-lg-2 col-lg-offset-1">Security Question: </label>
								<div class="col-lg-8">
									<input type="text" class="form-control" id="securityQue" name="securityQue"/>
								</div>
							</div>
							<div class="form-group">
								<label for="securityAns" class="control-label col-lg-2 col-lg-offset-1">Security Answer: </label>
								<div class="col-lg-8">
									<input type="text" class="form-control" id="securityAns" name="securityAns"/>
								</div>
							</div>
							<br/>
							<div class="form-group text-center">
								<button type="button" class="btn btn-primary" id="register" name="register">Register</button>
								<a href="landing.jsp" class="btn btn-default">Cancel</a>
							</div>
						</form>
					</div> <!-- End panel-body -->
				</div> <!-- End panel -->
			</div> <!-- End column -->
		</div> <!-- End row -->
	</div> <!-- end container -->
	<br/>
	<script src="js/registerValidation.js"></script>
	<script src="sauce/registerSauce.js"></script>
	<jsp:include page="_footer.jsp"></jsp:include>
</body>
</html>