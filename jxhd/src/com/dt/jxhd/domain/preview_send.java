package com.dt.jxhd.domain;

import java.util.Date;
import java.util.List;

import com.dt.jxhd.commons.domain.BaseDomain;

public class preview_send extends BaseDomain{
	
	private Integer preview_send_id;
	private Integer preview_add_id;
	private Integer temp_id;
	private Integer temp_tag;
	private Date send_time;
	
	private List<?> ids;
	private Integer teacher_id;
	private String class_name;
	private String preview_title;
	private String preview_content;
	private Integer preview_tag;
	
	private String url;
	
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
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
	public Integer getTeacher_id() {
		return teacher_id;
	}
	public void setTeacher_id(Integer teacher_id) {
		this.teacher_id = teacher_id;
	}
	public Integer getPreview_send_id() {
		return preview_send_id;
	}
	public void setPreview_send_id(Integer preview_send_id) {
		this.preview_send_id = preview_send_id;
	}
	public Integer getPreview_add_id() {
		return preview_add_id;
	}
	public void setPreview_add_id(Integer preview_add_id) {
		this.preview_add_id = preview_add_id;
	}
	public Integer getTemp_id() {
		return temp_id;
	}
	public void setTemp_id(Integer temp_id) {
		this.temp_id = temp_id;
	}
	public Integer getTemp_tag() {
		return temp_tag;
	}
	public void setTemp_tag(Integer temp_tag) {
		this.temp_tag = temp_tag;
	}
	public Date getSend_time() {
		return send_time;
	}
	public void setSend_time(Date send_time) {
		this.send_time = send_time;
	}
	public List<?> getIds() {
		return ids;
	}
	public void setIds(List<?> ids) {
		this.ids = ids;
	}
	
}
