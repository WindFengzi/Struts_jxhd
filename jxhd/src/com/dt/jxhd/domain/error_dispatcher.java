package com.dt.jxhd.domain;

import java.util.Date;

public class error_dispatcher {
	private Integer dispatcher_id;
	private Integer teacher_id;
	private Integer class_id;
	private String student_id;
	private Date create_time;
	private String dispatcher_content;
	public Integer getDispatcher_id() {
		return dispatcher_id;
	}
	public void setDispatcher_id(Integer dispatcher_id) {
		this.dispatcher_id = dispatcher_id;
	}
	public Integer getTeacher_id() {
		return teacher_id;
	}
	public void setTeacher_id(Integer teacher_id) {
		this.teacher_id = teacher_id;
	}
	public Integer getClass_id() {
		return class_id;
	}
	public void setClass_id(Integer class_id) {
		this.class_id = class_id;
	}
	public String getStudent_id() {
		return student_id;
	}
	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}
	public Date getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	public String getDispatcher_content() {
		return dispatcher_content;
	}
	public void setDispatcher_content(String dispatcher_content) {
		this.dispatcher_content = dispatcher_content;
	}
	
}
