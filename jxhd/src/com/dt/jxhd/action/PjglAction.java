package com.dt.jxhd.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.dt.jxhd.domain.T_SYS_PARAMETER;
import com.dt.jxhd.domain.department;
import com.dt.jxhd.domain.evaluation_grade;
import com.dt.jxhd.domain.evaluation_item;
import com.dt.jxhd.domain.evaluation_item_grade;
import com.dt.jxhd.domain.evaluation_result;
import com.dt.jxhd.domain.evaluation_student;
import com.dt.jxhd.domain.evalution_comment;
import com.dt.jxhd.domain.evalution_teacher_comment;
import com.dt.jxhd.domain.student;
import com.dt.jxhd.domain.student_group;
import com.dt.jxhd.domain.t_class;
import com.dt.jxhd.domain.t_course_log;
import com.dt.jxhd.domain.t_user;
import com.dt.jxhd.service.iface.ICourseService;
import com.dt.jxhd.service.iface.ILogService;
import com.dt.jxhd.service.iface.IPjglService;
import com.dt.jxhd.service.iface.IUserDetailService;
import com.dt.jxhd.service.iface.IUserService;

public class PjglAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	private evaluation_item evaluationItem;
	
	public evaluation_item getEvaluationItem() {
		return evaluationItem;
	}
	public void setEvaluationItem(evaluation_item evaluationItem) {
		this.evaluationItem = evaluationItem;
	}
	private evaluation_grade evaluationGrade;
	public evaluation_grade getEvaluationGrade() {
		return evaluationGrade;
	}
	public void setEvaluationGrade(evaluation_grade evaluationGrade) {
		this.evaluationGrade = evaluationGrade;
	}
	private evaluation_student evaluationStudent;
	public evaluation_student getEvaluationStudent() {
		return evaluationStudent;
	}
	public void setEvaluationStudent(evaluation_student evaluationStudent) {
		this.evaluationStudent = evaluationStudent;
	}
	private IPjglService pjglService;


	public void setPjglService(IPjglService pjglService) {
		this.pjglService = pjglService;
	}
	private IUserDetailService userDetailService;
	
	public void setUserDetailService(IUserDetailService userDetailService) {
		this.userDetailService = userDetailService;
	}
	private student student;
	public student getStudent() {
		return student;
	}
	public void setStudent(student student) {
		this.student = student;
	}
	private List list;
	public List getList() {
		return list;
	}
	public void setList(List list) {
		this.list = list;
	}
	private t_user t_user1;
	public t_user getT_user1() {
		return t_user1;
	}
	public void setT_user1(t_user t_user1) {
		this.t_user1 = t_user1;
	}
	private IUserService userService;

	public void setUserService(IUserService userService) {
		this.userService = userService;
	}
	private evaluation_result evaluationResult;
	public evaluation_result getEvaluationResult() {
		return evaluationResult;
	}
	public void setEvaluationResult(evaluation_result evaluationResult) {
		this.evaluationResult = evaluationResult;
	}
	private student_group studentGroup;
	public student_group getStudentGroup() {
		return studentGroup;
	}
	public void setStudentGroup(student_group studentGroup) {
		this.studentGroup = studentGroup;
	}
	private String msg;
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	private ICourseService courseService;

	public void setCourseService(ICourseService courseService) {
		this.courseService = courseService;
	}
	public String evaluationItems() throws Exception{
		if(evaluationItem==null){
			evaluationItem = new evaluation_item();
		}
		HttpSession session = ServletActionContext.getRequest().getSession();
		if(session.getAttribute("roles").toString().indexOf("1058,")==-1){
			return "noRight";
		}
		evaluationItem.setRecNum(pjglService.getMaxItemCountNum(evaluationItem));
		evaluationItem.setData(pjglService.items(evaluationItem)); 
		return "list";
	}
	public String toInsertEvaluationItem() throws Exception{
		HttpSession session = ServletActionContext.getRequest().getSession();
		if(session.getAttribute("roles").toString().indexOf("1059,")==-1){
			return "noRight";
		}
		return "insert";
	}
	public String toDianm() throws Exception{
		return "list";
	}
	public String saveEvaluationItem() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if(session.getAttribute("roles").toString().indexOf("1059,")==-1){
			return "noRight";
		}
		pjglService.save(evaluationItem);
		
		evaluationItem.setRecNum(pjglService.getMaxItemCountNum(evaluationItem));
		evaluationItem.setData(pjglService.items(evaluationItem)); 
		return "list";
	}
	public String updateEvaluationItem() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if(session.getAttribute("roles").toString().indexOf("1060,")==-1){
			return "noRight";
		}
		evaluation_item_grade evaluation_item_grade = new evaluation_item_grade();
		evaluation_item_grade.setItemId(evaluationItem.getItemId());
		pjglService.deleteEvaluationItemGrade(evaluation_item_grade);
		if(!evaluationItem.getGradeId().equals("")){
			String gradeIds[] = evaluationItem.getGradeId().split(",");
			for(int i=0;i<gradeIds.length;i++){
				evaluation_item_grade.setGradeId(Integer.valueOf(gradeIds[i]));
				pjglService.save(evaluation_item_grade);
			}
		}
		list = pjglService.itemGrades(evaluation_item_grade);
		evaluationItem.setPageSize(1000);
		evaluationItem.setRecNum(pjglService.getMaxItemCountNum(evaluationItem));
		evaluationItem.setData(pjglService.items(evaluationItem)); 
		return "list";
	}
	public String evaluationItemById() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if(session.getAttribute("roles").toString().indexOf("1060,")==-1){
			return "noRight";
		}
		evaluationItem = pjglService.evaluationById(evaluationItem);
		
		evaluation_item_grade evaluation_item_grade = new evaluation_item_grade();
		evaluation_item_grade.setItemId(evaluationItem.getItemId());
		List list1 = pjglService.itemGrades(evaluation_item_grade);
		
		if(evaluationGrade==null){
			evaluationGrade = new evaluation_grade();
		}
		evaluationGrade.setPageSize(100);
		evaluationGrade.setRecNum(pjglService.getMaxItemCountNum(evaluationGrade));
		evaluationGrade.setData(pjglService.evaluationGrades(evaluationGrade)); 
		
		List list3 = new ArrayList();
		for(int i=0;i<evaluationGrade.getData().size();i++){
			evaluation_grade evaluationGrade1 = (evaluation_grade)evaluationGrade.getData().get(i);
			evaluationGrade1.setPageCtrl(false);
			for(int n=0;n<list1.size();n++){
				evaluation_item_grade evaluation_item_grade1 = (evaluation_item_grade)list1.get(n);
				if(evaluationGrade1.getGradeId().equals(evaluation_item_grade1.getGradeId())){
					evaluationGrade1.setPageCtrl(true);
				}
			}
			list3.add(evaluationGrade1);
		}
		list = list3;
		return "update";
	}
	public String deleteEvaluationItem() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if(session.getAttribute("roles").toString().indexOf("1061,")==-1){
			return "noRight";
		}
		evaluationItem.setRecNum(pjglService.getMaxItemCountNum(evaluationItem)-1);
		evaluationItem.setData(pjglService.deleteItem(evaluationItem)); 
		return "list";
	}
	/* 评价等级 */
	public String evaluationGrades() throws Exception{
		HttpSession session = ServletActionContext.getRequest().getSession();
		if(session.getAttribute("roles").toString().indexOf("1062,")==-1){
			return "noRight";
		}
		if(evaluationGrade==null){
			evaluationGrade = new evaluation_grade();
		}
		evaluationGrade.setRecNum(pjglService.getMaxItemCountNum(evaluationGrade));
		evaluationGrade.setData(pjglService.evaluationGrades(evaluationGrade)); 
		return "list";
	}
	public String toInsertEvaluationGrade() throws Exception{
		HttpSession session = ServletActionContext.getRequest().getSession();
		if(session.getAttribute("roles").toString().indexOf("1076,")==-1){
			return "noRight";
		}
		return "insert";
	}
	public String saveEvaluationGrade() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if(session.getAttribute("roles").toString().indexOf("1076,")==-1){
			return "noRight";
		}  
		pjglService.saveGrade(evaluationGrade);
		
		evaluationGrade.setRecNum(pjglService.getMaxItemCountNum(evaluationGrade));
		evaluationGrade.setData(pjglService.evaluationGrades(evaluationGrade)); 
		return "list";
	}
	public String updateEvaluationGrade() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if(session.getAttribute("roles").toString().indexOf("1077,")==-1){
			return "noRight";
		}
		evaluationGrade.setRecNum(pjglService.getMaxItemCountNum(evaluationGrade));
		evaluationGrade.setData(pjglService.updateGrade(evaluationGrade)); 
		return "list";
	}
	public String evaluationGradeById() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if(session.getAttribute("roles").toString().indexOf("1077,")==-1){
			return "noRight";
		}
		evaluationGrade = pjglService.evaluationGradeById(evaluationGrade);
		return "update";
	}
	public String deleteEvaluationGrade() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if(session.getAttribute("roles").toString().indexOf("1078,")==-1){
			return "noRight";
		}
		evaluationGrade.setRecNum(pjglService.getMaxItemCountNum(evaluationGrade)-1);
		evaluationGrade.setData(pjglService.deleteGrade(evaluationGrade)); 
		return "list";
	}
	public String deleteEvaluationStu() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if(session.getAttribute("roles").toString().indexOf("1028,")==-1){
			return "noRight";
		}
		evaluationResult.setRecNum(pjglService.getMaxEvaluationStuCountNum(evaluationResult)-1);
		evaluationResult.setData(pjglService.deleteEvaluationStu(evaluationResult)); 
		
		if(evaluationItem==null){
			evaluationItem = new evaluation_item();
		}
		evaluationItem.setPageSize(100);
		evaluationItem.setRecNum(pjglService.getMaxItemCountNum(evaluationItem));
		evaluationItem.setData(pjglService.items(evaluationItem)); 
		return "list";
	}
	public String deleteEvaluationGroup() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if(session.getAttribute("roles").toString().indexOf("1031,")==-1){
			return "noRight";
		}
		evaluationResult.setRecNum(pjglService.getMaxEvaluationGroupCountNum(evaluationResult)-1);
		evaluationResult.setData(pjglService.deleteEvaluationGroup(evaluationResult)); 
		
		if(evaluationItem==null){
			evaluationItem = new evaluation_item();
		}
		evaluationItem.setPageSize(100);
		evaluationItem.setRecNum(pjglService.getMaxItemCountNum(evaluationItem));
		evaluationItem.setData(pjglService.items(evaluationItem)); 
		return "list";
	}
	//学生互评结果
	public String evaluationResults() throws Exception{
		if(evaluationResult==null){
			evaluationResult = new evaluation_result();
		}
		if(getSession().getAttribute("roles").toString().indexOf("1026,")==-1){
			return "noRight";
		}
		evaluationResult.setRecNum(pjglService.getMaxEvaluationStuCountNum(evaluationResult));
		evaluationResult.setData(pjglService.EvaluationStus(evaluationResult)); 
		
		if(evaluationItem==null){
			evaluationItem = new evaluation_item();
		}
		evaluationItem.setPageSize(100);
		evaluationItem.setRecNum(pjglService.getMaxItemCountNum(evaluationItem));
		evaluationItem.setData(pjglService.items(evaluationItem)); 
		return "list";
	}
	/**
	 * 学生,老师评论
	 * @author Hman
	 * @date 2016/11/02
	 * */
	private ILogService logService;
	private department department;
	private t_class tClass;
	private T_SYS_PARAMETER t_sys_parameter;
	private t_course_log t_course_log;
	private List list2;
	private evalution_comment t_comment;
	private evalution_teacher_comment t_teacher_comment;
	private evalution_comment t_evalution_comment;
	private Integer comment_tag; // 表示老师点评和学生评论,0表示老师点评,1表示学生评论，3表示是老师
	
	
	public Integer getComment_tag() {
		return comment_tag;
	}
	public void setComment_tag(Integer comment_tag) {
		this.comment_tag = comment_tag;
	}
	public evalution_comment getT_comment() {
		return t_comment;
	}
	public void setT_comment(evalution_comment t_comment) {
		this.t_comment = t_comment;
	}
	public evalution_teacher_comment getT_teacher_comment() {
		return t_teacher_comment;
	}
	public void setT_teacher_comment(evalution_teacher_comment t_teacher_comment) {
		this.t_teacher_comment = t_teacher_comment;
	}
	public List getList2() {
		return list2;
	}
	public void setList2(List list2) {
		this.list2 = list2;
	}
	public department getDepartment() {
		return department;
	}
	public void setDepartment(department department) {
		this.department = department;
	}
	public void setLogService(ILogService logService) {
		this.logService = logService;
	}
	public T_SYS_PARAMETER getT_sys_parameter() {
		return t_sys_parameter;
	}
	public void setT_sys_parameter(T_SYS_PARAMETER t_sys_parameter) {
		this.t_sys_parameter = t_sys_parameter;
	}
	public t_class getTClass() {
		return tClass;
	}

	public void setTClass(t_class class1) {
		tClass = class1;
	}
	public t_course_log getT_course_log() {
		return t_course_log;
	}

	public void setT_course_log(t_course_log t_course_log) {
		this.t_course_log = t_course_log;
	}
	private List list1;

	public List getList1() {
		return list1;
	}

	public void setList1(List list1) {
		this.list1 = list1;
	}
	
	// 跳转到老师点评列表
	public String evaluationTeacher() {
		Cookie cookieComment = null;
//		HttpSession session = ServletActionContext.getRequest().getSession();
		HttpServletResponse response = ServletActionContext.getResponse(); 
		if(isAdmin()){
			cookieComment = new Cookie("cookieComment", "admin_teacher");			
		} else{
			cookieComment = new Cookie("cookieComment", "teacher_teacher");
		}
		response.addCookie(cookieComment);
		setComment_tag(0);
		if(department==null){
			department = new department();
		}
		department.setData(logService.departments(department));
		return "departmentList";
	}
	/**
	 * 老师点评
	 * @author Hman
	 * @date 2016/11/8
	 * */
	public String adminTeacherList() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		if(t_sys_parameter==null){
			t_sys_parameter = new T_SYS_PARAMETER();
		}
		
		if(tClass==null){
			tClass = new t_class();
		}
		if (t_teacher_comment == null) {
			t_teacher_comment = new evalution_teacher_comment();
		}
//		if (getRequest().getParameter("classId").toString() == null) {
	//	System.out.println("classID:" + String.valueOf(t_course_log.getClassId()) + ";" + t_teacher_comment.getClass_id());
		tClass.setDepartmentId(String.valueOf(t_course_log.getClassId()));//具体的部门			
		//得到班级列表
		list = courseService.classByDepartmentId(tClass);
		
		t_sys_parameter.setParameterTypeId("年级");
		t_sys_parameter.setRecNum(logService.getMaxParamCountNum(t_sys_parameter));
		list2 = logService.params(t_sys_parameter);//年级	
	
		
		if(!isAdmin()){
			t_teacher_comment.setTeacher_id((Integer) session.getAttribute("userId"));
			setComment_tag(3);// 3代表是个老师
		}
		t_teacher_comment.setRecNum(pjglService.getTeacherCommentForTeacherCountNum(t_teacher_comment));
		t_teacher_comment.setData(pjglService.getTeacherForTeacherComment(t_teacher_comment));
		return "list";
	}
	
	/**
	 * 老师添加评论
	 * @author Hman
	 * @date 2016/11/11
	 * */
	public String addTeacherComment() {
		if(department==null){
			department = new department();
		}
		department.setData(logService.departments(department));
		return "departmentList";
	}
	
	public String addTeacherCommented() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		if(t_sys_parameter==null){
			t_sys_parameter = new T_SYS_PARAMETER();
		}
		
		if(tClass==null){
			tClass = new t_class();
		}
		if (t_teacher_comment == null) {
			t_teacher_comment = new evalution_teacher_comment();
		}
		tClass.setDepartmentId(String.valueOf(t_course_log.getClassId()));//具体的部门			
		//得到班级列表
		list = courseService.classByDepartmentId(tClass);
		
		t_sys_parameter.setParameterTypeId("年级");
		t_sys_parameter.setRecNum(logService.getMaxParamCountNum(t_sys_parameter));
		list2 = logService.params(t_sys_parameter);//年级	
	
		if (t_user1 == null) {
			t_user1 = new t_user();
		}
		if(getRequest().getParameter("classId")!=null){
			t_user1.setClassId(Integer.valueOf(getRequest().getParameter("classId").toString()));
		}else{
			t_user1.setClassId(0);
		}
		list1 = userService.getStudent(t_user1);
		
		return "add";
	}
	
	/**
	 * 添加老师评论
	 * @author Hman
	 * @date 2016/11/13
	 * */
	public String addCommentByTeacher() {
		// TODO Auto-generated method stub
		HttpSession session = ServletActionContext.getRequest().getSession();
		if(department==null){
			department = new department();
		}
		setComment_tag(0);
		department.setData(logService.departments(department));
		if (t_teacher_comment == null) {
			t_teacher_comment = new evalution_teacher_comment();
		}
		
		if (t_evalution_comment == null) {
			t_evalution_comment = new evalution_comment();
		}
		int classID = t_teacher_comment.getClass_id();
		if (t_teacher_comment.getStudentTo_id() != null) {
			int studentToID = t_teacher_comment.getStudentTo_id();
		}
		
		String comment = t_teacher_comment.getComment();
		String grade = t_teacher_comment.getGrade();
		int teacherID = (Integer) session.getAttribute("userId");
		
		t_teacher_comment.setTeacher_id(teacherID);
		int commentID = pjglService.selectTeacherComment(t_teacher_comment);
		
		System.out.println("-----classID:" + classID + ";comment:" + comment + ";grade:" + grade
				+";commentID:" + commentID);
		
		if(commentID > 0) {
			t_teacher_comment.setComment_id(commentID);
			t_evalution_comment.setId(commentID);
			t_evalution_comment.setComment(comment);
			t_evalution_comment.setGrade(Integer.valueOf(grade));
			pjglService.updateTeacherComment(t_evalution_comment);// 更新评论表
		} else {
//			t_evalution_comment.setId(pjglService.insertTeacherComment(t_teacher_comment));// 插入评论表
			//System.out.println("t_teacher_comment.getId():" + pjglService.insertTeacherComment(t_teacher_comment));
			int id = pjglService.insertTeacherComment(t_teacher_comment);
			t_teacher_comment.setComment_id(id);
			System.out.println("----id: ---" + id);
			t_teacher_comment = pjglService.insertCommentByTeacher(t_teacher_comment);
		}
		return "list";
	}
	
	/**
	 * 跳转学生评论
	 * @author Hman
	 * @date 2016/11/8
	 * */
	public String evaluationStudent() {
		Cookie cookieComment = null;
		HttpServletResponse response = ServletActionContext.getResponse(); 
		if(isAdmin()){
			cookieComment = new Cookie("cookieComment", "admin_teacher");			
		} else{
			cookieComment = new Cookie("cookieComment", "teacher_teacher");
		}
		response.addCookie(cookieComment);
		setComment_tag(1);
		if(department==null){
			department = new department();
		}
		department.setData(logService.departments(department));
		
		return "departmentList";
	}
	
	public String studentCommentList() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		if(t_sys_parameter==null){
			t_sys_parameter = new T_SYS_PARAMETER();
		}
		
		if(tClass==null){
			tClass = new t_class();
		}
		if (t_teacher_comment == null) {
			t_teacher_comment = new evalution_teacher_comment();
		}
//		if (getRequest().getParameter("classId").toString() == null) {
//		System.out.println("classID:" + String.valueOf(t_course_log.getClassId()) + ";" + t_teacher_comment.getClass_id());
		tClass.setDepartmentId(String.valueOf(t_course_log.getClassId()));//具体的部门			
		//得到班级列表
		list = courseService.classByDepartmentId(tClass);
		
		t_sys_parameter.setParameterTypeId("年级");
		t_sys_parameter.setRecNum(logService.getMaxParamCountNum(t_sys_parameter));
		list2 = logService.params(t_sys_parameter);//年级	

		int tag = t_teacher_comment.getTag();
		if (tag == 3) {
			// 查看被评价学生的情况
			t_teacher_comment.setRecNum(pjglService.getBeCommentStudentCountNum(t_teacher_comment));
			t_teacher_comment.setData(pjglService.getBeCommentStudentList(t_teacher_comment));			
		} else if (tag == 2) {
			if(!isAdmin()){
				t_teacher_comment.setTeacher_id((Integer) session.getAttribute("userId"));
				t_teacher_comment.setRecNum(pjglService.getBeCommentTeacherSelfCountNum(t_teacher_comment));
				t_teacher_comment.setData(pjglService.getBeCommentTeacherSelfList(t_teacher_comment));
				return "teacherlist";
			} else {
				t_teacher_comment.setRecNum(pjglService.getBeCommentTeacherCountNum(t_teacher_comment));
				t_teacher_comment.setData(pjglService.getBeCommentTeacherList(t_teacher_comment));
				return "adminlist";
			}
		}
		return "list";
	}
	
	/**
	 * 查看被评价的学生信息
	 * */
	public String lookTheCommentedStudent() {
		if (t_teacher_comment == null) {
			t_teacher_comment = new evalution_teacher_comment();
		}
//		t_teacher_comment.setRecNum(pjglService.getBeCommentTeacherCountNum(t_teacher_comment));
		t_teacher_comment.setData(pjglService.getLookStudentBeCommented(t_teacher_comment));
		return "look";
	}
	
	public String classTeacherList() {
		String classId = getRequest().getParameter("classId").toString();
		HttpSession session = ServletActionContext.getRequest().getSession();
		if (t_teacher_comment == null) {
			t_teacher_comment = new evalution_teacher_comment();
		}
		t_teacher_comment.setClass_id(Integer.valueOf(classId));
		t_teacher_comment.setTag(0);
		if(!isAdmin()){
			t_teacher_comment.setTeacher_id((Integer) session.getAttribute("userId"));
		}
		t_teacher_comment.setRecNum(pjglService.getTeacherCommentForTeacherCountNum(t_teacher_comment));
		t_teacher_comment.setData(pjglService.getTeacherForTeacherComment(t_teacher_comment));
		return "success";
	}
	
	/**
	 * 设置Cookie
	 * */
	public void setCookieName(String cookieValue) {
		 
	}
	
	/**
	 * 是否是管理员
	 * */
	public boolean isAdmin() {
		HttpSession session = ServletActionContext.getRequest().getSession();
//		System.out.println("roles:" + session.getAttribute("roles").toString());
		if (session.getAttribute("roles").toString().indexOf("1004,") == -1) {
			return false;
		} else {
			return true;
		}
			
//		return (session.getAttribute("roles").toString().indexOf("1004,") == 1) ? true : false;
	}
	
	//组间互评结果
	public String evaluationGroups() throws Exception{
		if(evaluationResult==null){
			evaluationResult = new evaluation_result();
		}
		HttpSession session = ServletActionContext.getRequest().getSession();
		if(session.getAttribute("roles").toString().indexOf("1029,")==-1){
			return "noRight";
		}
		evaluationResult.setRecNum(pjglService.getMaxEvaluationGroupCountNum(evaluationResult));
		evaluationResult.setData(pjglService.EvaluationGroups(evaluationResult)); 
		
		if(evaluationItem==null){
			evaluationItem = new evaluation_item();
		}
		evaluationItem.setPageSize(100);
		evaluationItem.setRecNum(pjglService.getMaxItemCountNum(evaluationItem));
		evaluationItem.setData(pjglService.items(evaluationItem)); 
		return "list";
	}
	
	public String toInsertEvaluationStu() throws Exception{
		HttpSession session = ServletActionContext.getRequest().getSession();
		if(session.getAttribute("roles").toString().indexOf("1027,")==-1){
			return "noRight";
		}
		if(evaluationItem==null){
			evaluationItem = new evaluation_item();
		}
		evaluationItem.setPageSize(100);
		evaluationItem.setRecNum(pjglService.getMaxItemCountNum(evaluationItem));
		evaluationItem.setData(pjglService.items(evaluationItem)); 
		
		if(evaluationGrade==null){
			evaluationGrade = new evaluation_grade();
		}
		evaluationGrade.setPageSize(100);
		evaluationGrade.setRecNum(pjglService.getMaxItemCountNum(evaluationGrade));
		evaluationGrade.setData(pjglService.evaluationGrades(evaluationGrade)); 
		
		if(t_user1==null){
			t_user1 = new t_user();
		}
		t_user1.setPageSize(100);
		t_user1.setIsTeacher(0);
		if(session.getAttribute("classId")!=null){
			t_user1.setClassId(Integer.valueOf(session.getAttribute("classId").toString()));
		}else{
			t_user1.setClassId(0);
		}
		t_user1.setRecNum(userService.getMaxFileCountNum(t_user1));
		list = userService.users(t_user1);
		return "insert";
	}
	public String toInsertEvaluationGroup() throws Exception{
		HttpSession session = ServletActionContext.getRequest().getSession();
		if(session.getAttribute("roles").toString().indexOf("1030,")==-1){
			return "noRight";
		}
		if(evaluationItem==null){
			evaluationItem = new evaluation_item();
		}
		evaluationItem.setPageSize(100);
		evaluationItem.setRecNum(pjglService.getMaxItemCountNum(evaluationItem));
		evaluationItem.setData(pjglService.items(evaluationItem)); 
		
		if(evaluationGrade==null){
			evaluationGrade = new evaluation_grade();
		}
		evaluationGrade.setPageSize(100);
		evaluationGrade.setRecNum(pjglService.getMaxItemCountNum(evaluationGrade));
		evaluationGrade.setData(pjglService.evaluationGrades(evaluationGrade)); 
		
		if(studentGroup==null){
			studentGroup = new student_group();
		}
		studentGroup.setPageSize(100);
		list = userService.groups(studentGroup);
		return "insert";
	}
	public String gradeByItemIdAjax() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = ServletActionContext.getRequest().getSession();
		String studentId1 = session.getAttribute("userId").toString();
		String itemId = request.getParameter("itemId");
		evaluation_grade evaluation_grade = new evaluation_grade(); 
		evaluation_grade.setGradeId(Integer.valueOf(itemId));
		list = pjglService.evaluationGradeByItemId(evaluation_grade);
		return "success";
	}
	public String saveEvaluationStuAjax() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = ServletActionContext.getRequest().getSession();
		if(session.getAttribute("roles").toString().indexOf("1027,")==-1){
			return "noRight";
		}
		String studentId1 = session.getAttribute("userId").toString();
		String studentId[] = request.getParameter("studentId").split(",");
		String gradeId[] = request.getParameter("gradeId").split(",");
		String itemId = request.getParameter("itemId");
		t_course_log t_course_log = new t_course_log();
		t_course_log.setUserId(Integer.valueOf(session.getAttribute("userId").toString()));
		t_course_log = courseService.courseLogNew(t_course_log);
		
		for(int i=0;i<gradeId.length;i++){
			evaluationResult = new evaluation_result();
			evaluationResult.setUserId(studentId1);
			evaluationResult.setGradeId(gradeId[i]);
			evaluationResult.setItemId(itemId);
			evaluationResult.setBeUserId(studentId[i]);
			evaluationResult.setCreateTime(new Date());
			evaluationResult.setCourseId(t_course_log.getCourseId());
			evaluationResult.setBeGroupId(0);
			evaluationResult.setEvaluationType(0);
			pjglService.saveEvaluationRes(evaluationResult);
		}
		msg = "评价成功。";
		return "success";
	}
	public String saveEvaluationGroupAjax() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = ServletActionContext.getRequest().getSession();
		if(session.getAttribute("roles").toString().indexOf("1030,")==-1){
			return "noRight";
		}
		String studentId1 = session.getAttribute("userId").toString();
		String groupId[] = request.getParameter("studentId").split(",");
		String gradeId[] = request.getParameter("gradeId").split(",");
		String itemId = request.getParameter("itemId");
		
		for(int i=0;i<gradeId.length;i++){
			evaluationResult = new evaluation_result();
			evaluationResult.setUserId(studentId1);
			evaluationResult.setGradeId(gradeId[i]);
			evaluationResult.setItemId(itemId);
			evaluationResult.setBeGroupId(Integer.valueOf(groupId[i]));
			evaluationResult.setCreateTime(new Date());
			evaluationResult.setBeUserId("0");
			evaluationResult.setEvaluationType(1);
			pjglService.saveEvaluationRes(evaluationResult);
		}
		
		msg = "评价成功。";
		return "success";
	}
	
}
