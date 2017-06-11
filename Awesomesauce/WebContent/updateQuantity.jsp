<jsp:include page="_headerWithoutSession.jsp"></jsp:include>
<jsp:include page="_banner.jsp"></jsp:include>
<body>
	<div class="container">
		<div class="row">
			<div class="col-lg-10 col-lg-offset-1">
				<div class="panel panel-warning">
					<div class="panel-heading">
						<h3 class="text-center">
							Update Quantity
						</h3>
					</div> <!--  -->
					<div class="panel-body">
						<div class="text-center">
							<p id="errorMessage" class="text-danger"></p> <!-- jquery errorMessage -->
						</div>
						<form id="updateQuantityForm" class="form-horizontal" role="form" action="UpdateQuantity" name="updateQuantityForm" method="post">
							<div class="form-group">
								<label for="pname" class="col-lg-2 col-lg-offset-1 control-label">Product Name: </label>
								<div class="col-lg-8">
									<input type="text" id="pname" class="form-control" name="pname">
								</div>
							</div>
							<div class="form-group">
								<label for="quantity" class="col-lg-2 col-lg-offset-1 control-label">Quantity: </label>
								<div class="col-lg-3">
									<input type="number" id="quantity" class="form-control" name="quantity">
								</div>
							</div>
							<br/>
							<div class="text-center">
								<button class="btn btn-warning" id="updateQuantity" name="updateQuantity" type="submit">Update</button>
								<a href="admin.jsp" class="btn btn-default">Back</a>
							</div>
						</form>
					</div> <!-- end panel-body -->
				</div> <!-- end panel -->
				<br/>
			</div> <!-- end col -->	
		</div> <!-- end row -->
	</div> <!-- end container -->
	<script src="js/updateQuantityValidation.js"></script>
	<jsp:include page="_footer.jsp"></jsp:include>
</body>
</html>