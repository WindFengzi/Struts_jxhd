package com.dt.jxhd.service.impl;

import java.util.List;

import com.dt.jxhd.commons.service.BaseService;
import com.dt.jxhd.domain.T_SYS_LOG;
import com.dt.jxhd.domain.T_SYS_PARAMETER;
import com.dt.jxhd.domain.department;
import com.dt.jxhd.domain.index_edit;
import com.dt.jxhd.domain.t_class;
import com.dt.jxhd.service.iface.ILogService;


public class LogService extends BaseService implements ILogService{

	public List logs(T_SYS_LOG T_SYS_LOG){
		return (List) this.getListData("T_SYS_LOG.logs", T_SYS_LOG);
	}
	public int getMaxLogMaxNum(T_SYS_LOG T_SYS_LOG){
		Object obj = this.getSingleData("T_SYS_LOG.getLogMaxnum",T_SYS_LOG);
		int num = 0;
		if (obj != null) {
			num = ((Integer) obj).intValue();
		}
		return num;
	}
	public int getMaxLogCountNum(T_SYS_LOG T_SYS_LOG){
		Object obj = this.getSingleData("T_SYS_LOG.getLogCountnum",T_SYS_LOG);
		int num = 0;
		if (obj != null) {
			num = ((Integer) obj).intValue();
		}
		return num;
	}
	public List save(T_SYS_LOG T_SYS_LOG){
		this.insertBySqlAndReturn("T_SYS_LOG.log_insert",T_SYS_LOG);
		return (List) this.getListData("T_SYS_LOG.logs", T_SYS_LOG);
	}
	public List params(T_SYS_PARAMETER T_SYS_PARAMETER){
		return (List) this.getListData("T_SYS_PARAMETER.params", T_SYS_PARAMETER);
	}
	public List update(T_SYS_PARAMETER T_SYS_PARAMETER){
		 this.updateBySqlAndReturn("T_SYS_PARAMETER.param_update",T_SYS_PARAMETER);
		 T_SYS_PARAMETER = new T_SYS_PARAMETER();
		return (List) this.getListData("T_SYS_PARAMETER.params", T_SYS_PARAMETER);
	}
	public Object save(T_SYS_PARAMETER T_SYS_PARAMETER){
		return this.insertBySqlAndReturn("T_SYS_PARAMETER.param_insert",T_SYS_PARAMETER);
	}
	public int getMaxParamCountNum(T_SYS_PARAMETER T_SYS_PARAMETER){
		Object obj = this.getSingleData("T_SYS_PARAMETER.getParamCountnum",T_SYS_PARAMETER);
		int num = 0;
		if (obj != null) {
			num = ((Integer) obj).intValue();
		}
		return num;
	}
	public List deleteParam(T_SYS_PARAMETER T_SYS_PARAMETER){
		this.deleteBySql("T_SYS_PARAMETER.param_delete",T_SYS_PARAMETER);
		return (List) this.getListData("T_SYS_PARAMETER.params", T_SYS_PARAMETER);
	}
	public T_SYS_PARAMETER paramById(T_SYS_PARAMETER T_SYS_PARAMETER){
		return (T_SYS_PARAMETER) this.getSingleData("T_SYS_PARAMETER.param_selectById", T_SYS_PARAMETER);
	}
	public List classes(t_class t_class){
		return (List) this.getListData("t_class.classes", t_class);
	}
	public List update(t_class t_class){
		 this.updateBySqlAndReturn("t_class.class_update",t_class);
		 t_class = new t_class();
		return (List) this.getListData("t_class.classes", t_class);
	}
	public Object save(t_class t_class){
		return this.insertBySqlAndReturn("t_class.class_insert",t_class);
	}
	public int getMaxClassCountNum(t_class t_class){
		Object obj = this.getSingleData("t_class.getClassCountnum",t_class);
		int num = 0;
		if (obj != null) {
			num = ((Integer) obj).intValue();
		}
		return num;
	}
	public List deleteClass(t_class t_class){
		this.deleteBySql("t_class.class_delete",t_class);
		return (List) this.getListData("t_class.classes", t_class);
	}
	public t_class classById(t_class t_class){
		return (t_class) this.getSingleData("t_class.class_selectById", t_class);
	}
	public department departmentById(department department){
		return (department) this.getSingleData("department.departmentById", department);
	}
	
	//得到部门
	@SuppressWarnings("unchecked")
	public List<department> departments(department department){
		return ((List<department>) this.getListData("department.departments", department));
	}
	
	public List departmentsByParentId(department department){
		return (List) this.getListData("department.departmentsByParentId", department);
	}
	public List departmentsPage(department department){
		return (List) this.getListData("department.departmentsPage", department);
	}
	public int getMaxDepartmentsPageCountNum(department department){
		Object obj = this.getSingleData("department.departmentsPageNum",department);
		int num = 0;
		if (obj != null) {
			num = ((Integer) obj).intValue();
		}
		return num;
	}
	public Object save(department department){
		return this.insertBySqlAndReturn("department.department_insert",department);
	}
	public List deleteDepartment(department department){
		this.deleteBySql("department.department_delete",department);
		return (List) this.getListData("department.departmentsPageNum", department);
	}
	//查询首页图片
	@Override
	public index_edit queryIndex(index_edit index_edit) {
		// TODO Auto-generated method stub
		 return (index_edit) this.getSingleData("index_edit.query_index", index_edit);
	}
	//更新首页图片
	@Override
	public Object updateIndex(index_edit index_edit) {
		// TODO Auto-generated method stub
		return this.updateBySqlAndReturn("index_edit.update_index",index_edit);
	}
	
}
