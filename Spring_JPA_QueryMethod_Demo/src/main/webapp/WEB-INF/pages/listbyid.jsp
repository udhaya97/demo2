<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<h3>List of Users</h3>
				<form:form action="Update" modelAttribute="user" name="updateForm">
					<table class="table table-striped">
						<thead color="blue">
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
							<c:forEach var="list" items="${listforid}">

								<c:if test="${list.id==userById.id}">
									<tr>
										<td>${list.id}</td>
										<td>${list.userName}</td>
										<td>${list.city}</td>
										<td>${list.mobile }</td>
										<td><a href="../delete?id=${list.id }"><span
												class="glyphicon glyphicon-trash"></span></a></td>
										<td><a href="../edit?id=${list.id }"><span
												class="glyphicon glyphicon-pencil"> </span></a></td>
									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
				</form:form>
			</div>
			<div class="col-sm-2"></div>

		</div>
	</div>


</body>
</html>
