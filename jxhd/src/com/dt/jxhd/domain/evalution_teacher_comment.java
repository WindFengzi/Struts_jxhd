package com.dt.jxhd.domain;

import com.dt.jxhd.commons.domain.BaseDomain;

public class evalution_teacher_comment extends BaseDomain{

	private Integer id;
	private Integer teacher_id;
	private Integer student_id;
	private Integer studentTo_id;
	private Integer class_id;
	private Integer comment_id;
	private Integer tag;
	
	private String comment; // 评价内容
	private String name; // 老师名
	private String class_name; // 班级名
	private String grade; // 评价分数
	private String studentname; // 评价老师或者同学的学生名
	private String studentToname; // 被评价的学生名
	
	public String getStudentname() {
		return studentname;
	}
	public void setStudentname(String studentname) {
		this.studentname = studentname;
	}
	public String getStudentToname() {
		return studentToname;
	}
	public void setStudentToname(String studentToname) {
		this.studentToname = studentToname;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getTeacher_id() {
		return teacher_id;
	}
	public void setTeacher_id(Integer teacher_id) {
		this.teacher_id = teacher_id;
	}
	public Integer getStudent_id() {
		return student_id;
	}
	public void setStudent_id(Integer student_id) {
		this.student_id = student_id;
	}
	public Integer getStudentTo_id() {
		return studentTo_id;
	}
	public void setStudentTo_id(Integer studentTo_id) {
		this.studentTo_id = studentTo_id;
	}
	public Integer getClass_id() {
		return class_id;
	}
	public void setClass_id(Integer class_id) {
		this.class_id = class_id;
	}
	public Integer getComment_id() {
		return comment_id;
	}
	public void setComment_id(Integer comment_id) {
		this.comment_id = comment_id;
	}
	public Integer getTag() {
		return tag;
	}
	public void setTag(Integer tag) {
		this.tag = tag;
	}
	
	
	
}
