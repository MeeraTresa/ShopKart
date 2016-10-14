<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script>
 
	  function isNumberKey(evt)
	  {
	     var charCode = (evt.which) ? evt.which : event.keyCode
	     if (charCode != 45  && charCode > 31 && (charCode < 48 || charCode > 57))
	        return false;

	     return true;
	  } 
	
	
</script>
</head>
<body>
<form action = "CartServlet" method = "post"> 
<h2>Debit Card Payment</h2>
<br></br>
Enter your Debit Card Details :
Card number:<input type='text' name='card'onkeypress="return isNumberKey(event)"></input><br></br>
CVV number:<input type='text' name='cvv'onkeypress="return isNumberKey(event)"></input><br></br>
Valid till:<input type='text' name='valid' ></input>
<input type = 'submit' name = 'submit' value = 'submit'>
</form>
</body>
</html>