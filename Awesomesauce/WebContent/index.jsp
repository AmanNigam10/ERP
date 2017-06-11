<jsp:include page="_header.jsp"></jsp:include>

<body>
	<jsp:include page="_navbar.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="text-center">Choose Section</h3>
					</div>
					<div class="panel-body">

						<div class="row">
							<div class="col-lg-6">
								<div class="panel panel-info">
									<div class="panel-heading">
										<h4 class="text-center">Mobile Shopping</h4>
									</div>
									<div class="panel-body text-center" id="mobilePanelParent">
										<img alt="Mobile Image" src="img/iPhone.png"
											class="img-responsive" id="mobilePanel">
									</div>
									<div class="panel-footer text-center">
										<a href="mobile.jsp" id="mobileBtn" class="btn btn-info">Shop Mobiles</a>
									</div>
								</div>
							</div>

							<div class="col-lg-6">
								<div class="panel panel-primary">
									<div class="panel-heading text-center">
										<h4 class="text-center">Laptop Shopping</h4>
									</div>
									<div class="panel-body text-center">
										<img alt="Laptop Image" src="img/Macbook.png"
											class="img-responsive text-center" id="laptopPanel">
									</div>
									<div class="panel-footer text-center">
										<a href="laptop.jsp" id="laptopBtn" class="btn btn-primary">Shop Laptops</a>
									</div>
								</div>
							</div>
						</div>

					</div>
					<!-- end main panel body -->
				</div>
				<!-- end panel main -->
			</div>
			<!-- end main col -->
		</div>
		<!-- end row -->
	</div>
	<!-- end container -->
	<br />
	<br />
	<script>
		var laptopPanelHeight = $("#laptopPanel").height();
		var laptopPanelWidth = $("#laptopPanel").width();
		$("#mobilePanel").css("height", laptopPanelHeight);
		$("#mobilePanel").css("width", (laptopPanelWidth/1.5));
		$("#mobilePanel").css("margin", "auto");
	</script>
	<script src="sauce/indexSauce.js"></script>>
	<jsp:include page="_footer.jsp"></jsp:include>
</body>
</html>