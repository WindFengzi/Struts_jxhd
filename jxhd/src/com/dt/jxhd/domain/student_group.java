package com.dt.jxhd.domain;

import java.util.Date;

import com.dt.jxhd.commons.domain.BaseDomain;

public class student_group extends BaseDomain {
    /**
     * This field was generated by Abator for iBATIS.
     * This field corresponds to the database column student_group.group_id
     *
     * @abatorgenerated Wed Jan 21 09:25:16 CST 2015
     */
    private Integer groupId;

    /**
     * This field was generated by Abator for iBATIS.
     * This field corresponds to the database column student_group.student_id
     *
     * @abatorgenerated Wed Jan 21 09:25:16 CST 2015
     */
    private String studentId;

    /**
     * This field was generated by Abator for iBATIS.
     * This field corresponds to the database column student_group.class_id
     *
     * @abatorgenerated Wed Jan 21 09:25:16 CST 2015
     */
    private Integer classId;
    private String groupStatus;
    private Integer groupName;
    private Date createTime;
    private String studentName;
    public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public String getGroupStatus() {
		return groupStatus;
	}

	public void setGroupStatus(String groupStatus) {
		this.groupStatus = groupStatus;
	}

	public Integer getGroupName() {
		return groupName;
	}

	public void setGroupName(Integer groupName) {
		this.groupName = groupName;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	/**
     * This method was generated by Abator for iBATIS.
     * This method returns the value of the database column student_group.group_id
     *
     * @return the value of student_group.group_id
     *
     * @abatorgenerated Wed Jan 21 09:25:16 CST 2015
     */
    public Integer getGroupId() {
        return groupId;
    }

    /**
     * This method was generated by Abator for iBATIS.
     * This method sets the value of the database column student_group.group_id
     *
     * @param groupId the value for student_group.group_id
     *
     * @abatorgenerated Wed Jan 21 09:25:16 CST 2015
     */
    public void setGroupId(Integer groupId) {
        this.groupId = groupId;
    }

    /**
     * This method was generated by Abator for iBATIS.
     * This method returns the value of the database column student_group.student_id
     *
     * @return the value of student_group.student_id
     *
     * @abatorgenerated Wed Jan 21 09:25:16 CST 2015
     */
    public String getStudentId() {
        return studentId;
    }

    /**
     * This method was generated by Abator for iBATIS.
     * This method sets the value of the database column student_group.student_id
     *
     * @param studentId the value for student_group.student_id
     *
     * @abatorgenerated Wed Jan 21 09:25:16 CST 2015
     */
    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    /**
     * This method was generated by Abator for iBATIS.
     * This method returns the value of the database column student_group.class_id
     *
     * @return the value of student_group.class_id
     *
     * @abatorgenerated Wed Jan 21 09:25:16 CST 2015
     */
    public Integer getClassId() {
        return classId;
    }

    /**
     * This method was generated by Abator for iBATIS.
     * This method sets the value of the database column student_group.class_id
     *
     * @param classId the value for student_group.class_id
     *
     * @abatorgenerated Wed Jan 21 09:25:16 CST 2015
     */
    public void setClassId(Integer classId) {
        this.classId = classId;
    }
}