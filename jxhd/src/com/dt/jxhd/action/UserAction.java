package com.dt.jxhd.action;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.InterruptedIOException;
import java.io.OutputStream;
import java.net.ConnectException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.NoRouteToHostException;
import java.net.Socket;
import java.net.UnknownHostException;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.ServletActionContext;

import test.MyThread;

import com.dt.jxhd.domain.T_SYS_PARAMETER;
import com.dt.jxhd.domain.T_SYS_RESOURCE;
import com.dt.jxhd.domain.T_SYS_ROLE;
import com.dt.jxhd.domain.T_SYS_ROLE_RESOURCE;
import com.dt.jxhd.domain.attendance;
import com.dt.jxhd.domain.course;
import com.dt.jxhd.domain.department;
import com.dt.jxhd.domain.leave;
import com.dt.jxhd.domain.student;
import com.dt.jxhd.domain.student_group;
import com.dt.jxhd.domain.t_class;
import com.dt.jxhd.domain.t_course_log;
import com.dt.jxhd.domain.t_user;
import com.dt.jxhd.domain.teacher;
import com.dt.jxhd.domain.userDetail;
import com.dt.jxhd.service.iface.ICourseService;
import com.dt.jxhd.service.iface.ILogService;
import com.dt.jxhd.service.iface.IUserDetailService;
import com.dt.jxhd.service.iface.IUserService;

public class UserAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	private File[] upload;
	private File[] fjupload;
	// 用String数组来封装多个上传文件名
	private String[] uploadFileName;
	// 用String数组来封装多个上传文件类型
	private String[] uploadContentType;
	// 保存文件的目录路径(通过依赖注入)
	private String savePath;

	public File[] getUpload() {
		return upload;
	}

	public void setUpload(File[] upload) {
		this.upload = upload;
	}

	public File[] getFjupload() {
		return fjupload;
	}

	public void setFjupload(File[] fjupload) {
		this.fjupload = fjupload;
	}

	public String[] getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String[] uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public String[] getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String[] uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public String getSavePath() {
		return savePath;
	}

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

	private IUserService userService;

	public void setUserService(IUserService userService) {
		this.userService = userService;
	}

	private List userlist;

	public List getUserlist() {
		return userlist;
	}

	public void setUserlist(List userlist) {
		this.userlist = userlist;
	}

	private String msg;

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	private t_user t_user1;

	public t_user getT_user1() {
		return t_user1;
	}

	public void setT_user1(t_user t_user1) {
		this.t_user1 = t_user1;
	}

	private userDetail userDetail;

	public userDetail getUserDetail() {
		return userDetail;
	}

	public void setUserDetail(userDetail userDetail) {
		this.userDetail = userDetail;
	}

	private IUserDetailService userDetailService;

	public void setUserDetailService(IUserDetailService userDetailService) {
		this.userDetailService = userDetailService;
	}

	private T_SYS_PARAMETER t_sys_parameter;

	public T_SYS_PARAMETER getT_sys_parameter() {
		return t_sys_parameter;
	}

	public void setT_sys_parameter(T_SYS_PARAMETER t_sys_parameter) {
		this.t_sys_parameter = t_sys_parameter;
	}

	private ILogService logService;

	public void setLogService(ILogService logService) {
		this.logService = logService;
	}

	private teacher teacher;

	public teacher getTeacher() {
		return teacher;
	}

	public void setTeacher(teacher teacher) {
		this.teacher = teacher;
	}

	private student student;

	public student getStudent() {
		return student;
	}

	public void setStudent(student student) {
		this.student = student;
	}

	private student_group studentGroup;

	public student_group getStudentGroup() {
		return studentGroup;
	}

	public void setStudentGroup(student_group studentGroup) {
		this.studentGroup = studentGroup;
	}

	private ICourseService courseService;

	public void setCourseService(ICourseService courseService) {
		this.courseService = courseService;
	}

	private t_course_log t_course_log;

	public t_course_log getT_course_log() {
		return t_course_log;
	}

	public void setT_course_log(t_course_log t_course_log) {
		this.t_course_log = t_course_log;
	}

	private attendance attendance;

	public attendance getAttendance() {
		return attendance;
	}

	public void setAttendance(attendance attendance) {
		this.attendance = attendance;
	}

	private int yidao;
	private int weidao;
	private int qingjia;

	public int getYidao() {
		return yidao;
	}

	public void setYidao(int yidao) {
		this.yidao = yidao;
	}

	public int getWeidao() {
		return weidao;
	}

	public void setWeidao(int weidao) {
		this.weidao = weidao;
	}

	public int getQingjia() {
		return qingjia;
	}

	public void setQingjia(int qingjia) {
		this.qingjia = qingjia;
	}

	private department department;

	public department getDepartment() {
		return department;
	}

	public void setDepartment(department department) {
		this.department = department;
	}

	private t_class tClass;

	public t_class getTClass() {
		return tClass;
	}

	public void setTClass(t_class class1) {
		tClass = class1;
	}

	private List list;
	private List list1;

	public List getList1() {
		return list1;
	}

	public void setList1(List list1) {
		this.list1 = list1;
	}

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}

	private leave leave;

	public leave getLeave() {
		return leave;
	}

	public void setLeave(leave leave) {
		this.leave = leave;
	}

	private T_SYS_RESOURCE t_sys_resource;

	public T_SYS_RESOURCE getT_sys_resource() {
		return t_sys_resource;
	}

	public void setT_sys_resource(T_SYS_RESOURCE t_sys_resource) {
		this.t_sys_resource = t_sys_resource;
	}

	private T_SYS_ROLE_RESOURCE t_sys_role_resource;

	public T_SYS_ROLE_RESOURCE getT_sys_role_resource() {
		return t_sys_role_resource;
	}

	public void setT_sys_role_resource(T_SYS_ROLE_RESOURCE t_sys_role_resource) {
		this.t_sys_role_resource = t_sys_role_resource;
	}

	private T_SYS_ROLE t_sys_role;

	public T_SYS_ROLE getT_sys_role() {
		return t_sys_role;
	}

	public void setT_sys_role(T_SYS_ROLE t_sys_role) {
		this.t_sys_role = t_sys_role;
	}

	private List comList;

	public List getComList() {
		return comList;
	}

	public void setComList(List comList) {
		this.comList = comList;
	}

	private T_SYS_RESOURCE T_SYS_RESOURCE;

	public T_SYS_RESOURCE getT_SYS_RESOURCE() {
		return T_SYS_RESOURCE;
	}

	public void setT_SYS_RESOURCE(T_SYS_RESOURCE t_sys_resource) {
		T_SYS_RESOURCE = t_sys_resource;
	}

	/*
	 * 作者:李慎华 修改时间:2010-03-31 说明：登录
	 */
	public String Gologin() throws Exception {

		if (t_user1 != null) {
			t_user1 = userService.login(t_user1);
			if (t_user1 == null) {
				msg = "用户名密码不正确！";
				return "login";
			} else if (t_user1.getLoginName() == null) {
				msg = "用户名密码不正确！";
				return "login";
			} /*else if (isPastT()) { 导致登录慢的原因
				msg = "本系统已到期，请和开发商联系！";
				return "login";
			}*/
			HttpSession session = ServletActionContext.getRequest().getSession();
			session.setAttribute("userId", t_user1.getUserId());
			session.setAttribute("login", t_user1.getLoginName());
			session.setAttribute("pwd", t_user1.getPwd());
			session.setAttribute("userName", t_user1.getName());
			session.setAttribute("classId", t_user1.getClassId());//用户所在班级id，计算机科学与技术A班
			session.setAttribute("departmentId", t_user1.getDepartmentId());//用户部门id（计算机科学与技术）
			session.setAttribute("roleId", t_user1.getRoleId());
			session.setAttribute("roles", t_user1.getRev1());//似乎没有什么用处
	
			//判断是否是记住密码，如果remember不为空，就存入cookie中
			String remember = ServletActionContext.getRequest().getParameter("remember");
			if(remember!= null){
				Cookie cookie = new Cookie("user_password",t_user1.getLoginName()+"."+t_user1.getPwd());
				cookie.setMaxAge(6000000);
				ServletActionContext.getResponse().addCookie(cookie);
			}
		}
		return "index";
	}

	//学生管理
	public String users() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if (session.getAttribute("roles").toString().indexOf("1005,") == -1) {
			return "noRight";
		}
		if (t_user1 == null) {
			t_user1 = new t_user();
		}
		//查找学生的数目
		t_user1.setRecNum(userService.getMaxFileCountNum(t_user1));
		//将学生全部设置到Data数据中，获取前10条数据
		t_user1.setData(userService.users(t_user1));

		if (department == null) {
			department = new department();
		}
		//查询所有部门的数据
		department.setData(logService.departments(department));
		//班级数据
		t_class t_class = new t_class();
		t_class.setPageSize(100);
		//有多少个专业
		t_class.setRecNum(logService.getMaxClassCountNum(t_class));
		//专业的全部信息，部门，班级，名称，等
		userlist = logService.classes(t_class);

		if (t_user1.getIsTeacher() == 1) {
			return "teacherList";
		} else {
			return "studentList";
		}
	}
	

	public String usersR() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if (session.getAttribute("roles").toString().indexOf("1005,") == -1) {
			return "noRight";
		}
		if (t_user1 == null) {
			t_user1 = new t_user();
		}
		t_user1.setRecNum(userService.getMaxFileCountNum(t_user1));
		t_user1.setData(userService.users(t_user1));

		if (t_user1.getIsTeacher() == 1) {
			return "teacherList";
		} else {
			return "studentList";
		}
	}

	public String userSave() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if (session.getAttribute("roles").toString().indexOf("1006,") == -1) {
			return "noRight";
		}
		if (tClass == null) {
			tClass = new t_class();
		}
		if (t_user1 != null) {
			tClass.setGradeId(t_user1.getGradeId());
		}
		tClass.setDepartmentId(String.valueOf(t_course_log.getClassId()));
		list = courseService.classByDepartmentId(tClass);
		userService.save(t_user1);
		t_user1.setRecNum(userService.getMaxFileCountNum(t_user1));
		t_user1.setData(userService.users(t_user1));

		if (t_sys_parameter == null) {
			t_sys_parameter = new T_SYS_PARAMETER();
		}
		t_sys_parameter.setPageSize(100);
		t_sys_parameter.setParameterTypeId("年级");
		t_sys_parameter.setRecNum(logService
				.getMaxParamCountNum(t_sys_parameter));
		t_sys_parameter.setData(logService.params(t_sys_parameter));
		if (t_user1.getIsTeacher() == 1) {
			return "teacherList";
		} else {
			return "studentList";
		}
	}
	//编辑单个用户
	public String userById() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if (session.getAttribute("roles").toString().indexOf("1007,") == -1) {
			return "noRight";
		}
		t_user t_user2 = new t_user();
		t_user2 = t_user1;
		//得到编辑的用户
		t_user1 = userService.userById(t_user1);
		if (t_sys_parameter == null) {
			t_sys_parameter = new T_SYS_PARAMETER();
		}
		//得到职称
		t_sys_parameter.setPageSize(100);
		t_sys_parameter.setParameterTypeId("职称");
		t_sys_parameter.setRecNum(logService.getMaxParamCountNum(t_sys_parameter));
		t_sys_parameter.setData(logService.params(t_sys_parameter));
		//得到年级
		t_sys_parameter.setPageSize(100);
		t_sys_parameter.setParameterTypeId("年级");
		t_sys_parameter.setRecNum(logService.getMaxParamCountNum(t_sys_parameter));
		list1 = logService.params(t_sys_parameter);
		// if(t_user1==null){
		// t_user1 = userService.userById1(t_user2);
		// }
		if (department == null) {
			department = new department();
		}
		//得到部门
		department.setData(logService.departments(department));
		if (tClass == null) {
			tClass = new t_class();
		}
		if (t_user1 != null) {
			tClass.setGradeId(t_user1.getGradeId());
		}
		// if(t_user1.getDepartmentId()!=null)
		t_course_log.setClassId(Integer.valueOf(t_user1.getDepartmentId()));
		tClass.setDepartmentId(t_user1.getDepartmentId());
		list = courseService.classByDepartmentId(tClass);
		//得到角色
		if (t_sys_role == null) {
			t_sys_role = new T_SYS_ROLE();
		}
		userlist = userService.roles(t_sys_role);

		if (t_user1.getIsTeacher() == 1) {
			return "teacherUpdate";
		} else {
			return "studentUpdate";
		}
	}

	public String checkUsernameAjax() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		if (t_user1 == null) {
			t_user1 = new t_user();
		}
		t_user1.setLoginName(request.getParameter("loginName").toString());
		t_user1 = userService.userById1(t_user1);
		if (t_user1 != null) {
			msg = "true";
		} else {
			msg = "false";
		}
		return "success";
	}

	/**
	 * 根据班级ID查询该班的学生
	 * @author Hman
	 * @date 2016/11/11
	 * */
	public String studentByClassIdAjax() {
//		HttpServletRequest request = ServletActionContext.getRequest();
		if (t_user1 == null) {
			t_user1 = new t_user();
		}
		t_user1.setClassId(Integer.valueOf(getRequest().getParameter("classId").toString()));
		list1 = userService.getStudent(t_user1);
		return "success";
	}
	
	public String toInsertUser() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if (session.getAttribute("roles").toString().indexOf("1006,") == -1) {
			return "noRight";
		}
		if (t_sys_parameter == null) {
			t_sys_parameter = new T_SYS_PARAMETER();
		}
		t_sys_parameter.setPageSize(100);
		t_sys_parameter.setParameterTypeId("职称");
		t_sys_parameter.setRecNum(logService
				.getMaxParamCountNum(t_sys_parameter));
		t_sys_parameter.setData(logService.params(t_sys_parameter));

		t_sys_parameter.setPageSize(100);
		t_sys_parameter.setParameterTypeId("年级");
		t_sys_parameter.setRecNum(logService
				.getMaxParamCountNum(t_sys_parameter));
		list1 = logService.params(t_sys_parameter);
		if (department == null) {
			department = new department();
		}
		department.setDepartmentId(t_course_log.getClassId());
		department = logService.departmentById(department);
		department.setParentDepartmentId(null);
		department.setData(logService.departments(department));
		if (t_user1 == null) {
			t_user1 = new t_user();
		}
		t_user1.setDepartmentId(String.valueOf(t_course_log.getClassId()));
		if (tClass == null) {
			tClass = new t_class();
		}
		if (t_user1 != null) {
			tClass.setGradeId(t_user1.getGradeId());
		}
		tClass.setDepartmentId(String.valueOf(t_course_log.getClassId()));
		list = courseService.classByDepartmentId(tClass);

		if (t_sys_role == null) {
			t_sys_role = new T_SYS_ROLE();
		}
		userlist = userService.roles(t_sys_role);

		if (t_user1.getIsTeacher() == 1) {
			return "teacherInsert";
		} else {
			return "studentInsert";
		}
	}

	public String updateUser() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if (session.getAttribute("roles").toString().indexOf("1007,") == -1) {
			return "noRight";
		}
		if (tClass == null) {
			tClass = new t_class();
		}
		if (t_user1 != null) {
			tClass.setGradeId(t_user1.getGradeId());
		}
		tClass.setDepartmentId(String.valueOf(t_course_log.getClassId()));
		list = courseService.classByDepartmentId(tClass);
		t_user1.setDepartmentId(String.valueOf(t_course_log.getClassId()));
		userService.update(t_user1);
		t_user1.setRecNum(userService.getMaxFileCountNum(t_user1));
		t_user1.setData(userService.users(t_user1));

		if (t_sys_parameter == null) {
			t_sys_parameter = new T_SYS_PARAMETER();
		}
		t_sys_parameter.setPageSize(100);
		t_sys_parameter.setParameterTypeId("年级");
		t_sys_parameter.setRecNum(logService
				.getMaxParamCountNum(t_sys_parameter));
		t_sys_parameter.setData(logService.params(t_sys_parameter));
		if (t_user1.getIsTeacher() == 1) {
			return "teacherList";
		} else {
			return "studentList";
		}
	}

	public String deleteUser() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if (session.getAttribute("roles").toString().indexOf("1008,") == -1) {
			return "noRight";
		}
		if (tClass == null) {
			tClass = new t_class();
		}
		if (t_user1 != null) {
			tClass.setGradeId(t_user1.getGradeId());
		}
		tClass.setDepartmentId(String.valueOf(t_course_log.getClassId()));
		list = courseService.classByDepartmentId(tClass);
		userService.deleteUser(t_user1);
		t_user1.setDepartmentId(String.valueOf(t_course_log.getClassId()));
		t_user1.setRecNum(userService.getMaxFileCountNum(t_user1));
		t_user1.setData(userService.users(t_user1));

		if (t_sys_parameter == null) {
			t_sys_parameter = new T_SYS_PARAMETER();
		}
		t_sys_parameter.setPageSize(100);
		t_sys_parameter.setParameterTypeId("年级");
		t_sys_parameter.setRecNum(logService
				.getMaxParamCountNum(t_sys_parameter));
		t_sys_parameter.setData(logService.params(t_sys_parameter));
		if (t_user1.getIsTeacher() == 1) {
			return "teacherList";
		} else {
			return "studentList";
		}
	}

	public String deletePlUser() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if (session.getAttribute("roles").toString().indexOf("1008,") == -1) {
			return "noRight";
		}
		if (tClass == null) {
			tClass = new t_class();
		}
		if (t_user1 != null) {
			tClass.setGradeId(t_user1.getGradeId());
		}
		tClass.setDepartmentId(String.valueOf(t_course_log.getClassId()));
		list = courseService.classByDepartmentId(tClass);
		String ids[] = t_user1.getType().split(",");
		for (int i = 0; i < ids.length; i++) {
			t_user t_user2 = new t_user();
			t_user2.setUserId(Integer.valueOf(ids[i]));
			userService.deleteUser(t_user2);
		}
		msg = "删除成功！";
		t_user1.setDepartmentId(String.valueOf(t_course_log.getClassId()));
		t_user1.setRecNum(userService.getMaxFileCountNum(t_user1));
		t_user1.setData(userService.users(t_user1));

		if (t_sys_parameter == null) {
			t_sys_parameter = new T_SYS_PARAMETER();
		}
		t_sys_parameter.setPageSize(100);
		t_sys_parameter.setParameterTypeId("年级");
		t_sys_parameter.setRecNum(logService
				.getMaxParamCountNum(t_sys_parameter));
		t_sys_parameter.setData(logService.params(t_sys_parameter));
		if (t_user1.getIsTeacher() == 1) {
			return "teacherList";
		} else {
			return "studentList";
		}
	}
	//设置学生分组
	public String studentGroups() throws Exception {
		if (getSession().getAttribute("roles").toString().indexOf("1035,") == -1) {
			return "noRight";
		}
		if (studentGroup == null) {
			studentGroup = new student_group();
		}
		//得到正在上的课程
		t_course_log t_course_log = new t_course_log();
		t_course_log.setUserId(Integer.valueOf(getSession().getAttribute("userId").toString()));
		t_course_log = courseService.courseLogNew(t_course_log);
		//得到正在上课的原来分组
		studentGroup.setClassId(t_course_log.getClassId());
		studentGroup.setGroupStatus("0");
		//得到正在上课原来分组的记录
		studentGroup.setRecNum(userService.getMaxFileCountNum(studentGroup));
		//得到正在上课原来分组记录的数据
		studentGroup.setData(userService.studentGroups(studentGroup));
		return "list";
	}
	
	//保存重置的分组
	public String groupSave() throws Exception {
		if (getSession().getAttribute("roles").toString().indexOf("1036,") == -1) {
			return "noRight";
		}
		if(studentGroup == null){
			studentGroup = new student_group();
		}
		//得到正在上的课程
		t_course_log t_course_log = new t_course_log();
		t_course_log.setUserId(Integer.valueOf(getSession().getAttribute("userId").toString()));
		t_course_log = courseService.courseLogNew(t_course_log);
		studentGroup.setClassId(t_course_log.getClassId());
		userService.update(studentGroup);
		String studentIds = studentGroup.getStudentId();//zu1;zu1_6188;zu2;zu2_6191;zu3;zu3_6194;zu3_6460;
		String groupId = "";
		String studentId = "";
	
		if (!studentIds.equals("")) {
			String ss[] = studentIds.split(";");
			for (int i = 0; i < ss.length; i++) {
				if (ss[i].contains("zu") && !ss[i].contains("_")) {
					groupId = ss[i].substring(2, ss[i].length());//得到组号
				}
				if (ss[i].contains("_")) {
					String uu[] = ss[i].split("_");
					studentId = uu[1];
					studentGroup.setStudentId(studentId);
					studentGroup.setClassId(t_course_log.getClassId());
					studentGroup.setGroupName(Integer.valueOf(groupId));
					studentGroup.setCreateTime(new Date());
					studentGroup.setGroupStatus("0");
					userService.save(studentGroup);
				}
			}
		}
		studentGroup.setRecNum(userService.getMaxFileCountNum(studentGroup));
		studentGroup.setData(userService.studentGroups(studentGroup));
		return "list";
	}
	//保存更新的学生分组
	public String groupUpdate() throws Exception {
		if (getSession().getAttribute("roles").toString().indexOf("1037,") == -1) {
			return "noRight";
		}
		//现在的上课信息
		t_course_log t_course_log = new t_course_log();
		t_course_log.setUserId(Integer.valueOf(getSession().getAttribute("userId").toString()));
		t_course_log = courseService.courseLogNew(t_course_log);
		studentGroup.setClassId(t_course_log.getClassId());
		userService.update(studentGroup);
		String studentIds = studentGroup.getStudentId();
		String groupId = "";
		String studentId = "";
		if (!studentIds.equals("")) {
			String ss[] = studentIds.split(";");
			for (int i = 0; i < ss.length; i++) {
				if (ss[i].contains("zu") && !ss[i].contains("_")) {
					groupId = ss[i].substring(2, ss[i].length());
				}
				if (ss[i].contains("_")) {
					String uu[] = ss[i].split("_");
					studentId = uu[1];
					studentGroup.setStudentId(studentId);
					studentGroup.setClassId(t_course_log.getClassId());//保存现在所在上的班级
					studentGroup.setGroupName(Integer.valueOf(groupId));
					studentGroup.setCreateTime(new Date());
					studentGroup.setGroupStatus("0");
					userService.save(studentGroup);
				}
			}
		}

		studentGroup.setRecNum(userService.getMaxFileCountNum(studentGroup));
		studentGroup.setData(userService.studentGroups(studentGroup));
		return "list";
	}
	
	
	//设置学生分组(错题)
		public String studentGroupsError() throws Exception {
			if (getSession().getAttribute("roles").toString().indexOf("1035,") == -1) {
				return "noRight";
			}
			if (studentGroup == null) {
				studentGroup = new student_group();
			}
			//得到正在上的课程
			t_course_log t_course_log = new t_course_log();
			t_course_log.setUserId(Integer.valueOf(getSession().getAttribute("userId").toString()));
			t_course_log = courseService.courseLogNew(t_course_log);
			//得到正在上课的原来分组
			studentGroup.setClassId(t_course_log.getClassId());
			studentGroup.setGroupStatus("0");
			//得到正在上课原来分组的记录
			studentGroup.setRecNum(userService.getMaxFileCountNum(studentGroup));
			//得到正在上课原来分组记录的数据
			studentGroup.setData(userService.studentGroups(studentGroup));
			
			return "list";
		}
		
		//保存重置的分组(错题)
		public String groupSaveError() throws Exception {
			if (getSession().getAttribute("roles").toString().indexOf("1036,") == -1) {
				return "noRight";
			}
			if(studentGroup == null){
				studentGroup = new student_group();
			}
			//得到正在上的课程
			t_course_log t_course_log = new t_course_log();
			t_course_log.setUserId(Integer.valueOf(getSession().getAttribute("userId").toString()));
			t_course_log = courseService.courseLogNew(t_course_log);
			studentGroup.setClassId(t_course_log.getClassId());
			userService.update(studentGroup);
			String studentIds = studentGroup.getStudentId();//zu1;zu1_6188;zu2;zu2_6191;zu3;zu3_6194;zu3_6460;
			String groupId = "";
			String studentId = "";
		
			if (!studentIds.equals("")) {
				String ss[] = studentIds.split(";");
				for (int i = 0; i < ss.length; i++) {
					if (ss[i].contains("zu") && !ss[i].contains("_")) {
						groupId = ss[i].substring(2, ss[i].length());//得到组号
					}
					if (ss[i].contains("_")) {
						String uu[] = ss[i].split("_");
						studentId = uu[1];
						studentGroup.setStudentId(studentId);
						studentGroup.setClassId(t_course_log.getClassId());
						studentGroup.setGroupName(Integer.valueOf(groupId));
						studentGroup.setCreateTime(new Date());
						studentGroup.setGroupStatus("0");
						userService.save(studentGroup);
					}
				}
			}
			studentGroup.setRecNum(userService.getMaxFileCountNum(studentGroup));
			studentGroup.setData(userService.studentGroups(studentGroup));
			return "list";
		}
		//保存更新的学生分组(错题)
		public String groupUpdateError() throws Exception {
			if (getSession().getAttribute("roles").toString().indexOf("1037,") == -1) {
				return "noRight";
			}
			//现在的上课信息
			t_course_log t_course_log = new t_course_log();
			t_course_log.setUserId(Integer.valueOf(getSession().getAttribute("userId").toString()));
			t_course_log = courseService.courseLogNew(t_course_log);
			studentGroup.setClassId(t_course_log.getClassId());
			userService.update(studentGroup);
			String studentIds = studentGroup.getStudentId();
			String groupId = "";
			String studentId = "";
			if (!studentIds.equals("")) {
				String ss[] = studentIds.split(";");
				for (int i = 0; i < ss.length; i++) {
					if (ss[i].contains("zu") && !ss[i].contains("_")) {
						groupId = ss[i].substring(2, ss[i].length());
					}
					if (ss[i].contains("_")) {
						String uu[] = ss[i].split("_");
						studentId = uu[1];
						studentGroup.setStudentId(studentId);
						studentGroup.setClassId(t_course_log.getClassId());//保存现在所在上的班级
						studentGroup.setGroupName(Integer.valueOf(groupId));
						studentGroup.setCreateTime(new Date());
						studentGroup.setGroupStatus("0");
						userService.save(studentGroup);
					}
				}
			}

			studentGroup.setRecNum(userService.getMaxFileCountNum(studentGroup));
			studentGroup.setData(userService.studentGroups(studentGroup));
			return "list";
		}
	
	//点名
	public String dianmAjax() throws Exception {
		if (getSession().getAttribute("roles").toString().indexOf("1013,") == -1) {
			return "noRight";
		}
		String rand = getSession().getAttribute("rand").toString();//从session中得到验证码
		t_course_log = new t_course_log();
		//将点名的老师设置进去
		t_course_log.setUserId(Integer.valueOf(getSession().getAttribute("userId").toString()));//因为getAttribute()得到Object,Object.toString,然后再转成Integer
		t_course_log = courseService.courseLogNew(t_course_log);
		if (t_user1 == null) {
			t_user1 = new t_user();
		}
		t_user1.setClassId(t_course_log.getClassId());
		t_user1.setPageSize(1000);
		t_user1.setBeginTime(new Date());
		//点到的时候，查询请假的学生
		List<t_user> list1 = userService.usersLeaveNoPage(t_user1);
		String userIds = "";
		for (int i = 0; i < list1.size(); i++) {
			t_user t_user2 = (t_user) list1.get(i);
			userIds = userIds + t_user2.getUserId() + ",";
		}
		if (!userIds.equals("")) {
			userIds = userIds.substring(0, userIds.length() - 1);
		}
		t_user1.setSpeciality(userIds);//将userIds设置进入特长，没用到
		//点到的时候，查询没有请假的学生
		List<t_user> list = userService.usersNoPage(t_user1);
		String ip = "";
		//给没有请假的学生发送命令
		for (int i = 0; i < list.size(); i++) {
			t_user1 = (t_user) list.get(i);
			if (t_user1.getIp() != null && !t_user1.getIp().equals("")) {
				ip = t_user1.getIp();
				System.out.println("ip=====" + ip);
				if (rand != null) {
					MyThread mt = new MyThread(ip, 9990, "cmd_point," + rand);//创建MyThread
					mt.start();
				}
			}
		}
		msg = "发送成功。";
		return "success";
	}
	//点名查看签到
	public String dianmUsers() throws Exception {
		if (getSession().getAttribute("roles").toString().indexOf("1013,") == -1) {
			return "noRight";
		}
		t_course_log = new t_course_log();
		t_course_log.setUserId(Integer.valueOf(getSession().getAttribute("userId").toString()));
		t_course_log.setBeginTime(new Date());
		t_course_log = courseService.courseLogNew(t_course_log);
		msg = "notnull";
		if (t_course_log != null) {
			Date date1 = t_course_log.getFromTime();
			Date date2 = t_course_log.getEndTime();
			Date date = new Date();
			//在上课的时间段之内都可以点名
			if (date1.getTime() < date.getTime()&& date2.getTime() > date.getTime()) {
				if (t_user1 == null) {
					t_user1 = new t_user();
				}
				t_user1.setClassId(t_course_log.getClassId());
				t_user1.setPageSize(1000);
				t_user1.setIsTeacher(0);
				t_user1.setData(userService.users(t_user1));

				course course = new course();
				course.setCourceId(t_course_log.getCourseId());
				course = courseService.courseById(course);
				if (attendance == null) {
					attendance = new attendance();
				}
				attendance.setPageSize(1000);
				if (course != null) {
					attendance.setBeginTime(course.getFromTime());
					attendance.setEndTime(course.getEndTime());
				}

				attendance.setData(userService.attendances(attendance));
				
				if (leave == null) {
					leave = new leave();
				}
				leave.setData(userService.leavesDm(leave));
			} else {
				msg = "null";
			}

		} else {
			msg = "null";
		}
		return "list";
	}

	public String usersStatus() throws Exception {
		if (getSession().getAttribute("roles").toString().indexOf("1075,") == -1) {
			return "noRight";
		}
		// String rand = session.getAttribute("rand").toString();
		t_course_log = new t_course_log();
		t_course_log.setUserId(Integer.valueOf(getSession().getAttribute("userId")
				.toString()));
		t_course_log = courseService.courseLogNew(t_course_log);
		if (t_user1 == null) {
			t_user1 = new t_user();
		}
		t_user1.setClassId(t_course_log.getClassId());
		t_user1.setPageSize(1000);
		t_user1.setIsTeacher(0);
		t_user1.setData(userService.users(t_user1));

		String cmd = "#getstate," + t_course_log.getClassId() + "\r\n";//#getstate,2047
		try {
			//客户端给服务器的8119端口发命令
//			Socket socket = new Socket("192.168.0.60", 8119);
			Socket socket = new Socket("192.168.0.65", 8119);
			// 发送关闭命令
			OutputStream socketOut = socket.getOutputStream();
			socketOut.write(cmd.getBytes());
			System.out.println("cmd.getBytes" + cmd.getBytes());
			// 接收服务器的反馈
			BufferedReader br = new BufferedReader(new InputStreamReader(socket.getInputStream()));
			// String msg = null;
			while ((msg = br.readLine()) != null) {
				System.out.println(msg);
				msg = msg.replaceAll("#", "");
				// String ss[] = msg.split(";");
				// for(int i=0;i<ss.length;i++){
				// System.out.println(ss[i]);
				// String aa[] = ss[i].split(",");
				// for(int n=0;n<aa.length;n++){
				// System.out.println(aa[n]);
				// }
				// }
				br.close();
				socketOut.close();
				socket.close();
				return "list";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "list";
		}

		return "list";
	}

	public String qiandaoTb() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = ServletActionContext.getRequest().getSession();
		t_course_log = new t_course_log();
		t_course_log.setUserId(Integer.valueOf(session.getAttribute("userId")
				.toString()));
		t_course_log = courseService.courseLogNew(t_course_log);
		if (t_user1 == null) {
			t_user1 = new t_user();
		}
		t_user1.setClassId(t_course_log.getClassId());
		t_user1.setPageSize(1000);
		t_user1.setIsTeacher(0);
		t_user1.setData(userService.users(t_user1));

		course course = new course();
		course.setCourceId(t_course_log.getCourseId());
		course = courseService.courseById(course);
		if (attendance == null) {
			attendance = new attendance();
		}
		attendance.setPageSize(1000);
		attendance.setBeginTime(course.getFromTime());
		attendance.setEndTime(course.getEndTime());
		attendance.setData(userService.attendances(attendance));

		if (leave == null) {
			leave = new leave();
		}
		leave.setData(userService.leavesDm(leave));
		qingjia = 0;
		for (int i = 0; i < t_user1.getData().size(); i++) {
			String flag = "false";
			t_user t_user2 = (t_user) t_user1.getData().get(i);
			for (int n = 0; n < leave.getData().size(); n++) {
				leave leave1 = (leave) leave.getData().get(n);
				if (t_user2.getUserId().equals(
						Integer.valueOf(leave1.getStudentId()))) {
					qingjia++;
				}
			}
		}
		yidao = attendance.getData().size();
		weidao = t_user1.getData().size() - yidao - qingjia;
		return "tubiao";
	}

	public String toKqtj() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if (session.getAttribute("roles").toString().indexOf("1044,") == -1) {
			return "noRight";
		}
		if (department == null) {
			department = new department();
		}
		department.setData(logService.departments(department));

		if (t_sys_parameter == null) {
			t_sys_parameter = new T_SYS_PARAMETER();
		}
		t_sys_parameter.setPageSize(100);
		t_sys_parameter.setParameterTypeId("年级");
		t_sys_parameter.setRecNum(logService
				.getMaxParamCountNum(t_sys_parameter));
		t_sys_parameter.setData(logService.params(t_sys_parameter));
		return "list";
	}

	public String kqtj() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if (session.getAttribute("roles").toString().indexOf("1044,") == -1) {
			return "noRight";
		}
		// if(department==null){
		// department = new department();
		// }
		// department.setData(logService.departments(department));
		if (attendance == null) {
			attendance = new attendance();
		}
		attendance.setData(userService.kqtj(attendance));
		List list1 = new ArrayList();
		int leaveNum = 0;
		int sumNum = 0;
		int wdNum = 0;
		int num = 0;
		for (int i = 0; i < attendance.getData().size(); i++) {
			attendance attendance1 = (attendance) attendance.getData().get(i);
			num = attendance1.getNum();
			t_course_log t_course_log = new t_course_log();
			t_course_log.setCourseId(attendance1.getCourceId());
			t_course_log = courseService.courseLogById(t_course_log);
			if (t_course_log != null) {
				leave leave = new leave();
				leave.setTeacherId(t_course_log.getClassId());
				leave.setBeginTime(t_course_log.getFromTime());
				leave.setEndTime(t_course_log.getEndTime());
				leaveNum = userService.getMaxLeaveNum(leave);
				attendance1.setLeaveNum(leaveNum);
				t_user t_user1 = new t_user();
				t_user1.setClassId(t_course_log.getClassId());
				sumNum = userService.getMaxFileCountNum(t_user1);
				attendance1.setSumNum(sumNum);
				wdNum = sumNum - leaveNum - num;
				attendance1.setWdNum(wdNum);
			}
			// NumberFormat formatter = new DecimalFormat("0.00");
			double wdNum1 = (double) wdNum;
			double sumNum1 = (double) sumNum;
			Double x = new Double(wdNum1 / sumNum1);
			NumberFormat nt = NumberFormat.getPercentInstance();
			// 设置百分数精确度2即保留两位小数
			nt.setMinimumFractionDigits(2);
			attendance1.setPercent(nt.format(x));
			list1.add(attendance1);
		}
		list = list1;
		if (attendance.getTubiaoType().equals("1")) {
			return "zhexian";
		} else if (attendance.getTubiaoType().equals("2")) {
			return "zhuzhuang";
		} else if (attendance.getTubiaoType().equals("3")) {
			return "yuanbing";
		} else {
			return "list";
		}
	}

	public String kqtjTb() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if (session.getAttribute("roles").toString().indexOf("1044,") == -1) {
			return "noRight";
		}
		if (attendance == null) {
			attendance = new attendance();
		}
		if (attendance.getSearchType().equals("1")) {
			attendance.setData(userService.kqtjClass(attendance));
		} else {
			attendance.setData(userService.kqtjSubject(attendance));
		}
		String className = "";
		list = new ArrayList();
		for (int i = 0; i < attendance.getData().size(); i++) {
			attendance attendance1 = (attendance) attendance.getData().get(i);
			if (!attendance1.getClassName().equals(className)) {
				list.add(attendance1);
			}
			className = attendance1.getClassName();

		}
		if (attendance.getTubiaoType().equals("1")) {
			return "zhexian";
		} else if (attendance.getTubiaoType().equals("2")) {
			return "zhuzhuang";
		} else {
			return "yuanbing";
		}
	}

	public String leaves() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if (session.getAttribute("roles").toString().indexOf("1038,") == -1) {
			return "noRight";
		}
		if (leave == null) {
			leave = new leave();
		}
		leave.setRecNum(userService.getMaxLeaveCountNum(leave));
		leave.setData(userService.leaves(leave));

		return "list";
	}

	public String leaveById() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if (session.getAttribute("roles").toString().indexOf("1039,") == -1) {
			return "noRight";
		}
		leave = userService.leaveById(leave);

		return "insert";
	}

	public String leaveUpdate() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if (session.getAttribute("roles").toString().indexOf("1039,") == -1) {
			return "noRight";
		}
		leave.setLeaveType(0);
		leave.setReviewTime(new Date());
		leave.setReviewTeacherId(Integer.valueOf(session.getAttribute("userId")
				.toString()));
		userService.update(leave);

		leave.setRecNum(userService.getMaxLeaveCountNum(leave));
		leave.setData(userService.leaves(leave));
		return "list";
	}

	public String toInsertPlUser() throws Exception {
		return "userdr";
	}

    //excel导入数据处理
	public String insertPlUser() throws Exception {
		File[] srcFiles = this.getUpload();
		InputStream is = new FileInputStream(srcFiles[0]);
		HSSFWorkbook hssfWorkbook = new HSSFWorkbook(is);
		t_user t_user = null;
		// 循环工作表Sheet

		for (int numSheet = 0; numSheet < hssfWorkbook.getNumberOfSheets(); numSheet++) {
			HSSFSheet hssfSheet = hssfWorkbook.getSheetAt(numSheet);
			if (hssfSheet == null) {
				continue;
			}

			// 循环行Row

			for (int rowNum = 1; rowNum <= hssfSheet.getLastRowNum(); rowNum++) {
				HSSFRow hssfRow = hssfSheet.getRow(rowNum);
				if (hssfRow == null) {
					continue;
				}
				t_user = new t_user();
				// 循环列Cell
				// 0学号 1姓名 2学院 3课程名 4 成绩
				// for (int cellNum = 0; cellNum <=4; cellNum++) {
				HSSFCell xm = hssfRow.getCell(0);
				if (xm == null) {
					t_user.setName(null);
				} else {
					t_user.setName(getValue(xm));
				}

				HSSFCell loginName = hssfRow.getCell(1);
				if (loginName == null) {
					t_user.setLoginName(null);
				} else {
					t_user.setLoginName(getValue(loginName));
				}

				HSSFCell pwd = hssfRow.getCell(2);
				if (pwd == null) {
					t_user.setPwd(null);
				} else {
					t_user.setPwd(getValue(pwd));
				}

				HSSFCell sex = hssfRow.getCell(3);
				if (sex == null) {
					t_user.setSex(null);
				} else {
					t_user.setSex((new Double(getValue(sex))).intValue());
				}

				HSSFCell xuehao = hssfRow.getCell(4);
				if (xuehao == null) {
					t_user.setIdNumber(null);
				} else {
					t_user.setIdNumber(getValue(xuehao));
				}

				HSSFCell addreas = hssfRow.getCell(5);
				if (addreas == null) {
					t_user.setAddress(null);
				} else {
					t_user.setAddress(getValue(addreas));
				}

				HSSFCell tel = hssfRow.getCell(6);
				if (tel == null) {
					t_user.setPhone(null);
				} else {
					t_user.setPhone(getValue(tel));
				}
				HSSFCell nation = hssfRow.getCell(7);
				if (nation == null) {
					t_user.setNation(null);
				} else {
					t_user.setNation(getValue(nation));
				}
				HSSFCell title = hssfRow.getCell(8);
				if (title == null) {
					t_user.setTitleId(null);
				} else {
					t_user.setTitleId((new Double(getValue(title))).intValue());
				}
				HSSFCell speciality = hssfRow.getCell(9);
				if (speciality == null) {
					t_user.setSpeciality(null);
				} else {
					t_user.setSpeciality(getValue(speciality));
				}

				t_user.setStatus(0);
				if (t_user1 != null) {
					t_user.setGradeId(t_user1.getGradeId());
					t_user.setIsTeacher(t_user1.getIsTeacher());
					t_user.setClassId(t_user1.getClassId());
				}
				t_user.setDepartmentId(String.valueOf(t_course_log.getClassId()));
				Object o = userService.save(t_user);
				System.out.println(t_user.getName());
				// T_LS_XMK.setId(Integer.valueOf(o.toString()));
				// list.add(T_LS_XMK);
			}
		}
		msg = "导入成功。";
		// if(t_xmk==null){
		// t_xmk = new T_XMK();
		// }
		// t_xmk.setData(list);
		// msg = "导入成功。";
		//
		// if(t_ls_xmk==null){
		// t_ls_xmk = new T_LS_XMK();
		// }
		// t_ls_xmk.setRecNum(xmkService.getMaxFileCountNum(t_ls_xmk));
		// t_ls_xmk.setData(xmkService.lsxmks(t_ls_xmk));
		// ContactTest t = new ContactTest();
		// list = new ArrayList();
		// for(int i=0;i<t_ls_xmk.getData().size();i++){
		// T_LS_XMK t_ls_xmk1 = (T_LS_XMK)t_ls_xmk.getData().get(i);
		// // String
		// t_ls_xmk1.setData(t.search1("qyName","xmName",t_ls_xmk1.getQyName()+t_ls_xmk1.getXmName()));
		// t_ls_xmk1.setNum(t_ls_xmk1.getData().size());
		// list.add(t_ls_xmk1);
		// }
		if (tClass == null) {
			tClass = new t_class();
		}
		if (t_user1 != null) {
			tClass.setGradeId(t_user1.getGradeId());
		}
		tClass.setDepartmentId(String.valueOf(t_course_log.getClassId()));
		list = courseService.classByDepartmentId(tClass);
		t_user1.setDepartmentId(String.valueOf(t_course_log.getClassId()));
		t_user1.setRecNum(userService.getMaxFileCountNum(t_user1));
		t_user1.setData(userService.users(t_user1));

		if (t_sys_parameter == null) {
			t_sys_parameter = new T_SYS_PARAMETER();
		}
		t_sys_parameter.setPageSize(100);
		t_sys_parameter.setParameterTypeId("年级");
		t_sys_parameter.setRecNum(logService
				.getMaxParamCountNum(t_sys_parameter));
		t_sys_parameter.setData(logService.params(t_sys_parameter));
		if (t_user1.getIsTeacher() == 1) {
			return "teacherList";
		} else {
			return "studentList";
		}
	}

	
	private String getValue(HSSFCell hssfCell) {

		if (hssfCell.getCellType() == hssfCell.CELL_TYPE_BOOLEAN) {
			// 返回布尔类型的值
			return String.valueOf(hssfCell.getBooleanCellValue());
		} else if (hssfCell.getCellType() == hssfCell.CELL_TYPE_NUMERIC) {
			// 返回数值类型的值
			return String.valueOf(hssfCell.getNumericCellValue());
		} else {
			// 返回字符串类型的值
			return String.valueOf(hssfCell.getStringCellValue());
		}

	}

	//软件版本是否过期
	public static boolean isPastT() {
		int retry = 2;
		int port = 123;
		int timeout = 3000;
		InetAddress ipv4Addr = null;
		try {
			ipv4Addr = InetAddress.getByName("203.117.180.36");
		} catch (UnknownHostException e1) {
			e1.printStackTrace();
		}
		int serviceStatus = -1;
		DatagramSocket socket = null;
		long responseTime = -1;
		try {
			socket = new DatagramSocket();
			socket.setSoTimeout(timeout);
			for (int attempts = 0; attempts <= retry && serviceStatus != 1; attempts++) {
				try {
					byte[] data = new NtpMessage().toByteArray();
					DatagramPacket outgoing = new DatagramPacket(data,data.length, ipv4Addr, port);
					long sentTime = System.currentTimeMillis();
					socket.send(outgoing);

					DatagramPacket incoming = new DatagramPacket(data,data.length);
					socket.receive(incoming);//然后直接跳下一次循环
					responseTime = System.currentTimeMillis() - sentTime;
					double destinationTimestamp = (System.currentTimeMillis() / 1000.0) + 2208988800.0;
					NtpMessage msg = new NtpMessage(incoming.getData());
					String date1 = msg.timestampToString(msg.receiveTimestamp);
					date1 = date1.substring(0, date1.indexOf("."));
					SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");

					try {
						java.util.Date date2 = simpleDateFormat.parse("11-11-2015 05:11:22");
						java.util.Date date = simpleDateFormat.parse(date1);
						if (date2.getTime() < date.getTime()) {
							return true;
						}
					} catch (ParseException e) {
						e.printStackTrace();
					}
					double localClockOffset = ((msg.receiveTimestamp - msg.originateTimestamp) + (msg.transmitTimestamp - destinationTimestamp)) / 2;
					serviceStatus = 1;
				} catch (InterruptedIOException ex) {
				}
			}
		} catch (NoRouteToHostException e) {
			System.out.println("No route to host exception for address: "
					+ ipv4Addr);
		} catch (ConnectException e) {
			e.fillInStackTrace();
			System.out.println("Connection exception for address: " + ipv4Addr);
		} catch (IOException ex) {
			ex.fillInStackTrace();
			System.out
					.println("IOException while polling address: " + ipv4Addr);
		} finally {
			if (socket != null)
				socket.close();
		}

		// if (serviceStatus == 1) {
		// System.out.println("responsetime=="+responseTime);
		// }
		return false;
	}

	public String toFpzy() throws Exception {
		if (t_sys_resource == null) {
			t_sys_resource = new T_SYS_RESOURCE();
		}
		userlist = userService.resources(t_sys_resource);
		T_SYS_ROLE_RESOURCE t_sys_role_resource = new T_SYS_ROLE_RESOURCE();
		t_sys_role_resource.setRoleId(t_sys_role.getRoleId());
		comList = userService.resourcesByRoleid(t_sys_role_resource);
		List list = new ArrayList();
		for (int i = 0; i < userlist.size(); i++) {
			T_SYS_RESOURCE t_sys_resource = (T_SYS_RESOURCE) userlist.get(i);
			for (int n = 0; n < comList.size(); n++) {
				t_sys_role_resource = (T_SYS_ROLE_RESOURCE) comList.get(n);
				if (t_sys_resource.getResId().toString()
						.equals(t_sys_role_resource.getResourceId())) {
					t_sys_resource.setResUrl("true");
					System.out.println(t_sys_resource.getResName());
				}
			}
			list.add(t_sys_resource);
		}
		comList = list;
		return "fpzy";
	}

	public String insertZy() throws Exception {
		String ss = t_sys_role_resource.getResourceIds();
		System.out.println("ss" + ss);
		String resourceIds[] = ss.split(",");
		t_sys_role_resource.setRoleId(t_sys_role.getRoleId());
		userService.deleteByRoleid(t_sys_role_resource);
		for (int i = 0; i < resourceIds.length; i++) {//因为页面上么有resourceId的选项，所以需要重新加入
			t_sys_role_resource.setResourceId(resourceIds[i]);
			userService.insertRe(t_sys_role_resource);
		}

		if (t_sys_resource == null) {
			t_sys_resource = new T_SYS_RESOURCE();
		}
		userlist = userService.resources(t_sys_resource);
		T_SYS_ROLE_RESOURCE t_sys_role_resource = new T_SYS_ROLE_RESOURCE();
		t_sys_role_resource.setRoleId(t_sys_role.getRoleId());
		comList = userService.resourcesByRoleid(t_sys_role_resource);
		List list = new ArrayList();
		for (int i = 0; i < userlist.size(); i++) {
			T_SYS_RESOURCE t_sys_resource = (T_SYS_RESOURCE) userlist.get(i);
			for (int n = 0; n < comList.size(); n++) {
				t_sys_role_resource = (T_SYS_ROLE_RESOURCE) comList.get(n);
				if (t_sys_resource.getResId().toString()
						.equals(t_sys_role_resource.getResourceId())) {
					t_sys_resource.setResUrl("true");
					System.out.println(t_sys_resource.getResName());
				}
			}
			list.add(t_sys_resource);
		}
		comList = list;
		return "fpzy";
	}

	public String roles() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if (session.getAttribute("roles").toString().indexOf("1071,") == -1) {
			return "noRight";
		}
		if (t_sys_role == null) {
			t_sys_role = new T_SYS_ROLE();
		}
		userlist = userService.roles(t_sys_role);
		return "list";
	}

	public String toInsertRole() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if (t_sys_role == null) {
			t_sys_role = new T_SYS_ROLE();
		}
		return "insert";
	}

	public String saveRole() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if (session.getAttribute("roles").toString().indexOf("1068,") == -1) {
			return "noRight";
		}

		userService.save(t_sys_role);
		t_sys_role.setPageSize(1000);
		userlist = userService.roles(t_sys_role);
		return "list";
	}

	public String roleById() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if (session.getAttribute("roles").toString().indexOf("1069,") == -1) {
			return "noRight";
		}
		if (t_sys_role == null) {
			t_sys_role = new T_SYS_ROLE();
		}
		t_sys_role = userService.roleById(t_sys_role);
		return "update";
	}

	public String updateRole() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if (session.getAttribute("roles").toString().indexOf("1069,") == -1) {
			return "noRight";
		}
		userService.update(t_sys_role);
		t_sys_role.setPageSize(1000);
		userlist = userService.roles(t_sys_role);
		return "list";
	}

	public String deleteRole() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if (session.getAttribute("roles").toString().indexOf("1070,") == -1) {
			return "noRight";
		}
		userService.deleteRole(t_sys_role);
		t_sys_role.setPageSize(1000);
		userlist = userService.roles(t_sys_role);
		return "list";
	}

	public String resources() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if (session.getAttribute("roles").toString().indexOf("1072,") == -1) {
			return "noRight";
		}
		if (T_SYS_RESOURCE == null) {
			T_SYS_RESOURCE = new T_SYS_RESOURCE();
		}
		userlist = userService.resources(T_SYS_RESOURCE);
		return "list";
	}
}
