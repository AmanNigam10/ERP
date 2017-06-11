<%@page import="com.psl.service.CustomerService"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="com.psl.model.*"%>
<%@page import="java.util.List"%>
<%
	ApplicationContext context = new ClassPathXmlApplicationContext("config.xml");
	CustomerService cust_service = new CustomerService(); //context.getBean("cust_service",CustomerService.class);
 
	String id = request.getParameter("email");
	List<Customer> list = cust_service.getCustomers();
	
	for(Customer customer : list)
	{
		if(customer.getEmail().equals(id))
		{
			session.setAttribute("correctAnswer", customer.getSecurityAns());
			session.setAttribute("customer", customer);
			out.println(customer.getSecurityQues());		
		}
	}
	
	
%>