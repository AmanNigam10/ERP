<%@page import="com.psl.model.*"%>
<%@page import="java.util.List"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="com.psl.service.*"%>
<link rel="stylesheet" href="css/imgRefactor.css"/>
<script src="js/jquery.min.js"></script>
	
	<style>
		input[type=number]{
    		width: 40px;
		} 
	</style>

<script>

listCount = 0;
initialCount = 0;

$(document).ready(function(){

	<% 
	
	Customer customer = (Customer)session.getAttribute("customer");
	ApplicationContext context = new ClassPathXmlApplicationContext("config.xml");
	ProductService prod_service = new ProductService(); //context.getBean("prod_service",ProductService.class);
	
	List<Product> prodList = prod_service.getProductsBySection("laptop");
	
	for(Product product : prodList)
	{
		String section = product.getSection();
		 	//Comment
		 	
	%>
		
		appendItem("<%=product.getProdcutName()%>",<%= product.getPrice() %>,<%= product.getQuantity()%>,"<%=product.getImage()%>");
		
	<%
	}
	session.setAttribute("list", prodList);
%>

	/*Pass the item object into above function and render its values with getters*/
});

function appendItem(pName, price, quantity,img){
	//alert(pName);
	//alert(pName, price, quantity, img);
	//var img = 'img/iPhone5C.jpg';
	$("#laptopItemList").append(
		'<li class="laptopItem">' + 
	    	'<div class="panel panel-primary text-center">' +
	    		'<div class="panel-heading">' +
	    			'<h4>'+ pName +'</h4>' +
	    		'</div>' +
	    		'<div class="panel-body img-refactor">' +
	    			'<img alt="Product Image" src="' + img + '" class="img-responsive"/><br/>' +
	    			'<p>Serial No: <span id="srNo">'+ (listCount+1) +'</span></p>' +
	    			'<p>Price: <span id="price">'+ price +'</span></p>' +
	    			'<p>Avaliable Quantity: <span id="quantity">'+ quantity +'</span></p>' +
	    		'</div>' +
	    		'<div class="panel-footer">' +
	    			'<div class="form-group">' +
		    			'<label class="control-label">Quantity: &nbsp;&nbsp;</label>' + 
		    			'<input type="number" id="laptopQuantity'+ listCount +'" min="1" name="laptopQuantity">' +	    			
	    			'</div>' +
	    			'<button type="button" id="addToCart' + listCount +'" name="addToCart" class="btn btn-success" data-proId="'+listCount+'" data-proName="'+pName+'">Add to Cart</button>' +
	    			'</div>' +
	    	'</div>' +
	    '</li>'  
	);
	$("#laptopQuantity" + listCount).val(1);
	addToCartListener(pName, listCount);
	listCount++;
}

function addToCartListener(name, listCount){
	var proNumVal = listCount;
	$("#addToCart"+listCount).click(function(){
		var pname = name;
		var quantity = $("#laptopQuantity"+listCount).val();
		quantity = parseInt(quantity);
		$.get("addToCart.jsp?productName=" + pname+"&quantity="+quantity, function(data) {
		});
		
	});
}
</script>

<script>
	$(document).ready(function(){
		proNum = 0;
		if(annyang){
			
			var commands = {
					
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
					$("#addToCart" + (proNum-1)).focus();
				},
			
				'add to cart' : function(){
					var focusFieldId = $(':focus').attr("data-proId");
					var focusFieldName = $(':focus').attr("data-proName");
					focusFieldId = parseInt(focusFieldId);
					var pname = focusFieldName;
					var quantity = $("#laptopQuantity" + focusFieldId).val();
					quantity = parseInt(quantity);
					$.get("addToCart.jsp?productName=" + pname+"&quantity="+quantity, function(data) {
					alert("Product added to cart");
					});
				}
					
			}
			
			annyang.addCommands(commands);
			annyang.start(true, true);
			annyang.debug();
		}
	});
</script>