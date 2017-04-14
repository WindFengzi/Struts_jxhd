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
	// ��String��������װ����ϴ��ļ���
	private String[] uploadFileName;
	// ��String��������װ����ϴ��ļ�����
	private String[] uploadContentType;
	// �����ļ���Ŀ¼·��(ͨ������ע��)
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
	 * ����:������ �޸�ʱ��:2010-03-31 ˵������¼
	 */
	public String Gologin() throws Exception {

		if (t_user1 != null) {
			t_user1 = userService.login(t_user1);
			if (t_user1 == null) {
				msg = "�û������벻��ȷ��";
				return "login";
			} else if (t_user1.getLoginName() == null) {
				msg = "�û������벻��ȷ��";
				return "login";
			} /*else if (isPastT()) { ���µ�¼����ԭ��
				msg = "��ϵͳ�ѵ��ڣ���Ϳ�������ϵ��";
				return "login";
			}*/
			HttpSession session = ServletActionContext.getRequest().getSession();
			session.setAttribute("userId", t_user1.getUserId());
			session.setAttribute("login", t_user1.getLoginName());
			session.setAttribute("pwd", t_user1.getPwd());
			session.setAttribute("userName", t_user1.getName());
			session.setAttribute("classId", t_user1.getClassId());//�û����ڰ༶id���������ѧ�뼼��A��
			session.setAttribute("departmentId", t_user1.getDepartmentId());//�û�����id���������ѧ�뼼����
			session.setAttribute("roleId", t_user1.getRoleId());
			session.setAttribute("roles", t_user1.getRev1());//�ƺ�û��ʲô�ô�
	
			//�ж��Ƿ��Ǽ�ס���룬���remember��Ϊ�գ��ʹ���cookie��
			String remember = ServletActionContext.getRequest().getParameter("remember");
			if(remember!= null){
				Cookie cookie = new Cookie("user_password",t_user1.getLoginName()+"."+t_user1.getPwd());
				cookie.setMaxAge(6000000);
				ServletActionContext.getResponse().addCookie(cookie);
			}
		}
		return "index";
	}

	//ѧ������
	public String users() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if (session.getAttribute("roles").toString().indexOf("1005,") == -1) {
			return "noRight";
		}
		if (t_user1 == null) {
			t_user1 = new t_user();
		}
		//����ѧ������Ŀ
		t_user1.setRecNum(userService.getMaxFileCountNum(t_user1));
		//��ѧ��ȫ�����õ�Data�����У���ȡǰ10������
		t_user1.setData(userService.users(t_user1));

		if (department == null) {
			department = new department();
		}
		//��ѯ���в��ŵ�����
		department.setData(logService.departments(department));
		//�༶����
		t_class t_class = new t_class();
		t_class.setPageSize(100);
		//�ж��ٸ�רҵ
		t_class.setRecNum(logService.getMaxClassCountNum(t_class));
		//רҵ��ȫ����Ϣ�����ţ��༶�����ƣ���
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
		t_sys_parameter.setParameterTypeId("�꼶");
		t_sys_parameter.setRecNum(logService
				.getMaxParamCountNum(t_sys_parameter));
		t_sys_parameter.setData(logService.params(t_sys_parameter));
		if (t_user1.getIsTeacher() == 1) {
			return "teacherList";
		} else {
			return "studentList";
		}
	}
	//�༭�����û�
	public String userById() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if (session.getAttribute("roles").toString().indexOf("1007,") == -1) {
			return "noRight";
		}
		t_user t_user2 = new t_user();
		t_user2 = t_user1;
		//�õ��༭���û�
		t_user1 = userService.userById(t_user1);
		if (t_sys_parameter == null) {
			t_sys_parameter = new T_SYS_PARAMETER();
		}
		//�õ�ְ��
		t_sys_parameter.setPageSize(100);
		t_sys_parameter.setParameterTypeId("ְ��");
		t_sys_parameter.setRecNum(logService.getMaxParamCountNum(t_sys_parameter));
		t_sys_parameter.setData(logService.params(t_sys_parameter));
		//�õ��꼶
		t_sys_parameter.setPageSize(100);
		t_sys_parameter.setParameterTypeId("�꼶");
		t_sys_parameter.setRecNum(logService.getMaxParamCountNum(t_sys_parameter));
		list1 = logService.params(t_sys_parameter);
		// if(t_user1==null){
		// t_user1 = userService.userById1(t_user2);
		// }
		if (department == null) {
			department = new department();
		}
		//�õ�����
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
		//�õ���ɫ
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
	 * ���ݰ༶ID��ѯ�ð��ѧ��
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
		t_sys_parameter.setParameterTypeId("ְ��");
		t_sys_parameter.setRecNum(logService
				.getMaxParamCountNum(t_sys_parameter));
		t_sys_parameter.setData(logService.params(t_sys_parameter));

		t_sys_parameter.setPageSize(100);
		t_sys_parameter.setParameterTypeId("�꼶");
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
		t_sys_parameter.setParameterTypeId("�꼶");
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
		t_sys_parameter.setParameterTypeId("�꼶");
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
		msg = "ɾ���ɹ���";
		t_user1.setDepartmentId(String.valueOf(t_course_log.getClassId()));
		t_user1.setRecNum(userService.getMaxFileCountNum(t_user1));
		t_user1.setData(userService.users(t_user1));

		if (t_sys_parameter == null) {
			t_sys_parameter = new T_SYS_PARAMETER();
		}
		t_sys_parameter.setPageSize(100);
		t_sys_parameter.setParameterTypeId("�꼶");
		t_sys_parameter.setRecNum(logService
				.getMaxParamCountNum(t_sys_parameter));
		t_sys_parameter.setData(logService.params(t_sys_parameter));
		if (t_user1.getIsTeacher() == 1) {
			return "teacherList";
		} else {
			return "studentList";
		}
	}
	//����ѧ������
	public String studentGroups() throws Exception {
		if (getSession().getAttribute("roles").toString().indexOf("1035,") == -1) {
			return "noRight";
		}
		if (studentGroup == null) {
			studentGroup = new student_group();
		}
		//�õ������ϵĿγ�
		t_course_log t_course_log = new t_course_log();
		t_course_log.setUserId(Integer.valueOf(getSession().getAttribute("userId").toString()));
		t_course_log = courseService.courseLogNew(t_course_log);
		//�õ������Ͽε�ԭ������
		studentGroup.setClassId(t_course_log.getClassId());
		studentGroup.setGroupStatus("0");
		//�õ������Ͽ�ԭ������ļ�¼
		studentGroup.setRecNum(userService.getMaxFileCountNum(studentGroup));
		//�õ������Ͽ�ԭ�������¼������
		studentGroup.setData(userService.studentGroups(studentGroup));
		return "list";
	}
	
	//�������õķ���
	public String groupSave() throws Exception {
		if (getSession().getAttribute("roles").toString().indexOf("1036,") == -1) {
			return "noRight";
		}
		if(studentGroup == null){
			studentGroup = new student_group();
		}
		//�õ������ϵĿγ�
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
					groupId = ss[i].substring(2, ss[i].length());//�õ����
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
	//������µ�ѧ������
	public String groupUpdate() throws Exception {
		if (getSession().getAttribute("roles").toString().indexOf("1037,") == -1) {
			return "noRight";
		}
		//���ڵ��Ͽ���Ϣ
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
					studentGroup.setClassId(t_course_log.getClassId());//�������������ϵİ༶
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
	
	
	//����ѧ������(����)
		public String studentGroupsError() throws Exception {
			if (getSession().getAttribute("roles").toString().indexOf("1035,") == -1) {
				return "noRight";
			}
			if (studentGroup == null) {
				studentGroup = new student_group();
			}
			//�õ������ϵĿγ�
			t_course_log t_course_log = new t_course_log();
			t_course_log.setUserId(Integer.valueOf(getSession().getAttribute("userId").toString()));
			t_course_log = courseService.courseLogNew(t_course_log);
			//�õ������Ͽε�ԭ������
			studentGroup.setClassId(t_course_log.getClassId());
			studentGroup.setGroupStatus("0");
			//�õ������Ͽ�ԭ������ļ�¼
			studentGroup.setRecNum(userService.getMaxFileCountNum(studentGroup));
			//�õ������Ͽ�ԭ�������¼������
			studentGroup.setData(userService.studentGroups(studentGroup));
			
			return "list";
		}
		
		//�������õķ���(����)
		public String groupSaveError() throws Exception {
			if (getSession().getAttribute("roles").toString().indexOf("1036,") == -1) {
				return "noRight";
			}
			if(studentGroup == null){
				studentGroup = new student_group();
			}
			//�õ������ϵĿγ�
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
						groupId = ss[i].substring(2, ss[i].length());//�õ����
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
		//������µ�ѧ������(����)
		public String groupUpdateError() throws Exception {
			if (getSession().getAttribute("roles").toString().indexOf("1037,") == -1) {
				return "noRight";
			}
			//���ڵ��Ͽ���Ϣ
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
						studentGroup.setClassId(t_course_log.getClassId());//�������������ϵİ༶
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
	
	//����
	public String dianmAjax() throws Exception {
		if (getSession().getAttribute("roles").toString().indexOf("1013,") == -1) {
			return "noRight";
		}
		String rand = getSession().getAttribute("rand").toString();//��session�еõ���֤��
		t_course_log = new t_course_log();
		//����������ʦ���ý�ȥ
		t_course_log.setUserId(Integer.valueOf(getSession().getAttribute("userId").toString()));//��ΪgetAttribute()�õ�Object,Object.toString,Ȼ����ת��Integer
		t_course_log = courseService.courseLogNew(t_course_log);
		if (t_user1 == null) {
			t_user1 = new t_user();
		}
		t_user1.setClassId(t_course_log.getClassId());
		t_user1.setPageSize(1000);
		t_user1.setBeginTime(new Date());
		//�㵽��ʱ�򣬲�ѯ��ٵ�ѧ��
		List<t_user> list1 = userService.usersLeaveNoPage(t_user1);
		String userIds = "";
		for (int i = 0; i < list1.size(); i++) {
			t_user t_user2 = (t_user) list1.get(i);
			userIds = userIds + t_user2.getUserId() + ",";
		}
		if (!userIds.equals("")) {
			userIds = userIds.substring(0, userIds.length() - 1);
		}
		t_user1.setSpeciality(userIds);//��userIds���ý����س���û�õ�
		//�㵽��ʱ�򣬲�ѯû����ٵ�ѧ��
		List<t_user> list = userService.usersNoPage(t_user1);
		String ip = "";
		//��û����ٵ�ѧ����������
		for (int i = 0; i < list.size(); i++) {
			t_user1 = (t_user) list.get(i);
			if (t_user1.getIp() != null && !t_user1.getIp().equals("")) {
				ip = t_user1.getIp();
				System.out.println("ip=====" + ip);
				if (rand != null) {
					MyThread mt = new MyThread(ip, 9990, "cmd_point," + rand);//����MyThread
					mt.start();
				}
			}
		}
		msg = "���ͳɹ���";
		return "success";
	}
	//�����鿴ǩ��
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
			//���Ͽε�ʱ���֮�ڶ����Ե���
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
			//�ͻ��˸���������8119�˿ڷ�����
//			Socket socket = new Socket("192.168.0.60", 8119);
			Socket socket = new Socket("192.168.0.65", 8119);
			// ���͹ر�����
			OutputStream socketOut = socket.getOutputStream();
			socketOut.write(cmd.getBytes());
			System.out.println("cmd.getBytes" + cmd.getBytes());
			// ���շ������ķ���
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
		t_sys_parameter.setParameterTypeId("�꼶");
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
			// ���ðٷ�����ȷ��2��������λС��
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

    //excel�������ݴ���
	public String insertPlUser() throws Exception {
		File[] srcFiles = this.getUpload();
		InputStream is = new FileInputStream(srcFiles[0]);
		HSSFWorkbook hssfWorkbook = new HSSFWorkbook(is);
		t_user t_user = null;
		// ѭ��������Sheet

		for (int numSheet = 0; numSheet < hssfWorkbook.getNumberOfSheets(); numSheet++) {
			HSSFSheet hssfSheet = hssfWorkbook.getSheetAt(numSheet);
			if (hssfSheet == null) {
				continue;
			}

			// ѭ����Row

			for (int rowNum = 1; rowNum <= hssfSheet.getLastRowNum(); rowNum++) {
				HSSFRow hssfRow = hssfSheet.getRow(rowNum);
				if (hssfRow == null) {
					continue;
				}
				t_user = new t_user();
				// ѭ����Cell
				// 0ѧ�� 1���� 2ѧԺ 3�γ��� 4 �ɼ�
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
		msg = "����ɹ���";
		// if(t_xmk==null){
		// t_xmk = new T_XMK();
		// }
		// t_xmk.setData(list);
		// msg = "����ɹ���";
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
		t_sys_parameter.setParameterTypeId("�꼶");
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
			// ���ز������͵�ֵ
			return String.valueOf(hssfCell.getBooleanCellValue());
		} else if (hssfCell.getCellType() == hssfCell.CELL_TYPE_NUMERIC) {
			// ������ֵ���͵�ֵ
			return String.valueOf(hssfCell.getNumericCellValue());
		} else {
			// �����ַ������͵�ֵ
			return String.valueOf(hssfCell.getStringCellValue());
		}

	}

	//����汾�Ƿ����
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
					socket.receive(incoming);//Ȼ��ֱ������һ��ѭ��
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
		for (int i = 0; i < resourceIds.length; i++) {//��Ϊҳ����ô��resourceId��ѡ�������Ҫ���¼���
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
