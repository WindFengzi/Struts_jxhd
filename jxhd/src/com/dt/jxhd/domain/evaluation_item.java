package com.dt.jxhd.domain;

import com.dt.jxhd.commons.domain.BaseDomain;

public class evaluation_item  extends BaseDomain {

	/**
	 * This field was generated by Abator for iBATIS. This field corresponds to the database column evaluation_item.item_id
	 * @abatorgenerated  Mon Jan 19 15:06:28 CST 2015
	 */
	private Integer itemId;
	/**
	 * This field was generated by Abator for iBATIS. This field corresponds to the database column evaluation_item.content
	 * @abatorgenerated  Mon Jan 19 15:06:28 CST 2015
	 */
	private String content;
	/**
	 * This field was generated by Abator for iBATIS. This field corresponds to the database column evaluation_item.grade_id
	 * @abatorgenerated  Mon Jan 19 15:06:28 CST 2015
	 */
	private String gradeId;

	/**
	 * This method was generated by Abator for iBATIS. This method returns the value of the database column evaluation_item.item_id
	 * @return  the value of evaluation_item.item_id
	 * @abatorgenerated  Mon Jan 19 15:06:28 CST 2015
	 */
	public Integer getItemId() {
		return itemId;
	}

	/**
	 * This method was generated by Abator for iBATIS. This method sets the value of the database column evaluation_item.item_id
	 * @param itemId  the value for evaluation_item.item_id
	 * @abatorgenerated  Mon Jan 19 15:06:28 CST 2015
	 */
	public void setItemId(Integer itemId) {
		this.itemId = itemId;
	}

	/**
	 * This method was generated by Abator for iBATIS. This method returns the value of the database column evaluation_item.content
	 * @return  the value of evaluation_item.content
	 * @abatorgenerated  Mon Jan 19 15:06:28 CST 2015
	 */
	public String getContent() {
		return content;
	}

	/**
	 * This method was generated by Abator for iBATIS. This method sets the value of the database column evaluation_item.content
	 * @param content  the value for evaluation_item.content
	 * @abatorgenerated  Mon Jan 19 15:06:28 CST 2015
	 */
	public void setContent(String content) {
		this.content = content;
	}

	/**
	 * This method was generated by Abator for iBATIS. This method returns the value of the database column evaluation_item.grade_id
	 * @return  the value of evaluation_item.grade_id
	 * @abatorgenerated  Mon Jan 19 15:06:28 CST 2015
	 */
	public String getGradeId() {
		return gradeId;
	}

	/**
	 * This method was generated by Abator for iBATIS. This method sets the value of the database column evaluation_item.grade_id
	 * @param gradeId  the value for evaluation_item.grade_id
	 * @abatorgenerated  Mon Jan 19 15:06:28 CST 2015
	 */
	public void setGradeId(String gradeId) {
		this.gradeId = gradeId;
	}
}