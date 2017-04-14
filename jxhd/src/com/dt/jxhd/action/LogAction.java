package com.dt.jxhd.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.dt.jxhd.domain.T_SYS_LOG;
import com.dt.jxhd.domain.T_SYS_PARAMETER;
import com.dt.jxhd.domain.department;
import com.dt.jxhd.domain.t_class;
import com.dt.jxhd.domain.index_edit;
import com.dt.jxhd.service.iface.ILogService;
import com.opensymphony.xwork2.ActionSupport;

public class LogAction extends BaseAction {
	
	private static final long serialVersionUID = 1L;
	private static final int BUFFER_SIZE=16*1024;
	private index_edit index_edit;//首页logo显示
	
	public index_edit getIndex_edit() {
		return index_edit;
	}
	public void setIndex_edit(index_edit index_edit) {
		this.index_edit = index_edit;
	}
	private T_SYS_LOG t_sys_log;
	public T_SYS_LOG getT_sys_log() {
		return t_sys_log;
	}
	public void setT_sys_log(T_SYS_LOG t_sys_log) {
		this.t_sys_log = t_sys_log;
	}
	private ILogService logService;

	public void setLogService(ILogService logService) {
		this.logService = logService;
	}
	private T_SYS_PARAMETER t_sys_parameter;
	
	public T_SYS_PARAMETER getT_sys_parameter() {
		return t_sys_parameter;
	}
	public void setT_sys_parameter(T_SYS_PARAMETER t_sys_parameter) {
		this.t_sys_parameter = t_sys_parameter;
	}
	private t_class t_class;

	public t_class getT_class() {
		return t_class;
	}
	public void setT_class(t_class t_class) {
		this.t_class = t_class;
	}
	private List list;
	public List getList() {
		return list;
	}
	public void setList(List list) {
		this.list = list;
	}
	private department department;
	public department getDepartment() {
		return department;
	}
	public void setDepartment(department department) {
		this.department = department;
	}
	public String logsList() throws Exception{
		if(t_sys_log==null){
			t_sys_log = new T_SYS_LOG();
		}
		HttpSession session = ServletActionContext.getRequest().getSession();
//		if(session.getAttribute("roleIntId").toString().indexOf("155")==-1){
//			return "noRight";
//		}
		t_sys_log.setRecNum(logService.getMaxLogCountNum(t_sys_log));
		t_sys_log.setData(logService.logs(t_sys_log)); 
		return "list";
	}
	//参数管理
	public String params() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if(session.getAttribute("roles").toString().indexOf("1067,")==-1){
			return "noRight";
		}
		if(t_sys_parameter==null){
			t_sys_parameter = new T_SYS_PARAMETER();
		}
		t_sys_parameter.setRecNum(logService.getMaxParamCountNum(t_sys_parameter));
		t_sys_parameter.setData(logService.params(t_sys_parameter));
		return "list";
	}
	public String toInsertParam() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if(session.getAttribute("roles").toString().indexOf("1068,")==-1){
			return "noRight";
		}
		if(t_sys_parameter==null){
			t_sys_parameter = new T_SYS_PARAMETER();
		}
		return "insert";
	}
	public String paramById() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if(session.getAttribute("roles").toString().indexOf("1069,")==-1){
			return "noRight";
		}
		if(t_sys_parameter==null){
			t_sys_parameter = new T_SYS_PARAMETER();
		}
		t_sys_parameter = logService.paramById(t_sys_parameter);
		return "update";
	}
	public String saveParam() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if(session.getAttribute("roles").toString().indexOf("1068,")==-1){
			return "noRight";
		}
		
		logService.save(t_sys_parameter);
		t_sys_parameter.setRecNum(logService.getMaxParamCountNum(t_sys_parameter));
		t_sys_parameter.setData(logService.params(t_sys_parameter));
		return "list";
	}
	public String updateParam() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if(session.getAttribute("roles").toString().indexOf("1069,")==-1){
			return "noRight";
		}
//		userGroupService.deleteGroup(user_group);
		t_sys_parameter.setRecNum(logService.getMaxParamCountNum(t_sys_parameter));
		t_sys_parameter.setData(logService.update(t_sys_parameter));
		return "list";
	}
	public String deleteParam() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if(session.getAttribute("roles").toString().indexOf("1070,")==-1){
			return "noRight";
		}
		t_sys_parameter.setRecNum(logService.getMaxParamCountNum(t_sys_parameter)-1);
		t_sys_parameter.setData(logService.deleteParam(t_sys_parameter));
		return "list";
	}
	public String classes() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if(session.getAttribute("roles").toString().indexOf("1063,")==-1){
			return "noRight";
		}
		if(t_class==null){
			t_class = new t_class();
		}
		t_class.setRecNum(logService.getMaxClassCountNum(t_class));
		t_class.setData(logService.classes(t_class));
		return "list";
	}
	public String toInsertClass() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if(session.getAttribute("roles").toString().indexOf("1064,")==-1){
			return "noRight";
		}
		if(department==null){
			department = new department();
		}
		department.setData(logService.departments(department));
		if(t_sys_parameter==null){
			t_sys_parameter = new T_SYS_PARAMETER();
		}
		t_sys_parameter.setPageSize(100);
		t_sys_parameter.setParameterTypeId("部门");
		t_sys_parameter.setRecNum(logService.getMaxParamCountNum(t_sys_parameter));
		t_sys_parameter.setData(logService.params(t_sys_parameter));
		
		t_sys_parameter.setParameterTypeId("年级");
		t_sys_parameter.setRecNum(logService.getMaxParamCountNum(t_sys_parameter));
		list  = logService.params(t_sys_parameter);
		return "insert";
	}
	public String classById() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if(session.getAttribute("roles").toString().indexOf("1065,")==-1){
			return "noRight";
		}
		if(t_class==null){
			t_class = new t_class();
		}
		if(department==null){
			department = new department();
		}
		department.setData(logService.departments(department));
		if(t_sys_parameter==null){
			t_sys_parameter = new T_SYS_PARAMETER();
		}
		t_sys_parameter.setPageSize(100);
		t_sys_parameter.setParameterTypeId("部门");
		t_sys_parameter.setRecNum(logService.getMaxParamCountNum(t_sys_parameter));
		t_sys_parameter.setData(logService.params(t_sys_parameter));
		
		t_sys_parameter.setParameterTypeId("年级");
		t_sys_parameter.setRecNum(logService.getMaxParamCountNum(t_sys_parameter));
		list  = logService.params(t_sys_parameter);
		t_class = logService.classById(t_class);
		return "update";
	}
	public String saveClass() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if(session.getAttribute("roles").toString().indexOf("1064,")==-1){
			return "noRight";
		}
		logService.save(t_class);
		t_class.setRecNum(logService.getMaxClassCountNum(t_class));
		t_class.setData(logService.classes(t_class));
		return "list";
	}
	public String updateClass() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if(session.getAttribute("roles").toString().indexOf("1065,")==-1){
			return "noRight";
		}
//		userGroupService.deleteGroup(user_group);
		t_class.setRecNum(logService.getMaxClassCountNum(t_class));
		t_class.setData(logService.update(t_class));
		return "list";
	}
	public String deleteClass() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if(session.getAttribute("roles").toString().indexOf("1066,")==-1){
			return "noRight";
		}
		t_class.setRecNum(logService.getMaxClassCountNum(t_class)-1);
		t_class.setData(logService.deleteClass(t_class));
		return "list";
	}
	
	public String classByGradeIdAjax() throws Exception{
		if(t_class==null){
			t_class = new t_class();
		}
		t_class.setGradeId(Integer.valueOf(getRequest().getParameter("gradeId").toString()));
		t_class.setDepartmentId(getRequest().getParameter("departmentId").toString());
		list = logService.classes(t_class);
		return "success";
	}
	
	public String classByClassNumAjax() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = ServletActionContext.getRequest().getSession();
		if(t_class==null){
			t_class = new t_class();
		}
		t_class.setClassNum(Integer.valueOf(request.getParameter("classNum").toString()));
		t_class.setDepartmentId(request.getParameter("departmentId").toString());
		list = logService.classes(t_class);
		return "success";
	}
	public String toXtsz() throws Exception{
		return "list";
	}
	public String toAddDepartment() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if(session.getAttribute("roles").toString().indexOf("1051,")==-1){
			return "noRight";
		}
		return "insert";
	}
	public String saveDepartment() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if(session.getAttribute("roles").toString().indexOf("1051,")==-1){
			return "noRight";
		}
		if(department==null){
			department = new department();
		}
		logService.save(department);
		department.setDepartmentName(null);
		department.setRecNum(logService.getMaxDepartmentsPageCountNum(department));
		department.setData(logService.departmentsPage(department));
		return "listR";
	}
	public String deleteDepartment() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if(session.getAttribute("roles").toString().indexOf("1052,")==-1){
			return "noRight";
		}
		if(department==null){
			department = new department();
		}
		logService.deleteDepartment(department);
		department.setRecNum(logService.getMaxDepartmentsPageCountNum(department));
		department.setData(logService.departmentsPage(department));
		return "listR";
	}
	
	
	public String queryIndex(){
		if(index_edit == null){
			index_edit = new index_edit();
		}
		index_edit = logService.queryIndex(index_edit);
		index_edit.setIndex_src("/jxhd/upload/uploadImg/" + index_edit.getIndex_src());
		return "list";
	}
	
	public String queryIndex1(){
		if(getSession().getAttribute("roles").toString().indexOf("1079,")==-1){
			return "noRight";
		}
		return "list";
	}
	
	private File upload;
	private String uploadFileName;//上传图片名称
	private String uploadContentType;//上传图片类型
	private String savePath;//上传图片保存路径
	
	public String updateIndex(){
		if(getSession().getAttribute("roles").toString().indexOf("1079,")==-1){
			return "noRight";
		}
		if(index_edit == null){
			index_edit = new index_edit();
		}
		String dstPath = getServletContext().getRealPath(this.getSavePath()+"/"+this.getUploadFileName());
		File dstFile = new File(dstPath);
		if(copy(this.upload,dstFile)){
			if(index_edit != null){
				index_edit.setIndex_src(this.getUploadFileName());
				logService.updateIndex(index_edit);
			}
		}
		return "list";
	}
	
	 private static boolean  copy(File src, File dst) {   
	        boolean result=false;   
	        InputStream in = null;   
	        OutputStream out = null;   
	        try {   
	            in = new BufferedInputStream(new FileInputStream(src), BUFFER_SIZE);   
	            out = new BufferedOutputStream(new FileOutputStream(dst),   
	                    BUFFER_SIZE);   
	            byte[] buffer = new byte[BUFFER_SIZE];   
	            int len = 0;   
	            while ((len = in.read(buffer)) > 0) {   
	                out.write(buffer, 0, len);   
	            }   
	            result=true;   
	        } catch (Exception e) {   
	            e.printStackTrace();   
	            result=false;   
	        } finally {   
	            if (null != in) {   
	                try {   
	                    in.close();   
	                } catch (IOException e) {   
	                    e.printStackTrace();   
	                }   
	            }   
	            if (null != out) {   
	                try {   
	                    out.close();   
	                } catch (IOException e) {   
	                    e.printStackTrace();   
	                }   
	            }   
	        }   
	        return result;   
	    }
	public File getUpload() {
		return upload;
	}
	public void setUpload(File upload) {
		this.upload = upload;
	}
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	public String getUploadContentType() {
		return uploadContentType;
	}
	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}
	public String getSavePath() {
		return savePath;
	}
	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}  
	
}
