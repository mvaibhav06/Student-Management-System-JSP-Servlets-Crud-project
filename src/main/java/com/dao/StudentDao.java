package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.conn.DBConnect;
import com.entity.Student;

public class StudentDao {

	private Connection con;
	
	public StudentDao(Connection con) {
		this.con = con;
	}
	
	
	
	public int addStudent(Student student) {
		
		int result = 0;
		
		try {
			String query = "insert into student(name,dob,address,qualification,email) values(?,?,?,?,?);";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, student.getName());
			ps.setString(2, student.getDob());
			ps.setString(3, student.getAddress());
			ps.setString(4, student.getQualification());
			ps.setString(5, student.getEmail());
			
			result = ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	public int updateStudent(Student student) {
		
		int result = 0;
		
		try {
			String query = "update student set name=?, dob=?, address=?, qualification=?, email=? where id=?;";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, student.getName());
			ps.setString(2, student.getDob());
			ps.setString(3, student.getAddress());
			ps.setString(4, student.getQualification());
			ps.setString(5, student.getEmail());
			ps.setInt(6, student.getId());
			
			result = ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	public List<Student> getAllStudents(){
		List<Student> out = new ArrayList<Student>();
		
		try {
			String query = "select * from student;";
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String dob = rs.getString("dob");
				String address = rs.getString("address");
				String qualification = rs.getString("qualification");
				String email = rs.getString("email");
				
				Student student = new Student(id, name, dob, address, qualification, email);
				out.add(student);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return out;
	}
	
	public Student getStudentById(int id) {
		Student student = null;
		
		try {
			String query = "select * from student where id=?;";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				String name = rs.getString("name");
				String dob = rs.getString("dob");
				String address = rs.getString("address");
				String qualification = rs.getString("qualification");
				String email = rs.getString("email");
				
				student = new Student(id, name, dob, address, qualification, email);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return student;
	}
	
	
	public int deleteStudentById(int id) {
		Student student = null;
		
		int res = 0;
		
		try {
			String query = "delete from student where id=?;";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, id);
			
			res = ps.executeUpdate();
						
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
}
