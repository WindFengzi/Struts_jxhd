package com.dt.jxhd.domain;

import java.util.Date;

import com.dt.jxhd.commons.domain.BaseDomain;

public class group_error extends  BaseDomain{
	private Integer group_id;
	private String student_id;
	private String student_name;
	private Integer class_id;
	private Date create_time;
	private Integer group_status;
	private String group_name;
	private Integer subject_id;
	public Integer getGroup_id() {
		return group_id;
	}
	public void setGroup_id(Integer group_id) {
		this.group_id = group_id;
	}
	public String getStudent_id() {
		return student_id;
	}
	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}
	public String getStudent_name() {
		return student_name;
	}
	public void setStudent_name(String student_name) {
		this.student_name = student_name;
	}
	public Integer getClass_id() {
		return class_id;
	}
	public void setClass_id(Integer class_id) {
		this.class_id = class_id;
	}
	public Date getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	public Integer getGroup_status() {
		return group_status;
	}
	public void setGroup_status(Integer group_status) {
		this.group_status = group_status;
	}
	public String getGroup_name() {
		return group_name;
	}
	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}
	public Integer getSubject_id() {
		return subject_id;
	}
	public void setSubject_id(Integer subject_id) {
		this.subject_id = subject_id;
	}
	
}
