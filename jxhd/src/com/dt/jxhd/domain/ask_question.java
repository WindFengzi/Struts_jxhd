package com.dt.jxhd.domain;

import java.sql.Date;

import com.dt.jxhd.commons.domain.BaseDomain;

public class ask_question extends BaseDomain {
	
	private Integer id;
	private Integer student_id;
	private Integer teacher_id;
	private String title;
	private String ask;
	private String question;
	private Date subdate;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getStudent_id() {
		return student_id;
	}
	public void setStudent_id(Integer student_id) {
		this.student_id = student_id;
	}
	public Integer getTeacher_id() {
		return teacher_id;
	}
	public void setTeacher_id(Integer teacher_id) {
		this.teacher_id = teacher_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAsk() {
		return ask;
	}
	public void setAsk(String ask) {
		this.ask = ask;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public Date getSubdate() {
		return subdate;
	}
	public void setSubdate(Date subdate) {
		this.subdate = subdate;
	}

}
