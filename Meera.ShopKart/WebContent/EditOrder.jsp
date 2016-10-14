<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Order</title>
<link rel="stylesheet" type="text/css" href="bodystyle.css">

<style>
	#outerdiv{
		height:90%;
		width: 100%;
	}

	table {
	    font-family: arial, sans-serif;
		border:8px #000066 solid;
	    border-collapse: collapse;
	    width: 100%;
	}
	
	td, th {
	    border: 1px solid white;
	    text-align: center;
	    padding: 8px;
	}
	
	tr{
	    background-color: #dddddd;
	}
	</style> 
 
 	<script>
 	
 	function fun1(a){
 		var x = Number(document.getElementById(a).value);
 		ArrayList<Product> productlist= new ArrayList<Product>();
		HttpSession session1 = request.getSession(false);
		productlist = (ArrayList<Product>)session1.getAttribute("product");
 		
		for (var i=0; i<productlist.size();i++){
 			 var b=productlist.get(i).getInventory();
 		if (x > b){
 			alert("Product unavailable, Select a quantity less than "+b);
 			document.getElementById(a).value = "";
 			document.getElementById(a).focus();
 			return false;
 			}
 		
 		}
 		return true;
 		
 	}
 	
 	
 	
 	
 	</script>
 	
 	
  	<script> 
 	
 	
  	function EnableDisableTextBox(chkSelected,name) {
         var name = document.getElementById(name);
         name.disabled = chkSelected.checked ? false : true;
         if (!name.disabled) {
             name.focus();
         }
   }
 	
 	
 	</script>
 	
 	<script>
 	
 	function SearchFun() {
 		  var xhttp = new XMLHttpRequest();
 		  var searchString=document.getElementById("searchbartext").value;
 		  var url="/Meera.ShopKart/SearchProdServlet?p="+searchString;
 		  //alert(searchString + "Searching....");
 		  xhttp.onreadystatechange = function() {
 		    if (this.readyState == 4 && this.status == 200) {
 		     document.getElementById("outerdiv").innerHTML = this.responseText;
 		     
 		    }
 		  };
 		  xhttp.open("GET",url , true);
 		  xhttp.send();
 		}
 	
 	</script>
  
</head>
<body>



<br>
<div id="outerdiv">

<div >
<img src="images/logo.png"/>

<div id="Back">  
    <button type="button" onclick="window.location.href='/Meera.ShopKart/Catalog.jsp'" value="Back">Back</button>
</div>

<div align="right"><form action="LogoutServlet"><input type="submit" value="Logout" ></input></form></div>
</div>

	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
	<%@ page import="java.io.*,java.util.*,java.sql.*"%>
	<%@ page import="javax.servlet.http.*,javax.servlet.*" %>	
	
<div id="Search">
  <h2>Search</h2>
  Product Search <input type="text" id="searchbartext"/>
  <button type="button" onclick="SearchFun()" value="Search">Search</button>
</div>
	
<form id="Catalog" action="AddtoCart" method="post" onkeypress="return event.charCode >= 48 && event.charCode <= 57">
  		 
<table>
	<tr>
			<td>Product ID </td>
			<td>Product Name</td>
			<td>Price</td>
			<td>Quantity</td>
			<td></td>
		</tr>
	<c:forEach items="${sessionScope.cart}" var="e">
		<c:set var="productid" value="${e.prodId}" scope="session"></c:set>
	<tr>
			<td>${e.prodId}</td>
			<td>${e.prodName}</td>
			<td>${e.cost}</td>
			<td> <input type="text" name = "text_${e.prodId }" id = "${e.prodId }" value = "${e.inventory}" onchange="return fun1('${productid}');" /> </td>
			<td><input type="checkbox" name = "check_${e.prodId }" id = "${e.prodId }" checked /></td>
			
			

			

		</tr>
	</c:forEach>
	</table>
  <br>
	<div align="center"><input type="submit" value="Add to Cart"  /></div>        
  </form>
  
  <br>
  
 
  
  
  </div>
</body>
</html>