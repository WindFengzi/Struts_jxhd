package com.dt.jxhd.domain;

import com.dt.jxhd.commons.domain.BaseDomain;

public class t_class extends BaseDomain {
    private Integer classId;//�༶id,Ψһ�ԣ�����
    private Integer gradeId;//��һ����eg:2014,2015,2016
    private String gradeName;//
    private String departmentId;//�������ŵ�id�������
    private String departmentName;
    private String className;//�༶���֣������A��
    private Integer classNum;//�༶1�໹��2�࣬A�໹��B��

    /**
     * This method was generated by Abator for iBATIS.
     * This method returns the value of the database column t_class.class_id
     *
     * @return the value of t_class.class_id
     *
     * @abatorgenerated Fri Dec 19 12:33:47 CST 2014
     */
    public Integer getClassId() {
        return classId;
    }

    public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}

	/**
     * This method was generated by Abator for iBATIS.
     * This method sets the value of the database column t_class.class_id
     *
     * @param classId the value for t_class.class_id
     *
     * @abatorgenerated Fri Dec 19 12:33:47 CST 2014
     */
    public void setClassId(Integer classId) {
        this.classId = classId;
    }

    /**
     * This method was generated by Abator for iBATIS.
     * This method returns the value of the database column t_class.grade_id
     *
     * @return the value of t_class.grade_id
     *
     * @abatorgenerated Fri Dec 19 12:33:47 CST 2014
     */
    public Integer getGradeId() {
        return gradeId;
    }

    public String getGradeName() {
		return gradeName;
	}

	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}

	/**
     * This method was generated by Abator for iBATIS.
     * This method sets the value of the database column t_class.grade_id
     *
     * @param gradeId the value for t_class.grade_id
     *
     * @abatorgenerated Fri Dec 19 12:33:47 CST 2014
     */
    public void setGradeId(Integer gradeId) {
        this.gradeId = gradeId;
    }

    /**
     * This method was generated by Abator for iBATIS.
     * This method returns the value of the database column t_class.department_id
     *
     * @return the value of t_class.department_id
     *
     * @abatorgenerated Fri Dec 19 12:33:47 CST 2014
     */
    public String getDepartmentId() {
        return departmentId;
    }

    /**
     * This method was generated by Abator for iBATIS.
     * This method sets the value of the database column t_class.department_id
     *
     * @param departmentId the value for t_class.department_id
     *
     * @abatorgenerated Fri Dec 19 12:33:47 CST 2014
     */
    public void setDepartmentId(String departmentId) {
        this.departmentId = departmentId;
    }

    /**
     * This method was generated by Abator for iBATIS.
     * This method returns the value of the database column t_class.class_name
     *
     * @return the value of t_class.class_name
     *
     * @abatorgenerated Fri Dec 19 12:33:47 CST 2014
     */
    public String getClassName() {
        return className;
    }

    /**
     * This method was generated by Abator for iBATIS.
     * This method sets the value of the database column t_class.class_name
     *
     * @param className the value for t_class.class_name
     *
     * @abatorgenerated Fri Dec 19 12:33:47 CST 2014
     */
    public void setClassName(String className) {
        this.className = className;
    }

    /**
     * This method was generated by Abator for iBATIS.
     * This method returns the value of the database column t_class.class_num
     *
     * @return the value of t_class.class_num
     *
     * @abatorgenerated Fri Dec 19 12:33:47 CST 2014
     */
    public Integer getClassNum() {
        return classNum;
    }

    /**
     * This method was generated by Abator for iBATIS.
     * This method sets the value of the database column t_class.class_num
     *
     * @param classNum the value for t_class.class_num
     *
     * @abatorgenerated Fri Dec 19 12:33:47 CST 2014
     */
    public void setClassNum(Integer classNum) {
        this.classNum = classNum;
    }
}