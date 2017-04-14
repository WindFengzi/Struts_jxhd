package com.dt.jxhd.service.iface;

import java.util.List;

import com.dt.jxhd.domain.T_SYS_LOG;
import com.dt.jxhd.domain.T_SYS_PARAMETER;
import com.dt.jxhd.domain.department;
import com.dt.jxhd.domain.index_edit;
import com.dt.jxhd.domain.t_class;




public interface ILogService {

	public int getMaxLogMaxNum(T_SYS_LOG T_SYS_LOG);
	public List save(T_SYS_LOG T_SYS_LOG);
	public List logs(T_SYS_LOG T_SYS_LOG);
	public int getMaxLogCountNum(T_SYS_LOG T_SYS_LOG);
	public List params(T_SYS_PARAMETER T_SYS_PARAMETER);
	public List update(T_SYS_PARAMETER T_SYS_PARAMETER);
	public Object save(T_SYS_PARAMETER T_SYS_PARAMETER);
	public int getMaxParamCountNum(T_SYS_PARAMETER T_SYS_PARAMETER);
	public List deleteParam(T_SYS_PARAMETER T_SYS_PARAMETER);
	public T_SYS_PARAMETER paramById(T_SYS_PARAMETER T_SYS_PARAMETER);
	public List classes(t_class t_class);
	public List update(t_class t_class);
	public Object save(t_class t_class);
	public int getMaxClassCountNum(t_class t_class);
	public List deleteClass(t_class t_class);
	public t_class classById(t_class t_class);
	//得到部门
	public List<department> departments(department department);
	public List departmentsPage(department department);
	public int getMaxDepartmentsPageCountNum(department department);
	public Object save(department department);
	public List deleteDepartment(department department);
	public List departmentsByParentId(department department);
	public department departmentById(department department);
	
	public index_edit queryIndex(index_edit index_edit);//查询首页
	public Object updateIndex(index_edit index_edit);
}
