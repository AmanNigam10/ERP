<jsp:include page="_header.jsp"></jsp:include>
<jsp:include page="mobileDisplay.jsp"></jsp:include>
<!-- <script src="js/mobile.js"></script> -->
<link rel="stylesheet" href="css/imgRefactor.css"/>
<body>
	<jsp:include page="_navbar.jsp"></jsp:include>
	<div class="container">
		<div class="text-center">
			<h2 id="mobileHead">Shop Mobile</h2>
		</div>
		<br/>
		<ul class="list-inline text-center" id="mobileItemList">
			<!-- List appears dynamically using jQuery -->
		</ul>
	</div> <!-- end container -->
	<br/><br/>
	<jsp:include page="_footer.jsp"></jsp:include>
</body>
</html>