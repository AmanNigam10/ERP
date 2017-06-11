<jsp:include page="_header.jsp"></jsp:include>
<jsp:include page="cartDisplay.jsp"></jsp:include>
<body>
	<jsp:include page="_navbar.jsp"></jsp:include>
	<script>$('#cart').addClass('active');</script>
	<div class="container">
		<div class="text-center">
			<h2 id="cartHead">You have x items in your cart</h2>
		</div>
		<br/>
		<ul class="list-inline text-center" id="cartItemList">
		  <!-- List will be dynamically displayed here with jQuery -->  
		</ul>
		
		<div class="text-center">
			<button id="purchase" name="purchase" class="btn btn-success btn-lg" type="button">Purchase</button>
		</div>
		<script>
			$("#purchase").click(function(){
				window.location.href = "bill.jsp";
			});
		</script>
	</div> <!-- end container -->
	<br/><br/>
	<jsp:include page="_footer.jsp"></jsp:include>
</body>


</html>