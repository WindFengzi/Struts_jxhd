package com.dt.jxhd.domain;

import com.dt.jxhd.commons.domain.BaseDomain;

public class evalution_comment extends BaseDomain{
	
	private Integer id;
	private String comment;
	private Integer grade;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Integer getGrade() {
		return grade;
	}
	public void setGrade(Integer grade) {
		this.grade = grade;
	}
	
	

}
