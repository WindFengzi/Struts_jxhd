package com.dt.jxhd.domain;

import com.dt.jxhd.commons.domain.BaseDomain;

public class subject extends BaseDomain {
    private Integer subjectId;//课程id，比如语文，数学
    private String subjectName;//课程名字，比如语文，数学

    /**
     * This method was generated by Abator for iBATIS.
     * This method returns the value of the database column subject.subject_id
     *
     * @return the value of subject.subject_id
     *
     * @abatorgenerated Mon Feb 02 16:17:23 CST 2015
     */
    public Integer getSubjectId() {
        return subjectId;
    }

    /**
     * This method was generated by Abator for iBATIS.
     * This method sets the value of the database column subject.subject_id
     *
     * @param subjectId the value for subject.subject_id
     *
     * @abatorgenerated Mon Feb 02 16:17:23 CST 2015
     */
    public void setSubjectId(Integer subjectId) {
        this.subjectId = subjectId;
    }

    /**
     * This method was generated by Abator for iBATIS.
     * This method returns the value of the database column subject.subject_name
     *
     * @return the value of subject.subject_name
     *
     * @abatorgenerated Mon Feb 02 16:17:23 CST 2015
     */
    public String getSubjectName() {
        return subjectName;
    }

    /**
     * This method was generated by Abator for iBATIS.
     * This method sets the value of the database column subject.subject_name
     *
     * @param subjectName the value for subject.subject_name
     *
     * @abatorgenerated Mon Feb 02 16:17:23 CST 2015
     */
    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }
}