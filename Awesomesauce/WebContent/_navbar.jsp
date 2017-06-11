<%@page import="com.psl.model.*"%>
<% int flag = 1;%>
<style>
	header{
		margin-bottom: 80px;
	}
</style>
<header>
	<div class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#nav-collapse">
					<span class="sr-only">Toggle Navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a href="index.jsp" class="navbar-brand" id="brand">Gadget Floor</a>
			</div> <!-- End NavHeader -->
	
			<div class="collapse navbar-collapse navbar-right" id="nav-collapse">
				<ul class="nav navbar-nav">
					<li id="cart"><a href="cart.jsp"><span class="glyphicon glyphicon-shopping-cart"></span> &nbsp;Cart</a></li>
					<li id="trackOrder"><a href="trackOrder.jsp"><span class="glyphicon glyphicon-road"></span> &nbsp;Track Order</a></li>
					<li id="contactUs"><a href="contactUs.jsp"><span class="glyphicon glyphicon-envelope"></span> &nbsp;Contact Us</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">
						<span class="glyphicon glyphicon-user"></span> &nbsp;
						<%
							Customer customer = (Customer) session.getAttribute("customer");
							if(customer!=null)
							{
								flag = 0;
						  	  response.sendRedirect("landing.jsp");
						  	  out.println(customer.getFirstName()+" "+customer.getLastName());
							}
						%> 							
						
						 &nbsp; <span class="caret"></span></a>
						 
							<ul class="dropdown-menu">
							<li><a href="changePassword.jsp"><span class="glyphicon glyphicon-lock"></span> &nbsp;Change Password</a></li>
							<li>
								<form role="form" name="signOutForm" id="signOutForm" action="SessionInvalidate" method="post">
									<button id="signOutBtn" type="submit" class="btn btn-deafult form-control"><span class="glyphicon glyphicon-off"></span> &nbsp;Sign Out</button>
								</form>
								<script>$("#signOutBtn").mouseover(function(){
									$(this).css("background-color","#2780e3");}).
									mouseout(function(){
										$(this).css("background-color","#fff");
									});</script>
							</li>
						</ul>
						
					</li>
				</ul>
			</div> <!-- End NavMenu -->
		</div> <!-- End Container -->
	</div> <!-- End Navbar -->
</header>
<script src="sauce/navigationSauce.js"></script>