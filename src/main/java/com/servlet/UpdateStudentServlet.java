package com.servlet;

import java.io.IOException;

import com.conn.DBConnect;
import com.dao.StudentDao;
import com.entity.Student;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/update")
public class UpdateStudentServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String name = req.getParameter("name");
		String dob = req.getParameter("dob");
		String address = req.getParameter("address");
		String qualification = req.getParameter("qualification");
		String email = req.getParameter("email");
		
		int id = Integer.parseInt(req.getParameter("id"));
		
		Student student = new Student(id, name, dob, address, qualification, email);
		StudentDao studentDao = new StudentDao(DBConnect.getConn());
		
		HttpSession session = req.getSession();
		
		int res = studentDao.updateStudent(student);

		if(res>0) {
			session.setAttribute("sucMsg", "Student " + id +" details updated successfully");
			resp.sendRedirect("index.jsp");
		}else {
			session.setAttribute("errorMsg", "Something went wrong");
			resp.sendRedirect("index.jsp");
		}
		
	}
}
