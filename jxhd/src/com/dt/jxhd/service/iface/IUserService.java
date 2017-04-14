package com.dt.jxhd.service.iface;

import java.util.List;

import com.dt.jxhd.domain.T_SYS_RESOURCE;
import com.dt.jxhd.domain.T_SYS_ROLE;
import com.dt.jxhd.domain.T_SYS_ROLE_RESOURCE;
import com.dt.jxhd.domain.attendance;
import com.dt.jxhd.domain.leave;
import com.dt.jxhd.domain.student_group;
import com.dt.jxhd.domain.t_user;



public interface IUserService {

	public t_user login(t_user t_user);//用户登录
	public Object save(t_user t_user);
	//得到某个部门下的所有学生
	public List users(t_user t_user);
	public t_user userById(t_user t_user);
	public Object update(t_user t_user);
	//查找学生的记录数
	public int getMaxFileCountNum(t_user t_user);
	public void deleteUser(t_user t_user);
	public Object save(student_group student_group);
	//得到原来分组数据的学生
	public List studentGroups(student_group student_group);
	//得到所有分组是本班级的上次分组
	public int getMaxFileCountNum(student_group student_group);
	public void deleteStudentGroup(student_group student_group);
	public List groups(student_group student_group);
	public List attendances(attendance attendance);
	//点到的时候，查询没有请假的学生
	public List<t_user> usersNoPage(t_user t_user);
	public List leaves(leave leave);
	public List leavesDm(leave leave);
	public int getMaxLeaveCountNum(leave leave);
	public leave leaveById(leave leave);
	public Object update(leave leave);
	//重置分组，将原来班级的分组状态清零
	public Object update(student_group student_group);
	public List kqtj(attendance attendance);
	public int getMaxLeaveNum(leave leave);
	public List groupsByName(student_group student_group);
	public List kqtjClass(attendance attendance);
	public List kqtjSubject(attendance attendance);
	public t_user userById1(t_user t_user);
	//得到存在分组人数
	public List studentGroups1(student_group student_group);
	public Object update1(student_group student_group);
	//点名的时候，查询请假的学生
	public List<t_user> usersLeaveNoPage(t_user t_user);
	public List roles(T_SYS_ROLE t_sys_role);
	public Object save(T_SYS_ROLE t_sys_role);
	public Object update(T_SYS_ROLE t_sys_role);
	public T_SYS_ROLE roleById(T_SYS_ROLE T_SYS_ROLE);
	public void deleteRole(T_SYS_ROLE t_sys_role);
	public List resources(T_SYS_RESOURCE t_sys_resource);
	public Object insertRe(T_SYS_ROLE_RESOURCE t_sys_role_resource);
	public void deleteByRoleid(T_SYS_ROLE_RESOURCE t_sys_role_resource);
	public List resourcesByRoleid(T_SYS_ROLE_RESOURCE t_sys_role_resource);
	//错发分发，获得单个学生
	public List getStudent(t_user t_user);
}
