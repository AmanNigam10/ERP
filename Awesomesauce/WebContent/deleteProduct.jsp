<jsp:include page="_headerWithoutSession.jsp"></jsp:include>
<jsp:include page="_banner.jsp"></jsp:include>
<body>
	<div class="container">
		<div class="row">
			<div class="col-lg-10 col-lg-offset-1">
				<div class="panel panel-danger">
					<div class="panel-heading">
						<h3 class="text-center">
							Delete Product
						</h3>
					</div> <!--  -->
					<div class="panel-body">
						<div class="text-center">
							<p id="errorMessage"></p>
						</div>
						<form id="deleteProductForm"  class="form-horizontal" role="form" name="deleteProductForm" action="DeleteProduct" method="post">
							<div class="form-group">
								<label for="pname" class="col-lg-2 col-lg-offset-1 control-label">Product Name: </label>
								<div class="col-lg-8">
									<input type="text" id="pname" class="form-control" name="pname">
								</div>
							</div>
							<br/>
							<div class="text-center">
								<button class="btn btn-danger" id="deleteProduct" name="deleteProduct" type="submit">Delete</button>
								<a href="admin.jsp" class="btn btn-default">Back</a>
							</div>
						</form>
					</div> <!-- end panel-body -->
				</div> <!-- end panel -->
				<br/>
			</div> <!-- end col -->	
		</div> <!-- end row -->
	</div> <!-- end container -->
	<script src="js/deleteProductValidation.js"></script>
	<script src="sauce/deleteProduct.js"></script>
	<jsp:include page="_footer.jsp"></jsp:include>
</body>
</html>