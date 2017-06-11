
<%@page import="java.util.Iterator"%>
<%@page import="com.psl.service.*"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="com.psl.model.*"%>
<%@page import="java.util.List"%>
<%
	ApplicationContext context = new ClassPathXmlApplicationContext("config.xml");
	CartService cart_service = context.getBean("cart_service",CartService.class);
 
	String pname = request.getParameter("productName");
	Customer customer = (Customer)session.getAttribute("customer");

	List<Cart> listofCart = (List<Cart>)session.getAttribute("cartList");
	
	Iterator<Cart> it = listofCart.iterator();
	int flag = 0;
	while(it.hasNext())
	{
		Cart c = it.next();
		if(c.getProductName().equals(pname))
		{	
				it.remove();
				
		}
	}
	
	session.setAttribute("cartList", listofCart);
	cart_service.deleteProdcutfromCart(customer, pname);
	
	
%>