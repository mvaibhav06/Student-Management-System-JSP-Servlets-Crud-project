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
						<p class="fs-3 text-center">Add Student</p>
						
						
						<% if(session.getAttribute("sucMsg") != null) {%>
							<p class="text-center" style="color: green"> <%= session.getAttribute("sucMsg") %> </p>
							<% session.removeAttribute("sucMsg"); %>
						<% } %>
						
						<% if(session.getAttribute("errorMsg") != null) {%>
							<p class="text-center" style="color: red"> <%= session.getAttribute("errorMsg") %> </p>
							<% session.removeAttribute("errorMsg"); %>
						<% } %>
						
						
						
						<form method="post" action="register">
						
							<div class="mb-3">
							    <label class="form-label">Name</label>
							    <input type="text" class="form-control" name="name">
						  	</div>
						  	
						  	<div class="mb-3">
							    <label class="form-label">Date of Birth</label>
							    <input type="date" class="form-control" name="dob">
						  	</div>
						  	
						  	<div class="mb-3">
							    <label class="form-label">Address</label>
							    <input type="text" class="form-control" name="address">
						  	</div>
						  	
						  	<div class="mb-3">
							    <label class="form-label">Qualification</label>
							    <input type="text" class="form-control" name="qualification">
						  	</div>
						
							  <div class="mb-3">
							    <label class="form-label">Email address</label>
							    <input type="email" class="form-control" name="email">
							  </div>
							  
							  <button type="submit" class="btn btn-primary col-md-12">Submit</button>
							</form>
						
						
						
					</div>
				</div>
			</div>
		</div>
	</div>	

</body>
</html>