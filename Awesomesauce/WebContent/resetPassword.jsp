<jsp:include page="_header.jsp"></jsp:include>
<body>
	<jsp:include page="_banner.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="text-center">Reset Password</h3>
					</div>
					<div class="panel-body">
						<br/>
						<div class="alert alert-danger" id="alert">
							<p class="text-center"></p>
							<!-- Jquery operated error message display -->
						</div>
						<form class="form-horizontal" role="form" id="form" name="form" action="ResetPassword" method="post">
							<div class="form-group">
								<label for="newPassword" class="control-label col-lg-3 text-center">New Password: </label>
								<div class="col-lg-8">
									<input type="password" class="form-control" id="newPassword" name="newPassword"/>
								</div>
							</div>
							<div class="form-group">
								<label for="confirmPassword" class="control-label col-lg-3 text-center">Confirm Password: </label>
								<div class="col-lg-8">
									<input type="password" class="form-control" id="confirmPassword" name="confirmPassword"/>
								</div>
							</div>
							<br/>
							<div class="form-group text-center">
								<a class="btn btn-default" href="landing.jsp">Cancel</a>
								<button type="button" class="btn btn-primary" id="changeBtn" name="changeBtn">Change</button>
							</div>
						</form>
					</div> <!-- end panel body --> 
				</div> <!-- end panel -->
			</div> <!--end column -->
		</div> <!-- end row -->
		<script src="js/resetPassword.js"></script>
		<script src="sauce/resetPasswordSauce.js"></script>
	</div> <!-- end Container -->
	<jsp:include page="_footer.jsp"></jsp:include>
</body>
</html>