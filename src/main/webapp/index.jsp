<%@page import="com.conn.DBConnect"%>
<%@page import="com.entity.Student"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.StudentDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="all_css.jsp" %>
<title>Insert title here</title>
</head>
<body class="bg-light">

	<%@include file="navbar.jsp" %>
	
	<div class="container p-3">
	
		<div class="card">
			<div class="card-body">
			
				<% if(session.getAttribute("sucMsg") != null) {%>
					<p class="text-center" style="color: green"> <%= session.getAttribute("sucMsg") %> </p>
					<% session.removeAttribute("sucMsg"); %>
				<% } %>
						
				<% if(session.getAttribute("errorMsg") != null) {%>
					<p class="text-center" style="color: red"> <%= session.getAttribute("errorMsg") %> </p>
					<% session.removeAttribute("errorMsg"); %>
				<% } %>
			
			
				<p class="text-center fs-1">All Student Details</p>
		
				<table class="table">
					  <thead>
					    <tr>
					      <th scope="col">Id</th>
					      <th scope="col">Name</th>
					      <th scope="col">DOB</th>
					      <th scope="col">Address</th>
					      <th scope="col">Qualification</th>
					      <th scope="col">Email</th>
					      <th scope="col">Action</th>
					    </tr>
					  </thead>
					  <tbody>
					  <% 
					  	StudentDao studentDao = new StudentDao(DBConnect.getConn());
					  	List<Student> all_students = studentDao.getAllStudents();
					  %>
					  
					  <%for(Student student : all_students){ %>
					    <tr>
					      <th scope="row"><%= student.getId() %></th>
					      <td><%= student.getName() %></td>
					      <td><%= student.getDob() %></td>
					      <td><%= student.getAddress() %></td>
					      <td><%= student.getQualification() %></td>
					      <td><%= student.getEmail() %></td>
					      <td>
					      	<a href="edit_student.jsp?id=<%= student.getId() %>" class="btn btn-sm btn-primary">Edit</a>
					      	<a href="delete?id=<%= student.getId() %>" class="btn btn-sm btn-danger">Delete</a>
					      	
					      </td>
					    </tr>
					   <%} %>
					  </tbody>
				</table>
			</div>
		</div>
		
	</div>
	


</body>
</html>