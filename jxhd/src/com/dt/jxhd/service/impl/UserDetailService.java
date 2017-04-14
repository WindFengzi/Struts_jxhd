package com.dt.jxhd.service.impl;

import java.util.List;

import com.dt.jxhd.commons.service.BaseService;
import com.dt.jxhd.domain.student;
import com.dt.jxhd.domain.teacher;
import com.dt.jxhd.domain.userDetail;
import com.dt.jxhd.service.iface.IUserDetailService;



public class UserDetailService extends BaseService implements IUserDetailService{

	public Object save(teacher teacher){
		return this.insertBySqlAndReturn("teacher.teacher_insert",teacher);
	}
	public List users(teacher teacher){
		return (List) this.getListData("teacher.teachers", teacher);
	}
	public teacher teacherById(teacher teacher){
		return (teacher) this.getSingleData("teacher.teacher_selectById", teacher);
	}
	public Object update(teacher teacher){
		return  (Object)this.updateBySqlAndReturn("teacher.teacher_update",teacher);
	}
	public int getMaxFileCountNum(teacher teacher){
		Object obj = this.getSingleData("teacher.getTeacherCountnum",teacher);
		int num = 0;
		if (obj != null) {
			num = ((Integer) obj).intValue();
		}
		return num;
	}
	public void deleteTeacher(teacher teacher){
		this.deleteBySql("teacher.teacher_delete",teacher);
	}
	
	public Object saveStudent(student student){
		return this.insertBySqlAndReturn("student.student_insert",student);
	}
	public List students(student student){
		return (List) this.getListData("student.students", student);
	}
	public student studentById(student student){
		return (student) this.getSingleData("student.student_selectById", student);
	}
	public Object update(student student){
		return  (Object)this.updateBySqlAndReturn("student.student_update",student);
	}
	public int getMaxFileCountNum(student student){
		Object obj = this.getSingleData("student.getStudentCountnum",student);
		int num = 0;
		if (obj != null) {
			num = ((Integer) obj).intValue();
		}
		return num;
	}
	public void deleteStudent(student student){
		this.deleteBySql("student.student_delete",student);
	}
}
