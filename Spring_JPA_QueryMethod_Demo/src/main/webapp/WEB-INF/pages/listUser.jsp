<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
      pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<div class="container-fluid">
<div class= "row">
<div class = "col-sm-2"></div>
<div class = "col-sm-8">
<h3>List of Users</h3>
 <table class="table table-striped">
 <thead color = "blue">
      <tr>
        <th>Id</th>
        <th>Name</th>
        <th>City</th>
         <th>Mobile</th>
         <th>Delete</th>
         <th>Edit</th>
		
      </tr>
    </thead>
      <tbody>
      
          <c:forEach var="lis" items="${User}">
                  <tr>
                 
                        <td>${lis.id }</td>
                        <td>${lis.userName }</td> 
                        <td>${lis.city }</td>
                        <td>${lis.mobile }</td>
                        <td><a href="delete?id=${lis.id }"><span class="glyphicon glyphicon-trash"></span></a></td>
                        <td><a href="edit?id=${lis.id }"><span class="glyphicon glyphicon-pencil"> </span></a></td>
                  </tr>
            </c:forEach>
         
      </tbody>
  
 </table>
 
      <c:if test="${current>0}" >
 <a href = "list?page=${current-1 }">prev</a>
 </c:if>
 <c:forEach begin="0" end="${total-1}" varStatus="loop">
 <c:choose>
 <c:when test="${loop.index==current}">
 	<mark>${loop.index+1}</mark>
 </c:when>
  <c:otherwise>
 <a href = "list?page=${loop.index}">${loop.index+1}</a>
 </c:otherwise> 
 </c:choose>
 
 
 </c:forEach>
 <c:if test="${current<total-1}" >
 <a href = "list?page=${current+1 }">Next</a>
 </c:if>
</div>
<div class = "col-sm-2"></div>

</div>
</div>
   
</body>
</html>
