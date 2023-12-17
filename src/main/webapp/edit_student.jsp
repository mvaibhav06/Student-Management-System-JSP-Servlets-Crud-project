<%@page import="com.entity.Student"%>
<%@page import="com.conn.DBConnect"%>
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
	
	<div class="container p-4">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
						<p class="fs-3 text-center">Edit Student</p>
						
						
						<%
							int id = Integer.parseInt(request.getParameter("id"));
							StudentDao dao = new StudentDao(DBConnect.getConn());
							Student student = dao.getStudentById(id);
						
						%>
						
						
						
						
						<form method="post" action="update">
						
							<div class="mb-3">
							    <label class="form-label">Name</label>
							    <input type="text" class="form-control" name="name" value=<%= student.getName() %>>
						  	</div>
						  	
						  	<div class="mb-3">
							    <label class="form-label">Date of Birth</label>
							    <input type="date" class="form-control" name="dob" value=<%= student.getDob() %>>
						  	</div>
						  	
						  	<div class="mb-3">
							    <label class="form-label">Address</label>
							    <input type="text" class="form-control" name="address" value=<%= student.getAddress() %>>
						  	</div>
						  	
						  	<div class="mb-3">
							    <label class="form-label">Qualification</label>
							    <input type="text" class="form-control" name="qualification" value=<%=student.getQualification() %>>
						  	</div>
						
							  <div class="mb-3">
							    <label class="form-label">Email address</label>
							    <input type="email" class="form-control" name="email" value=<%= student.getEmail() %>>
							  </div>
							  
							  <input type="hidden" name="id" value=<%= student.getId() %>>
							  
							  <button type="submit" class="btn btn-primary col-md-12">Update</button>
							</form>
						
						
						
					</div>
				</div>
			</div>
		</div>
	</div>	

</body>
</html>