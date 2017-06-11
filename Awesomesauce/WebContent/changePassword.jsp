<jsp:include page="_header.jsp"></jsp:include>
<body>
	<jsp:include page="_navbar.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<div class="col-sm-10 col-sm-offset-1">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="text-center">Change Password</h3>
					</div> <!-- End panel-heading -->
					<br/>
					<div class="panel-body">
						<div class="alert alert-danger" id="alert">
							<p class="text-center" id="errorMessage"></p>
						</div>
						<form action="ChangePassword" role="form" class="form-horizontal" id="changePasswordForm" name="changePasswordForm" method="post">
							<div class="form-group">
								<label for="currentPassword" class="control-label col-lg-2 col-lg-offset-1">Current Password: </label>
								<div class="col-lg-8">
									<input type="password" class="form-control" id="currentPassword" name="currentPassword"/>
								</div>
							</div>
							<div class="form-group">
								<label for="newPassword" class="control-label col-lg-2 col-lg-offset-1">New Password: </label>
								<div class="col-lg-8">
									<input type="password" class="form-control" id="newPassword" name="newPassword"/>
								</div>
							</div>
							<div class="form-group">
								<label for="confirmPassword" class="control-label col-lg-2 col-lg-offset-1">Confirm Password: </label>
								<div class="col-lg-8">
									<input type="password" class="form-control" id="confirmPassword" name="confirmPassword"/>
								</div>
							</div>
							<br/>
							<div class="form-group text-center">
								<button type="button" class="btn btn-primary" id="changePassword" name="changePassword">Change</button>
							</div>
						</form>
					</div> <!-- End panel-body -->
				</div> <!-- End panel -->
			</div> <!-- End column -->
		</div> <!-- End row -->
	</div> <!-- End container -->
	<br/>
	<script src="js/changePasswordValidation.js"></script>
	<script src="sauce/changePasswordSauce.js"></script>
	<jsp:include page="_footer.jsp"></jsp:include>
</body>
</html>