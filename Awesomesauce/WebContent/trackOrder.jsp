
<jsp:include page="_header.jsp"></jsp:include>
<body>
	<jsp:include page="_navbar.jsp"></jsp:include>
	<script>$('#trackOrder').addClass('active');</script>
	<div class="container">
		<div class="row">
			<div class="col-lg-6 col-lg-offset-3">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="text-center">Track Your Order</h3>
					</div>
					<div class="panel-body">
						<p id="errorMessage" class="text-center text-danger"></p>
						<form id="trackOrderForm" action="#" role="form" name="trackOrderForm">
							<div class="form-group">
								<label for="orderId" class="label-control">Please enter your Bill ID: </label>
								<input type="text" class="form-control" id="orderId" name="orderId"/>
							</div>
							<div class="form-group text-center">
								<button type="button" class="btn btn-default" id="trackOrderBtn" name="trackOrderBtn">Track Order</button>
							</div>
						</form>
					</div> <!-- end panel-body -->
					<div class="panel-footer">
						<!-- Order status will be updated by ajax request in below h3 tag -->
						<h3 id="orderStatus" class="text-center"></h3>
					</div>
				</div> <!-- end panel -->
			</div> <!-- end col -->
		</div> <!-- end row -->
	</div> <!-- container -->
	<!-- <script src="js/trackOrderValidation.js"></script> -->
	<script src="js/trackOrder.js"></script>
	<script src="js/trackOrderValidation.js"></script>
	<script src="sauce/trackOrderSauce.js"></script>
	<jsp:include page="_footer.jsp"></jsp:include>
</body>
</html>