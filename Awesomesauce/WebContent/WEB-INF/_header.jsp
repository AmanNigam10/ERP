<%@page import="com.psl.model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Gadget Floor</title>
	<link rel="stylesheet" href="css/bootstrap.min.css"/>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/annyang.min.js"></script>
	<script src="js/responsiveVoice.js"></script>
	<script>

		$(document).ready( function (){
	
			/* var pathname = window.location.pathname; // Returns path only */
			
			var url = "http://localhost:8080/GadgetFloor/landing.jsp";
			var href = window.location.href;
						
			
		<%Customer customer = (Customer) session.getAttribute("customer");%>
		if(href!=url)
			{
				if(<%= customer==null %>)
					{
					window.location="http://localhost:8080/GadgetFloor/SessionInvalidate";	
					}
					
			}
		function disableBack() { window.history.forward() }

        window.onload = disableBack();
        window.onpageshow = function(evt) { if (evt.persisted) disableBack() }
		
			
	
	
		});
</script>
</head>
