<%@page import="com.psl.model.*"%>
<%@page import="java.util.List"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="com.psl.service.*"%>
<link rel="stylesheet" href="css/imgRefactor.css"/>

<script src="js/jquery.min.js"></script>

<script>
listCount = 0;
initialCount = 0;

$(document).ready(function(){
	
	<% 
	
		Customer customer = (Customer)session.getAttribute("customer");
		ApplicationContext context = new ClassPathXmlApplicationContext("config.xml");
		CartService cart_service = context.getBean("cart_service",CartService.class);
		ProductService prod_service = new ProductService(); //context.getBean("prod_service",ProductService.class);
		
		List<Cart> list = cart_service.getCartDetails(customer);
		
		for(Cart cart : list)
		{
			Product product = prod_service.getProductbyProductName(cart.getProductName());
		%>
			appendItem("<%=cart.getProductName()%>",<%=cart.getQuantityPurchased()%>,<%= cart.getQuantityPurchased()*product.getPrice()%>,"<%=product.getImage()%>");		
		<%}
	
	%>
	
	
	/*Pass the item object into above function and render its values with getters*/
	
	if(listCount == 0){
		$("#cartHead").text("You have 0 items in your cart");
		$("#purchase").hide();
	}else{
		$("#cartHead").text("You have "+ listCount + " items in your cart");
	}
	<%
	session.setAttribute("cartList", list);
%>
});



function appendItem(name,quantity,price,img){
	
	$("#cartItemList").append(
		'<li class="cartItem">' + 
	    	'<div class="panel panel-primary text-center">' +
	    		'<div class="panel-heading">' +
	    			'<h4>'+ name +'</h4>' +
	    		'</div>' +
	    		'<div class="panel-body img-refactor">' +
	    			'<img alt="Product Image" src="'+ img +'" class="img-responsive" width="220" height="250"/><br/>' +
	    			'<p>Serial No: <span id="srNo">'+ (listCount+1) +'</span></p>' +
	    			'<p>Price: <span id="price">'+ price +'</span></p>' +
	    			'<p>Quantity: <span id="quantity">'+ quantity +'</span></p>' +
	    		'</div>' +
	    		'<div class="panel-footer">' +
	    			'<button type="button" id="remove' + listCount +'" name="remove" class="btn btn-danger" data-proName="'+name+'" data-proId="'+listCount+'">Remove</button>' +
	    		'</div>' +
	    	'</div>' +
	    '</li>'
	);
	removeItem(name);
	listCount++;
	
	
}

function removeItem(name){
	
	$("#remove"+listCount).click(function(){
			
		var pname = name;
	
 		$.get("deleteFromCart.jsp?productName=" + pname, function(data) {
			alert("Your Product is successfully deleted");
		});
		$(this).parent().parent().parent().remove();
		listCount--;
		if(listCount == 0){
			$("#cartHead").text("You have 0 items in your cart");
			$("#purchase").hide();
		}else{
			$("#cartHead").text("You have "+ listCount + " items in your cart");
		}
	});
}


</script>

<script>
	$(document).ready(function(){
		if(annyang){
			
			var commands = {
					
				'purchase' : function(){
					window.location.href = "bill.jsp";
				},
					
				'product *term select' : function(term){
					if(term == 'one'){
						proNum = 1;
					}else if(term == 'two' || term=='to'){
						proNum =2;
					}else if(term == 'three'){
						proNum =3;
					}else if(term == 'four'){
						proNum =4;
					}else if(term == 'five'){
						proNum =5;
					}
					$("#remove" + (proNum-1)).focus();
				},
				
				'remove' : function(){
					var focusFieldName = $(':focus').attr("data-proName");
					var id = $(':focus').attr("data-proId");
					id = parseInt(id);
					$.get("deleteFromCart.jsp?productName=" + focusFieldName, function(data) {
						alert("Your Product is successfully deleted");
					});
					$("#remove"+id).parent().parent().parent().remove();
					listCount--;
					if(listCount == 0){
						$("#cartHead").text("You have 0 items in your cart");
						$("#purchase").hide();
					}else{
						$("#cartHead").text("You have "+ listCount + " items in your cart");
					}
				}
			}
			
			annyang.addCommands(commands);
			annyang.start(true, true);
			annyang.debug();
		}
	});
</script>