<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="com.psl.service.CustomerService"%>
    
<%
	ApplicationContext context = new ClassPathXmlApplicationContext("config.xml");
	CustomerService cust_service = new CustomerService(); //context.getBean("cust_service",CustomerService.class);

	String message = cust_service.trackOrder(Long.parseLong(request.getParameter("billid")));
	out.println(message);
%>