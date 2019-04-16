<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Customer</title>
</head>
<body>
	<div class="con">
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-2"></div>
				<div class="col-sm-8">
					<form:form action="Update" modelAttribute="users" name="updateForm">
						<table class="table table-striped">
							<thead color="blue">
								<tr>
									<th>Id</th>
									<th>Name</th>
									<th>City</th>
									<th>Mobile</th>
									<th>Edit/Update</th>
									<th>Delete</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="list" items="${list}">
									<c:if test="${list.id==user.id}">
										<tr>
											<td>${list.id}</td>
											<form:hidden path="id" value="${list.id}" />
											<td><form:input path="userName" value="${list.userName}" /></td>
											<td><form:input path="city" value="${list.city}" /></td>
											<td><form:input path="mobile" value="${list.mobile }" /></td>

											<td><a onclick="updateForm.submit()" href="#"><span
													class="glyphicon glyphicon-open"></span></a><br></td>

											<td><a href="Delete?id=${user.id}"><span
													class="glyphicon glyphicon-trash"></span></a><br></td>
										</tr>
									</c:if>
									<c:if test="${list.id != user.id}">
										<tr>
											<td>${list.id}</td>
											<td>${list.userName}</td>
											<td>${list.city}</td>
											<td>${list.mobile }</td>

											<td><a href="edit?id=${list.id}"> <span
													class="glyphicon glyphicon-pencil"></span></a></td>
											<td><a href="delete?id=${list.id}"><span
													class="glyphicon glyphicon-trash"></span></a></td>
										</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
					</form:form>
				</div>
			</div>
		</div>
</body>
</html>