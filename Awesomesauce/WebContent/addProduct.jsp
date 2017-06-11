<jsp:include page="_headerWithoutSession.jsp"></jsp:include>
<jsp:include page="_banner.jsp"></jsp:include>
<body>
	<div class="container">
		<div class="row">
			<div class="col-lg-10 col-lg-offset-1">
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="text-center">
							Add Product
						</h3>
					</div> <!--  -->
					<div class="panel-body">
						<div class="text-center">
							<p id="errorMesage" class="text-danger"></p> <!-- jquery error msg -->
						</div>
						<form id="addProductForm" class="form-horizontal" role="form" action="AddProduct" name="addProductForm" method="post">
							<div class="form-group">
								<label for="pname" class="col-lg-2 col-lg-offset-1 control-label">Product Name: </label>
								<div class="col-lg-8">
									<input type="text" id="pname" class="form-control" name="pname">
								</div>
							</div>
							<div class="form-group">
								<label for="section" class="control-label col-lg-2 col-lg-offset-1">Section</label>
								<div class="col-lg-4">
									<select id="selectSection" class="form-control" name="section">
										<option value="laptop">Laptop</option>
										<option value="mobile">Mobile</option>
									</select>
								</div>
							</div>							
							<div class="form-group">
							  <label class="control-label col-lg-3 col-lf-offset-1" for="price">Price: </label>
							  <div class="col-lg-3">
							  	<div class="input-group">
								    <span class="input-group-addon">Rs</span>
								    <input type="text" class="form-control" id="price" name="price">
								</div>
							  </div>
							</div>
							<div class="form-group">
								<label for="quantity" class="col-lg-2 col-lg-offset-1 control-label">Quantity: </label>
								<div class="col-lg-3">
									<input type="number" id="quantity" class="form-control" name="quantity">
								</div>
							</div>
							<div class="form-group">
								<label for="imagePath" class="col-lg-2 col-lg-offset-1 control-label">Image Path: </label>
								<div class="col-lg-6">
									<input type="text" id="imagePath" class="form-control" name="imagePath">
								</div>
							</div>
							<br/>
							<div class="text-center">
								<button class="btn btn-info" id="addProduct" name="addProduct" type="submit">Add</button>
								<a href="admin.jsp" class="btn btn-default">Back</a>
							</div>
						</form>
					</div> <!-- end panel-body -->
				</div> <!-- end panel -->
				<br/>
			</div> <!-- end col -->	
		</div> <!-- end row -->
	</div> <!-- end container -->
	<!-- <script src="js/addProductValidation.js"></script> -->
	<jsp:include page="_footer.jsp"></jsp:include>
</body>
</html>