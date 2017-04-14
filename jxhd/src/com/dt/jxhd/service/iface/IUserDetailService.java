package com.dt.jxhd.service.iface;

import java.util.List;

import com.dt.jxhd.domain.student;
import com.dt.jxhd.domain.teacher;
import com.dt.jxhd.domain.userDetail;



public interface IUserDetailService {

	public Object save(teacher teacher);
	public List users(teacher teacher);
	public Object update(teacher teacher);
	public int getMaxFileCountNum(teacher teacher);
	public teacher teacherById(teacher teacher);
	public void deleteTeacher(teacher teacher);
	public Object saveStudent(student student);
	public List students(student student);
	public student studentById(student student);
	public Object update(student student);
	public int getMaxFileCountNum(student student);
	public void deleteStudent(student student);
}
