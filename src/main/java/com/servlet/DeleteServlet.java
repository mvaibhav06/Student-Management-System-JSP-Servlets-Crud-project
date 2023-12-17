package com.servlet;

import java.io.IOException;

import com.conn.DBConnect;
import com.dao.StudentDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/delete")
public class DeleteServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		StudentDao dao = new StudentDao(DBConnect.getConn());
		
		int id = Integer.parseInt(req.getParameter("id"));
		
		int res = dao.deleteStudentById(id);
		
		HttpSession session = req.getSession();
		
		if(res>0) {
			session.setAttribute("sucMsg", "Student " + id +" deleted successfully");
			resp.sendRedirect("index.jsp");
		}else {
			session.setAttribute("errorMsg", "Something went wrong");
			resp.sendRedirect("index.jsp");
		}
		
	}
	
}
