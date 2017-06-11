<jsp:include page="_header.jsp"></jsp:include>
<body>
	<jsp:include page="_navbar.jsp"></jsp:include>
	<script>$('#contactUs').addClass('active');</script>
	<div class="container">
		<div class="row">
			<div class="col-lg-5">
				<div class="panel panel-primary" id="mapPanel">
					<div class="panel-heading">
						<h3 class="text-center">Find us here!</h3>
					</div>
					<div class="panel-body">
						<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3781.697787514451!2d73.73536031441773!3d18.587658771971416!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bc2bbe792db3ac9%3A0x220c2cde7447fb2a!2sPersistent!5e0!3m2!1sen!2sin!4v1449944586281" style="border:0; width:100%; height:auto;"></iframe>
					</div>
				</div>
			</div>
			<div class="col-lg-2">
				<br/>
				<h1 class="text-center">Or</h1>
				<br/><br/>
			</div>
			<div class="col-lg-5">
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-info" id="formPanel">
							<div class="panel-heading">
								<h3 class="text-center">Write to us</h3>
							</div> <!-- End panel-heading -->
							<br/>
							<div class="panel-body">
								<p class="text-center text-danger" id="contactUsErrorMessage"></p>
								<form action="MailDispatcher" role="form" class="form-horizontal" id="contactUsForm" name="contactUsForm" method="post">
									<div class="form-group">
										<label for="firstName" class="control-label col-lg-2 col-lg-offset-1">Name: </label>
										<div class="col-lg-8">
											<input type="text" class="form-control" id="firstName" name="firstName"/>
										</div>
									</div>
									<div class="form-group">
										<label for="email" class="control-label col-lg-2 col-lg-offset-1">Email: </label>
										<div class="col-lg-8">
											<input type="email" class="form-control" id="email" name="email"/>
										</div>
									</div>
									<div class="form-group">
										<label for="subject" class="control-label col-lg-2 col-lg-offset-1">Subject: </label>
										<div class="col-lg-8">
											<input type="text" class="form-control" id="subject" name="subject"/>
										</div>
									</div>
									<div class="form-group">
										<label for="message" class="control-label col-lg-2 col-lg-offset-1">Message: </label>
										<div class="col-lg-8">
											<textarea class="form-control" id="message" name="message" style="min-height: 100px"></textarea>
										</div>
									</div>
									<br/>
									<div class="form-group text-center">
										<button type="button" class="btn btn-info" id="contactUsSubmitButton">Submit</button>
									</div>
								</form>
							</div> <!-- End panel-body -->
						</div> <!-- End panel -->
					</div> <!-- End column -->
				</div> <!-- End row -->
			</div>
		</div>
	</div>
	<script src="js/contactUsValidation.js"></script>
	<script src="sauce/contactUsSauce.js"></script>
	<jsp:include page="_footer.jsp"></jsp:include>
</body>
</html>