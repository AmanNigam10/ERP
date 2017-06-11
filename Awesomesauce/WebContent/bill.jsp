<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.psl.model.*"%>
<%@page import="java.util.*"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="com.psl.service.*"%>
<jsp:include page="_header.jsp"></jsp:include>
<body>
	<jsp:include page="_navbar.jsp"></jsp:include>
	<div class="container">
		<h2 class="text-center">Gadget Floor</h2>
		<div class="row">
			<div class="col-lg-4" id="addPanel">
				<h3>Awesome Sauce</h3>
				<p>Persistent Systems Ltd. <br/> Rajiv Gandhi It Park, Hinjewadi <br/> Pune 411051
				<br/>weawesomesauce@gmail.com</p>		
			</div>
			<div class="col-lg-8 text-right">
				<h3>
				<%
					ApplicationContext context = new ClassPathXmlApplicationContext("config.xml");
					ProductService prod_service = new ProductService(); //context.getBean("prod_service",ProductService.class);
					Customer customer = (Customer)session.getAttribute("customer");
					out.println(customer.getFirstName()+" "+customer.getLastName());
				%>
				</h3> <!-- Put Actual name here -->
				<p><%
					out.println(customer.getEmail());
				%><br/><% 
				
					SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
					Calendar cal = Calendar.getInstance();
					
					out.println(dateFormat.format(cal.getTime())); %>
					
					</p>
			</div>
		</div> <!-- end row -->
		<br/><br/>
		<table class="table table-bordered table-hover table-responsive">
		  <thead>
		    <tr>
		      <th>Serial No.</th>
		      <th>Product Name</th>
		      <th>Quantity</th>
		      <th>Price</th>
		    </tr>
		  </thead>
		  <tbody id="tbody">
		  <% 
		  	List<Cart> listOfCart = (List)session.getAttribute("cartList");
		  	
		  	int i=1;
		  	float sum=0f;
		  	for(Cart cart : listOfCart)
		  	{
		  		Product product = prod_service.getProductbyProductName(cart.getProductName());
		  %>
		    <tr>
		      <td><%=i %></td>
		      <td><%= cart.getProductName()%></td>
		      <td><%= cart.getQuantityPurchased() %></td>
		      <td><%= product.getPrice() %></td>
		    </tr>
		    
		   <%
		   	sum+=(product.getPrice()*cart.getQuantityPurchased());
		   	i++;
		   } %>
		  </tbody>
		</table> 
		
		<h3 class="text-right">Total amount: Rs. <%= sum %></h3>
		
		<div class="text-center">
		<form action="BillGeneration" method="post" id="billGenerationForm">
			<button id="makePayment" name="makePayment" type="button" class="btn btn-success btn-lg">Make Payment</button>
		</form>
		<script>
			$("#makePayment").click(function(){
				$("#billGenerationForm").submit();
			});
		</script>
		</div>
		<script src="sauce/billSauce.js"></script>
	</div> <!-- end container -->
	<jsp:include page="_footer.jsp"></jsp:include>
</body>
</html>