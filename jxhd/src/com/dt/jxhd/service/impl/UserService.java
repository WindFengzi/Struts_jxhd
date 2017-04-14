package com.dt.jxhd.service.impl;

import java.util.List;

import com.dt.jxhd.commons.service.BaseService;
import com.dt.jxhd.domain.T_SYS_RESOURCE;
import com.dt.jxhd.domain.T_SYS_ROLE;
import com.dt.jxhd.domain.T_SYS_ROLE_RESOURCE;
import com.dt.jxhd.domain.attendance;
import com.dt.jxhd.domain.leave;
import com.dt.jxhd.domain.student_group;
import com.dt.jxhd.domain.t_user;
import com.dt.jxhd.service.iface.IUserService;


public class UserService extends BaseService implements IUserService{

	public t_user login(t_user t_user){
		return (t_user)this.getSingleData("t_user.login",t_user);
	}
	public Object save(t_user t_user){
		return this.insertBySqlAndReturn("t_user.user_insert",t_user);
	}
	//�õ�ĳ�������µ�����ѧ��
	public List users(t_user t_user){
		return (List) this.getListData("t_user.users", t_user);
	}
	//�㵽��ʱ�򣬲�ѯû����ٵ�ѧ��
	public List<t_user> usersNoPage(t_user t_user){
		return (List) this.getListData("t_user.usersNoPage", t_user);
	}
	//�㵽��ʱ�򣬲�ѯ��ٵ�ѧ��
	public List<t_user> usersLeaveNoPage(t_user t_user){
		return (List) this.getListData("t_user.usersLeaveNoPage", t_user);
	}
	public t_user userById(t_user t_user){
		return (t_user) this.getSingleData("t_user.t_user_selectById", t_user);
	}
	public t_user userById1(t_user t_user){
		return (t_user) this.getSingleData("t_user.userById", t_user);
	}
	public Object update(t_user t_user){
		return  (Object)this.updateBySqlAndReturn("t_user.user_update",t_user);
	}
	//����ѧ����¼��
	public int getMaxFileCountNum(t_user t_user){
		Object obj = this.getSingleData("t_user.getUserCountnum",t_user);
		int num = 0;
		if (obj != null) {
			num = ((Integer) obj).intValue();
		}
		return num;
	}
	public void deleteUser(t_user t_user){
		this.deleteBySql("t_user.user_delete",t_user);
	}
	public Object save(student_group student_group){
		return this.insertBySqlAndReturn("student_group.studentGroup_insert",student_group);
	}
	//�õ�ԭ���������ݵ�ѧ��
	public List studentGroups(student_group student_group){
		return (List) this.getListData("student_group.studentGroups", student_group);
	}
	//�����Ѿ����ڵķ���
	public List studentGroups1(student_group student_group){
		return (List) this.getListData("student_group.studentGroups1", student_group);
	}
	//���÷��飬��ԭ���༶�ķ���״̬����
	public Object update(student_group student_group){
		return  (Object)this.updateBySqlAndReturn("student_group.group_update",student_group);
	}
	public Object update1(student_group student_group){
		return  (Object)this.updateBySqlAndReturn("student_group.group_update1",student_group);
	}
	//�õ����ογ̵ı��༶�ϴη����¼����
	public int getMaxFileCountNum(student_group student_group){
		Object obj = this.getSingleData("student_group.getStudentGroupCountnum",student_group);
		int num = 0;
		if (obj != null) {
			num = ((Integer) obj).intValue();
		}
		return num;
	}
	public void deleteStudentGroup(student_group student_group){
		this.deleteBySql("student_group.studentGroup_delete",student_group);
	}
	public List groups(student_group student_group){
		return (List) this.getListData("student_group.groups", student_group);
	}
	public List groupsByName(student_group student_group){
		return (List) this.getListData("student_group.groupsByName", student_group);
	}
	public List attendances(attendance attendance){
		return (List) this.getListData("attendance.attendances", attendance);
	}
	public List kqtj(attendance attendance){
		return (List) this.getListData("attendance.kqtj", attendance);
	}
	public List kqtjClass(attendance attendance){
		return (List) this.getListData("attendance.kqtjClass", attendance);
	}
	public List kqtjSubject(attendance attendance){
		return (List) this.getListData("attendance.kqtjSubject", attendance);
	}
	public List leaves(leave leave){
		return (List) this.getListData("leave.leaves", leave);
	}
	public List leavesDm(leave leave){
		return (List) this.getListData("leave.leavesDm", leave);
	}
	public int getMaxLeaveCountNum(leave leave){
		Object obj = this.getSingleData("leave.getLeaveCountnum",leave);
		int num = 0;
		if (obj != null) {
			num = ((Integer) obj).intValue();
		}
		return num;
	}
	public int getMaxLeaveNum(leave leave){
		Object obj = this.getSingleData("leave.leaveNum",leave);
		int num = 0;
		if (obj != null) {
			num = ((Integer) obj).intValue();
		}
		return num;
	}
	public leave leaveById(leave leave){
		return (leave) this.getSingleData("leave.leaveById", leave);
	}
	public Object update(leave leave){
		return  (Object)this.updateBySqlAndReturn("leave.update_leave",leave);
	}
	public List roles(T_SYS_ROLE t_sys_role){
		return (List) this.getListData("T_SYS_ROLE.Roles", t_sys_role);
	}
	public Object save(T_SYS_ROLE t_sys_role){
		return this.insertBySqlAndReturn("T_SYS_ROLE.role_insert",t_sys_role);
	}
	public T_SYS_ROLE roleById(T_SYS_ROLE T_SYS_ROLE){
		return (T_SYS_ROLE) this.getSingleData("T_SYS_ROLE.roleById", T_SYS_ROLE);
	}
	public Object update(T_SYS_ROLE t_sys_role){
		return  (Object)this.updateBySqlAndReturn("T_SYS_ROLE.role_update",t_sys_role);
	}
	public void deleteRole(T_SYS_ROLE t_sys_role){
		this.deleteBySql("T_SYS_ROLE.role_delete",t_sys_role);
	}
	public List resources(T_SYS_RESOURCE t_sys_resource){
		return (List) this.getListData("T_SYS_RESOURCE.resources", t_sys_resource);
	}
	public Object insertRe(T_SYS_ROLE_RESOURCE t_sys_role_resource){
		return this.insertBySqlAndReturn("T_SYS_ROLE_RESOURCE.insertRe",t_sys_role_resource);
	}
	public void deleteByRoleid(T_SYS_ROLE_RESOURCE t_sys_role_resource){
		this.deleteBySql("T_SYS_ROLE_RESOURCE.deleteByRoleid",t_sys_role_resource);
	}
	public List resourcesByRoleid(T_SYS_ROLE_RESOURCE t_sys_role_resource){
		return this.getListData("T_SYS_ROLE_RESOURCE.resourcesByRoleid",t_sys_role_resource);
	}
	//����ַ����õ�����ѧ��
	@Override
	public List getStudent(t_user t_user) {
		// TODO Auto-generated method stub
		return this.getListData("t_user.getStudent", t_user);
	}
}
