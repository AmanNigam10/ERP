<jsp:include page="_headerWithoutSession.jsp"></jsp:include><body>
	<jsp:include page="_banner.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="text-center">Forgot Password</h3>
					</div>
					<div class="panel-body">
						
						<div class="emailDiv">
							<!-- Get the user email here first. if valid, show the que-ans form and hide this form, else show error message -->
							<form role="form" id="emailForm" name="emailForm" class="form-horizontal">
								<div class="form-group">
									<label class="control-label col-sm-2" for="email">Email: </label>
									<div class="col-sm-8">
										<input class="form-control" type="email" id="email" name="email"/>
									</div>
								</div>
								<p class="text-center text-danger" id="userErrorMessage"></p> <!-- jquery dynamically adding of msg -->
								<div class="text-center">
									<button type="button" id="getQueBtn" name="getQueBtn" class="btn btn-default">Find me</button>
								</div>
							</form>
						</div> <!-- end emailDiv -->
						
						<div class="qaDiv">
							<h4 class="text-center" id="question"></h4> <!-- question fetched dynamically from db for above email -->
							<form class="form-horizontal" id="qaForm" role="form" name="qaForm" action="forgotPassword" method="post">
								<div class="form-group">
									<label for="answer" class="control-label col-lg-2">Answer: </label>
									<div class="col-lg-8">
										<input type="text" id="answer" class="form-control" name="answer"/>
									</div>
								</div>
								<p class="text-center text-danger" id="answerErrorMessage"></p> <!-- jquery dynamically adding of msg -->
								<div class="form-group text-center">
									<button type="button" class="btn btn-primary" id="answerSubmitBtn" name="answerSubmitBtn">Submit</button>
									<a href="landing.jsp" class="btn btn-default">Cancel</a>
								</div>
							</form>
						</div> <!-- end qaDiv -->
						
					</div> <!-- end panel-body -->
				</div> <!-- end panel -->
			</div> <!-- end col-8 -->
		</div> <!-- end row -->
	</div> <!-- end container -->
	<br/>
	<script src="js/forgotPasswordValidation.js"></script>
	<script src="js/forgotPassword.js"></script>
	<script src="sauce/forgotPasswordSauce.js"></script>
	<jsp:include page="_footer.jsp"></jsp:include>
</body>
</html>