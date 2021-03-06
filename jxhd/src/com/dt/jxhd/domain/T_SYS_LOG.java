package com.dt.jxhd.domain;

import java.util.Date;

import com.dt.jxhd.commons.domain.BaseDomain;




public class T_SYS_LOG extends BaseDomain {
    /**
     * This field was generated by Abator for iBATIS.
     * This field corresponds to the database column T_SYS_LOG.ID
     *
     * @abatorgenerated Mon Mar 07 16:23:39 CST 2011
     */
    private Integer id;

    /**
     * This field was generated by Abator for iBATIS.
     * This field corresponds to the database column T_SYS_LOG.OPERATION_DATE
     *
     * @abatorgenerated Mon Mar 07 16:23:39 CST 2011
     */
    private Date operationDate;

    /**
     * This field was generated by Abator for iBATIS.
     * This field corresponds to the database column T_SYS_LOG.LOGIN_NAME
     *
     * @abatorgenerated Mon Mar 07 16:23:39 CST 2011
     */
    private String loginName;

    /**
     * This field was generated by Abator for iBATIS.
     * This field corresponds to the database column T_SYS_LOG.USER_NAME
     *
     * @abatorgenerated Mon Mar 07 16:23:39 CST 2011
     */
    private String userName;

    /**
     * This field was generated by Abator for iBATIS.
     * This field corresponds to the database column T_SYS_LOG.MEMO
     *
     * @abatorgenerated Mon Mar 07 16:23:39 CST 2011
     */
    private String memo;

    /**
     * This field was generated by Abator for iBATIS.
     * This field corresponds to the database column T_SYS_LOG.IP
     *
     * @abatorgenerated Mon Mar 07 16:23:39 CST 2011
     */
    private String ip;

    /**
     * This field was generated by Abator for iBATIS.
     * This field corresponds to the database column T_SYS_LOG.OPERATION_TYPE
     *
     * @abatorgenerated Mon Mar 07 16:23:39 CST 2011
     */
    private String operationType;

    /**
     * This method was generated by Abator for iBATIS.
     * This method returns the value of the database column T_SYS_LOG.ID
     *
     * @return the value of T_SYS_LOG.ID
     *
     * @abatorgenerated Mon Mar 07 16:23:39 CST 2011
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by Abator for iBATIS.
     * This method sets the value of the database column T_SYS_LOG.ID
     *
     * @param id the value for T_SYS_LOG.ID
     *
     * @abatorgenerated Mon Mar 07 16:23:39 CST 2011
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by Abator for iBATIS.
     * This method returns the value of the database column T_SYS_LOG.OPERATION_DATE
     *
     * @return the value of T_SYS_LOG.OPERATION_DATE
     *
     * @abatorgenerated Mon Mar 07 16:23:39 CST 2011
     */
    public Date getOperationDate() {
        return operationDate;
    }

    /**
     * This method was generated by Abator for iBATIS.
     * This method sets the value of the database column T_SYS_LOG.OPERATION_DATE
     *
     * @param operationDate the value for T_SYS_LOG.OPERATION_DATE
     *
     * @abatorgenerated Mon Mar 07 16:23:39 CST 2011
     */
    public void setOperationDate(Date operationDate) {
        this.operationDate = operationDate;
    }

    /**
     * This method was generated by Abator for iBATIS.
     * This method returns the value of the database column T_SYS_LOG.LOGIN_NAME
     *
     * @return the value of T_SYS_LOG.LOGIN_NAME
     *
     * @abatorgenerated Mon Mar 07 16:23:39 CST 2011
     */
    public String getLoginName() {
        return loginName;
    }

    /**
     * This method was generated by Abator for iBATIS.
     * This method sets the value of the database column T_SYS_LOG.LOGIN_NAME
     *
     * @param loginName the value for T_SYS_LOG.LOGIN_NAME
     *
     * @abatorgenerated Mon Mar 07 16:23:39 CST 2011
     */
    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    /**
     * This method was generated by Abator for iBATIS.
     * This method returns the value of the database column T_SYS_LOG.USER_NAME
     *
     * @return the value of T_SYS_LOG.USER_NAME
     *
     * @abatorgenerated Mon Mar 07 16:23:39 CST 2011
     */
    public String getUserName() {
        return userName;
    }

    /**
     * This method was generated by Abator for iBATIS.
     * This method sets the value of the database column T_SYS_LOG.USER_NAME
     *
     * @param userName the value for T_SYS_LOG.USER_NAME
     *
     * @abatorgenerated Mon Mar 07 16:23:39 CST 2011
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }

    /**
     * This method was generated by Abator for iBATIS.
     * This method returns the value of the database column T_SYS_LOG.MEMO
     *
     * @return the value of T_SYS_LOG.MEMO
     *
     * @abatorgenerated Mon Mar 07 16:23:39 CST 2011
     */
    public String getMemo() {
        return memo;
    }

    /**
     * This method was generated by Abator for iBATIS.
     * This method sets the value of the database column T_SYS_LOG.MEMO
     *
     * @param memo the value for T_SYS_LOG.MEMO
     *
     * @abatorgenerated Mon Mar 07 16:23:39 CST 2011
     */
    public void setMemo(String memo) {
        this.memo = memo;
    }

    /**
     * This method was generated by Abator for iBATIS.
     * This method returns the value of the database column T_SYS_LOG.IP
     *
     * @return the value of T_SYS_LOG.IP
     *
     * @abatorgenerated Mon Mar 07 16:23:39 CST 2011
     */
    public String getIp() {
        return ip;
    }

    /**
     * This method was generated by Abator for iBATIS.
     * This method sets the value of the database column T_SYS_LOG.IP
     *
     * @param ip the value for T_SYS_LOG.IP
     *
     * @abatorgenerated Mon Mar 07 16:23:39 CST 2011
     */
    public void setIp(String ip) {
        this.ip = ip;
    }

    /**
     * This method was generated by Abator for iBATIS.
     * This method returns the value of the database column T_SYS_LOG.OPERATION_TYPE
     *
     * @return the value of T_SYS_LOG.OPERATION_TYPE
     *
     * @abatorgenerated Mon Mar 07 16:23:39 CST 2011
     */
    public String getOperationType() {
        return operationType;
    }

    /**
     * This method was generated by Abator for iBATIS.
     * This method sets the value of the database column T_SYS_LOG.OPERATION_TYPE
     *
     * @param operationType the value for T_SYS_LOG.OPERATION_TYPE
     *
     * @abatorgenerated Mon Mar 07 16:23:39 CST 2011
     */
    public void setOperationType(String operationType) {
        this.operationType = operationType;
    }
}