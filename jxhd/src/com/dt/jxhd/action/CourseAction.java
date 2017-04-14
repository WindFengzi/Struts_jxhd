package com.dt.jxhd.action;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import test.MyThread;

import com.dt.jxhd.domain.T_SYS_PARAMETER;
import com.dt.jxhd.domain.class_section;
import com.dt.jxhd.domain.course;
import com.dt.jxhd.domain.date;
import com.dt.jxhd.domain.department;
import com.dt.jxhd.domain.subject;
import com.dt.jxhd.domain.t_class;
import com.dt.jxhd.domain.t_course_log;
import com.dt.jxhd.domain.t_user;
import com.dt.jxhd.service.iface.ICourseService;
import com.dt.jxhd.service.iface.ILogService;
import com.dt.jxhd.service.iface.IUserService;

public class CourseAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	private course course;//课程model
	
	public course getCourse() {
		return course;
	}

	public void setCourse(course course) {
		this.course = course;
	}
	private ICourseService courseService;//课程service

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

	private department department;//对应所在部门
	public department getDepartment() {
		return department;
	}
	public void setDepartment(department department) {
		this.department = department;
	}
	private ILogService logService;

	public void setLogService(ILogService logService) {
		this.logService = logService;
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
	private List list2;
	public List getList2() {
		return list2;
	}

	public void setList2(List list2) {
		this.list2 = list2;
	}

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
	private String msg;

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	private IUserService userService;

	public void setUserService(IUserService userService) {
		this.userService = userService;
	}
	public List weeks;
	public List getWeeks() {
		return weeks;
	}
	private String year;
	
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	private String month;
	
	private String week;
	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getWeek() {
		return week;
	}

	public void setWeek(String week) {
		this.week = week;
	}

	public void setWeeks(List weeks) {
		this.weeks = weeks;
	}
	private subject subject;
	public subject getSubject() {
		return subject;
	}

	public void setSubject(subject subject) {
		this.subject = subject;
	}
	private class_section class_section;

	public class_section getClass_section() {
		return class_section;
	}
	public void setClass_section(class_section class_section) {
		this.class_section = class_section;
	}
	private t_user t_user1;
	public t_user getT_user1() {
		return t_user1;
	}
	public void setT_user1(t_user t_user1) {
		this.t_user1 = t_user1;
	}
	private T_SYS_PARAMETER t_sys_parameter;
	public T_SYS_PARAMETER getT_sys_parameter() {
		return t_sys_parameter;
	}
	public void setT_sys_parameter(T_SYS_PARAMETER t_sys_parameter) {
		this.t_sys_parameter = t_sys_parameter;
	}
	public String toSetCourse() throws Exception{
		if(getSession().getAttribute("roles").toString().indexOf("1057,")==-1){
			return "noRight";
		}
		if(course==null){
			course = new course();
		}
		course.setRecNum(courseService.getCourseNum(course));
		course.setData(courseService.cources(course)); 
		
		if(department==null){
			department = new department();
		}
		department.setData(logService.departments(department));
		return "setCourse";
	}
	//课程设置
	public String courseShezhi() throws Exception{
		if(course==null){
			course = new course();
		}
		if(getSession().getAttribute("roles").toString().indexOf("1057,")==-1){
			return "noRight";
		}
		course.setRecNum(courseService.getCourseNum(course));//得到课程条数
		course.setData(courseService.cources(course)); //得到课程数据
		if(department==null){
			department = new department();
		}
		department.setData(logService.departments(department));
		return "setCourse";
	}
	
	public String setCourse() throws Exception{
		if(course==null){
			course = new course();
		}
		if(getSession().getAttribute("roles").toString().indexOf("1056,")==-1){
			return "noRight";
		}
		course.setRecNum(courseService.getCourseNum(course));
		course.setData(courseService.cources(course)); 
		
		if(department==null){
			department = new department();
		}
		department.setData(logService.departments(department));
		return "setList";
	}
	public String toDepartments() throws Exception{
		if(getSession().getAttribute("roles").toString().indexOf("1050,")==-1){
			return "noRight";
		}
		Thread.currentThread().sleep(300);//毫秒   
		if(department==null){
			department = new department();
		}
		department.setData(logService.departments(department));
		if(getRequest().getParameter("departmentId")!=null){
			department.setParentDepartmentId(Integer.valueOf(getRequest().getParameter("departmentId").toString()));
		}
		return "list";
	}
	public String departments() throws Exception{
		if(getSession().getAttribute("roles").toString().indexOf("1050,")==-1){
			return "noRight";
		}
		
		if(department==null){
			department = new department();
		}
		department.setRecNum(logService.getMaxDepartmentsPageCountNum(department));
		department.setData(logService.departmentsPage(department));
		return "list";
	}
	
	public String toTjfx() throws Exception{
		return "tjfxList";
	}

	public String sections() throws Exception{
		if(getSession().getAttribute("roles").toString().indexOf("1073,")==-1){
			return "noRight";
		}
		if(class_section==null){
			class_section = new class_section();
		}
		class_section.setRecNum(courseService.getSectionsNum(class_section));
		class_section.setData(courseService.sections(class_section));
		return "list";
	}
	public String toSaveSection() throws Exception{
		if(getSession().getAttribute("roles").toString().indexOf("1074,")==-1){
			return "noRight";
		}
		return "insert";
	}
	public String saveSection() throws Exception{
		if(getSession().getAttribute("roles").toString().indexOf("1074,")==-1){
			return "noRight";
		}
		if(class_section==null){
			class_section = new class_section();
		}
		courseService.save(class_section);
		class_section.setRecNum(courseService.getSectionsNum(class_section));
		class_section.setData(courseService.sections(class_section));
		return "list";
	}
	public String sectionById() throws Exception{
		class_section = courseService.sectionById(class_section);
		return "update";
	}
	public String deleteSection() throws Exception{
		if(class_section==null){
			class_section = new class_section();
		}
		courseService.deleteSection(class_section);
		class_section.setRecNum(courseService.getSectionsNum(class_section));
		class_section.setData(courseService.sections(class_section));
		return "list";
	}
	
	
	public String departmentByParentId() throws Exception{
		if(tClass==null){
			tClass = new t_class();
		}
		tClass.setDepartmentId(String.valueOf(t_course_log.getClassId()));
		if(t_user1!=null){
			tClass.setGradeId(t_user1.getGradeId());
		}
		list = courseService.classByDepartmentId(tClass);
		
	/*	long time=System.currentTimeMillis();  
   		Date date1=new Date(time);*/
   		
		Calendar cal = Calendar.getInstance();    
		if(getRequest().getParameter("year")==null){
			year = String.valueOf(cal.get(Calendar.YEAR));//年
		}else{
			year = getRequest().getParameter("year");
		}
		if(getRequest().getParameter("month")==null){
			month = String.valueOf(cal.get(Calendar.MONTH)+1);//月
		}else{
			month = getRequest().getParameter("month");
		}
		if(getRequest().getParameter("week")==null){
			week = String.valueOf(cal.get(Calendar.WEEK_OF_MONTH));//月,一个月中的第几个星期
		}else{
			week = getRequest().getParameter("week");
		}
		DateFormat dd=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		weeks w = new weeks();
		//调用weeks的getWeeksDate方法
		weeks =w.getWeeksDate(Integer.parseInt(year),Integer.parseInt(month)-1,1,Integer.parseInt(week)-1);
		Date date2 = dd.parse(((date)weeks.get(0)).getDate()+" 00:00:00");//本星期的第一天
		Date date3 = dd.parse(((date)weeks.get(6)).getDate()+" 23:59:59");//本星期的最后一天
		if(course==null){
			course = new course();
		}
		course.setFromTime(date2);
		course.setEndTime(date3);
		if(t_course_log.getCourseId()!=null){
			course.setClassId(t_course_log.getCourseId());
		}else{
			course.setClassId(0);
		}
		course.setData(courseService.cources(course));
		if(t_sys_parameter==null){
			t_sys_parameter = new T_SYS_PARAMETER();
		}
		t_sys_parameter.setPageSize(100);
		t_sys_parameter.setParameterTypeId("课程");
		t_sys_parameter.setRecNum(logService.getMaxParamCountNum(t_sys_parameter));
		t_sys_parameter.setData(logService.params(t_sys_parameter));
		
		t_sys_parameter.setParameterTypeId("年级");
		t_sys_parameter.setRecNum(logService.getMaxParamCountNum(t_sys_parameter));
		list2 = logService.params(t_sys_parameter);
		
		t_user	t_user1 = new t_user();
		t_user1.setPageSize(1000);
		t_user1.setIsTeacher(1);
		list1 = userService.users(t_user1);
		return "listR";
	}
	
	public String departmentByParentId1() throws Exception{
		String departmentId = getSession().getAttribute("departmentId").toString();
		String agentUserId = getSession().getAttribute("userId").toString();
		if(tClass==null){
			tClass = new t_class();
		}
		tClass.setDepartmentId(departmentId);
		tClass.setGradeId(t_user1.getGradeId());
		list = courseService.classByDepartmentId(tClass);
		if(course==null){
			course = new course();
		}
		SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat sf1=new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String ss = sf1.format(date);
		if(course.getFromTime()==null){
			course.setFromTime(sf.parse(ss+" 00:00:00"));
		}
		if(course.getEndTime()==null){
			course.setEndTime(sf.parse(ss+" 23:59:59"));
		}
//		if(classId!=null&&!classId.equals("")){
//			course.setClassId(Integer.valueOf(classId));
//		}
		course.setAgentUserId(Integer.valueOf(agentUserId));
		course.setRecNum(courseService.getCourseNum(course));
		course.setData(courseService.cources(course));
		
		if(t_sys_parameter==null){
			t_sys_parameter = new T_SYS_PARAMETER();
		}
		t_sys_parameter.setPageSize(100);
		t_sys_parameter.setParameterTypeId("年级");
		t_sys_parameter.setRecNum(logService.getMaxParamCountNum(t_sys_parameter));
		t_sys_parameter.setData(logService.params(t_sys_parameter));
//		t_user	t_user1 = new t_user();
//		t_user1.setPageSize(1000);
//		t_user1.setIsTeacher(1);
//		list1 = userService.users(t_user1);
		return "setListR";
	}
	//学生或者老师点击具体部门后的事件
	public String departmentByParentId2() throws Exception{
		String roleId = getSession().getAttribute("roleId").toString();
		String departmentId1 = getSession().getAttribute("departmentId").toString();
		if(tClass==null){
			tClass = new t_class();
		}
		tClass.setDepartmentId(String.valueOf(t_course_log.getClassId()));//具体的部门
		tClass.setGradeId(t_user1.getGradeId());//这个没有值，因为前段没有设置
		//得到班级列表
		list = courseService.classByDepartmentId(tClass);
		
		department department1 = new department();
		department1.setDepartmentId(t_course_log.getClassId());
		List list1 = logService.departmentsByParentId(department1);
		String departmentId = "";
		for(int i=0;i<list1.size();i++){
			department1 = (department)list1.get(i);
			departmentId = departmentId + department1.getDepartmentId() +",";
		}
		if(departmentId.length()>0){
			departmentId = departmentId.substring(0, departmentId.length()-1);
		}
		
		if(t_user1==null){
			t_user1 = new t_user();
		}
		if(!roleId.equals("1")){
			if(!departmentId.contains(departmentId1)){
				departmentId = "-1";
			}else{
				departmentId=departmentId1;
			}
		}
		t_user1.setDepartmentId(departmentId);
		//得到某个部门底下学生数量
		t_user1.setRecNum(userService.getMaxFileCountNum(t_user1));
		//得到某个部门下所有学生
		t_user1.setData(userService.users(t_user1));
		
		if(t_sys_parameter==null){
			t_sys_parameter = new T_SYS_PARAMETER();
		}
		t_sys_parameter.setPageSize(100);
		t_sys_parameter.setParameterTypeId("年级");
		//得到部门底下级数（2015级，2016级等）
		t_sys_parameter.setRecNum(logService.getMaxParamCountNum(t_sys_parameter));
		//得到部门下级数
		t_sys_parameter.setData(logService.params(t_sys_parameter));
		if(t_user1.getIsTeacher()==1){
			return "teacherList";
		}else{
			return "studentList";
		}
	}
	
	
	public String saveCourseLogAjax() throws Exception{
		if(t_course_log==null){
			t_course_log = new t_course_log();
		}
		course = new course();
		String courseId = getRequest().getParameter("courseId").toString();
		if(courseId!=null){
			course.setCourceId(Integer.valueOf(courseId));
			course = courseService.courseById(course);
			t_course_log.setCourseId(course.getCourceId());
			t_course_log.setClassId(course.getClassId());
			t_course_log.setFromTime(course.getFromTime());
			t_course_log.setEndTime(course.getEndTime());
			t_course_log.setSubjectId(Integer.valueOf(course.getSubjectId()));
			t_course_log.setUserId(Integer.valueOf(getSession().getAttribute("userId").toString()));
		}
		
		
		courseService.save(t_course_log);
		msg = "保存成功。";
		
//		t_course_log = new t_course_log();
		t_course_log = courseService.courseLogNew(t_course_log);
		t_user	t_user1 = new t_user();
		t_user1.setClassId(t_course_log.getClassId());
		t_user1.setPageSize(1000);
		List list = userService.users(t_user1);
		String ip = "";
		for(int i=0;i<list.size();i++){
			t_user1 = (t_user)list.get(i);
			if(t_user1.getIp()!=null&&!t_user1.getIp().equals("")){
				ip = t_user1.getIp();
				System.out.println("ip====="+ip);
				MyThread mt = new MyThread(ip,9990,"cmd_update_course,"+t_course_log.getCourseId()+","+t_course_log.getFromTime());
				mt.start();
//				NetTelnet telnet = new NetTelnet(ip, 9990, "",""); 
//				telnet.sendCommand("cmd_update_course,"+t_course_log.getCourseId()+","+t_course_log.getFromTime());
//				telnet.disconnect();
			}
		}
		return "success";
	}
	public String courseLogs() throws Exception{
		if(t_course_log==null){
			t_course_log = new t_course_log();
		}
		t_user	t_user1 = new t_user();
		t_user1.setPageSize(1000);
		t_user1.setIsTeacher(1);
		list = userService.users(t_user1);
		t_course_log.setRecNum(courseService.getCourseLogsNum(t_course_log));
		t_course_log.setData(courseService.courseLogs(t_course_log));
		return "courseLogs";
	}
	public String saveCourseAjax() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		String subjectId[] = request.getParameter("subjectId").toString().split(",");
		String classId = request.getParameter("classId").toString();
		String date[] = request.getParameter("date").toString().split(",");
		String num[] = request.getParameter("num").toString().split(",");
		String agentUserId = request.getParameter("agentUserId").toString();
		System.out.println("subjectId:"+subjectId);
		System.out.println("classId:"+classId);
		System.out.println("date:"+date);
		System.out.println("num:"+num);
		for(int i=0;i<subjectId.length;i++){
			class_section = new class_section();
			class_section.setClassSectionId(Integer.valueOf(num[i]));
			class_section = courseService.sectionById(class_section);
			DateFormat dd=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			course = new course();
			course.setClassId(Integer.valueOf(classId));
			course.setSubjectId(subjectId[i]);
			course.setFromTime(dd.parse(date[i]+" "+class_section.getFromTime()));
			course.setEndTime(dd.parse(date[i]+" "+class_section.getToTime()));
			course.setClassSectionId(Integer.valueOf(num[i]));
			course.setAgentUserId(Integer.valueOf(agentUserId));
			
			course course1 = new course();
			course1 = courseService.courseBys(course);
			if(course1!=null){
				course.setCourceId(course1.getCourceId());
				courseService.update(course);
			}else{
				courseService.save(course);
			}
		}
		msg = "保存成功。";
		return "success";
	}
	
	public String departmentByParentIdAjax() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		if(tClass==null){
			tClass = new t_class();
		}
		tClass.setDepartmentId(request.getParameter("parentId").toString());
		list = courseService.classByDepartmentId(tClass);
		return "success";
	}
	//得到分发学生
	public String getStudent() throws Exception{
		if(t_user1 == null){
			t_user1 = new t_user();
		}
//		list = userService.getStudent(t_user1);
//		for(int i=0;i<list.size();i++){
//			System.out.println(((t_user)list.get(i)).getName());
//		}
		t_user1.setData(userService.getStudent(t_user1));
		return "list";
	}
	
	public String courseByParentIdAjax() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		if(course==null){
			course = new course();
		}
		course.setClassId(Integer.valueOf(request.getParameter("parentId").toString()));
		list = courseService.courseByClassId(course);
		return "success";
	}
}
