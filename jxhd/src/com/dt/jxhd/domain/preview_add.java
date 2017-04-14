package com.dt.jxhd.domain;

import java.util.Date;

import com.dt.jxhd.commons.domain.BaseDomain;

public class preview_add extends BaseDomain{
	
	private Integer preview_add_id;
	private Integer teacher_id;
	private String preview_title;
	private String preview_content;
	private Integer preview_tag;
	private Date create_time;
	
	private String add_ids;
	private String class_name;
	
	public Integer getPreview_add_id() {
		return preview_add_id;
	}
	public void setPreview_add_id(Integer preview_add_id) {
		this.preview_add_id = preview_add_id;
	}
	public Integer getTeacher_id() {
		return teacher_id;
	}
	public void setTeacher_id(Integer teacher_id) {
		this.teacher_id = teacher_id;
	}
	public String getPreview_title() {
		return preview_title;
	}
	public void setPreview_title(String preview_title) {
		this.preview_title = preview_title;
	}
	public String getPreview_content() {
		return preview_content;
	}
	public void setPreview_content(String preview_content) {
		this.preview_content = preview_content;
	}
	public Integer getPreview_tag() {
		return preview_tag;
	}
	public void setPreview_tag(Integer preview_tag) {
		this.preview_tag = preview_tag;
	}
	public Date getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	
	public String getAdd_ids() {
		return add_ids;
	}
	public void setAdd_ids(String add_ids) {
		this.add_ids = add_ids;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	
	
}
