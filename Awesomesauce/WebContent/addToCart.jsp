<%@page import="com.psl.service.*"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="com.psl.model.*"%>
<%@page import="java.util.List"%>
<%
	ApplicationContext context = new ClassPathXmlApplicationContext("config.xml");
	CartService cart_service = context.getBean("cart_service",CartService.class);
	ProductService prod_service = new ProductService();// context.getBean("prod_service",ProductService.class);
	
	String pname = request.getParameter("productName");
	String quantity = request.getParameter("quantity");
	Customer customer = (Customer)session.getAttribute("customer");

	System.out.println(quantity);
	System.out.println(pname);
	Product product = prod_service.getProductbyProductName(pname);
	Cart cart = new Cart();
	cart.setEmail(customer.getEmail());
	cart.setProductId(product.getProductId());
	cart.setProductName(product.getProdcutName());
	cart.setQuantityPurchased(Integer.parseInt(quantity));
	cart_service.addtoCart(cart);
	
	out.println(quantity);
	
%>