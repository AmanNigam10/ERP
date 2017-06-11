<jsp:include page="_headerWithoutSession.jsp"></jsp:include>
<jsp:include page="_banner.jsp"></jsp:include>
<body>
	<div class="container">
		<div class="row">
			<div class="col-lg-6 col-lg-offset-3">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="text-center">Administrator Panel</h3>
					</div>
					<div class="panel-body text-center">
						<a id="addProduct" href="addProduct.jsp" class="btn btn-default">Add Product</a><br><br>
						<a id="updateQuantity" href="updateQuantity.jsp" class="btn btn-default">Update Quantity</a><br><br>
						<a id="deleteProduct" href="deleteProduct.jsp" class="btn btn-default">Delete Product</a><br><br>
					</div>
					<div class="panel-footer text-right">
						<button type="button" class="btn btn-primary" name="logout">
						<span class="glyphicon glyphicon-off"></span> &nbsp;Log Out</button>						
					</div>
				</div> <!-- panel end -->
			</div> <!-- end col -->
		</div> <!-- end row -->
		<br/>
	</div> <!-- end container -->
	<jsp:include page="_footer.jsp"></jsp:include>
</body>
</html>
