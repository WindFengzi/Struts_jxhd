package com.dt.jxhd.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.ServletActionContext;

import test.MyThread;

import com.dt.jxhd.domain.JXHD_QuestionPaper;
import com.dt.jxhd.domain.JXHD_SEL;
import com.dt.jxhd.domain.JXHD_shijuan;
import com.dt.jxhd.domain.T_SYS_PARAMETER;
import com.dt.jxhd.domain.answer_log;
import com.dt.jxhd.domain.ask_log;
import com.dt.jxhd.domain.ask_question;
import com.dt.jxhd.domain.course;
import com.dt.jxhd.domain.department;
import com.dt.jxhd.domain.error_dispatcher;
import com.dt.jxhd.domain.group_error;
import com.dt.jxhd.domain.preview;
import com.dt.jxhd.domain.preview_add;
import com.dt.jxhd.domain.preview_send;
import com.dt.jxhd.domain.student_group;
import com.dt.jxhd.domain.subject;
import com.dt.jxhd.domain.t_class;
import com.dt.jxhd.domain.t_course_log;
import com.dt.jxhd.domain.t_user;
import com.dt.jxhd.domain.test_item;
import com.dt.jxhd.domain.userDetail;
import com.dt.jxhd.service.iface.ICourseService;
import com.dt.jxhd.service.iface.ILogService;
import com.dt.jxhd.service.iface.IQuestionService;
import com.dt.jxhd.service.iface.IUserDetailService;
import com.dt.jxhd.service.iface.IUserService;

public class QuestionAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	
	private error_dispatcher error_dispatcher;
	
	
	public error_dispatcher getError_dispatcher() {
		return error_dispatcher;
	}

	public void setError_dispatcher(error_dispatcher error_dispatcher) {
		this.error_dispatcher = error_dispatcher;
	}


	private group_error group_error;
	
	public group_error getGroup_error() {
		return group_error;
	}

	public void setGroup_error(group_error group_error) {
		this.group_error = group_error;
	}


	private subject subject;
	
	public subject getSubject() {
		return subject;
	}

	public void setSubject(subject subject) {
		this.subject = subject;
	}


	private Integer number_group;//随机分组，每组的人数
	
	public Integer getNumber_group() {
		return number_group;
	}

	public void setNumber_group(Integer number_group) {
		this.number_group = number_group;
	}


	private preview preview;
	
	public preview getPreview() {
		return preview;
	}

	public void setPreview(preview preview) {
		this.preview = preview;
	}


	private t_course_log t_course_log;
	public t_course_log getT_course_log() {
		return t_course_log;
	}

	public void setT_course_log(t_course_log t_course_log) {
		this.t_course_log = t_course_log;
	}

	
	private t_class tClass;
	public t_class getTClass() {
		return tClass;
	}

	public void setTClass(t_class class1) {
		tClass = class1;
	}
	
	
	
	
	private test_item testItem;
	
	public test_item getTestItem() {
		return testItem;
	}
	public void setTestItem(test_item testItem) {
		this.testItem = testItem;
	}
	private JXHD_SEL JXHD_SEL;
	public JXHD_SEL getJXHD_SEL() {
		return JXHD_SEL;
	}
	public void setJXHD_SEL(JXHD_SEL jxhd_sel) {
		JXHD_SEL = jxhd_sel;
	}
	private IQuestionService questionService;

	public void setQuestionService(IQuestionService questionService) {
		this.questionService = questionService;
	}
	private JXHD_shijuan JXHD_shijuan;

	public JXHD_shijuan getJXHD_shijuan() {
		return JXHD_shijuan;
	}

	public void setJXHD_shijuan(JXHD_shijuan jxhd_shijuan) {
		JXHD_shijuan = jxhd_shijuan;
	}
	private JXHD_QuestionPaper JXHD_QuestionPaper;

	public JXHD_QuestionPaper getJXHD_QuestionPaper() {
		return JXHD_QuestionPaper;
	}


	public void setJXHD_QuestionPaper(JXHD_QuestionPaper questionPaper) {
		JXHD_QuestionPaper = questionPaper;
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
	private ask_log askLog;

	public ask_log getAskLog() {
		return askLog;
	}
	public void setAskLog(ask_log askLog) {
		this.askLog = askLog;
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
	private answer_log answerLog;
	public answer_log getAnswerLog() {
		return answerLog;
	}
	public void setAnswerLog(answer_log answerLog) {
		this.answerLog = answerLog;
	}
	private int isRight;
	private int isWrong;
	private int qingjia;
	public int getIsRight() {
		return isRight;
	}
	public void setIsRight(int isRight) {
		this.isRight = isRight;
	}
	public int getIsWrong() {
		return isWrong;
	}
	public void setIsWrong(int isWrong) {
		this.isWrong = isWrong;
	}
	public int getQingjia() {
		return qingjia;
	}
	public void setQingjia(int qingjia) {
		this.qingjia = qingjia;
	}
	private ICourseService courseService;

	public void setCourseService(ICourseService courseService) {
		this.courseService = courseService;
	}
	private File[] upload;
	public File[] getUpload() {
		return upload;
	}
	public void setUpload(File[] upload) {
		this.upload = upload;
	}
	private static final int BUFFER_SIZE=16*1024;
	private String[] uploadFileName;
	private String[] uploadContentType;
	
	public String[] getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String[] uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public String[] getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String[] uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	
	private String savePath;
	public String getSavePath() {
		return savePath;
	}
	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}
	private ILogService logService;

	public void setLogService(ILogService logService) {
		this.logService = logService;
	}
	private department department;
	public department getDepartment() {
		return department;
	}
	public void setDepartment(department department) {
		this.department = department;
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
	public List getList() {
		return list;
	}
	public void setList(List list) {
		this.list = list;
	}
	public List getList1() {
		return list1;
	}
	public void setList1(List list1) {
		this.list1 = list1;
	}
	private String msg;
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	private student_group student_group;
	public student_group getStudent_group() {
		return student_group;
	}
	public void setStudent_group(student_group student_group) {
		this.student_group = student_group;
	}
	private T_SYS_PARAMETER t_sys_parameter;
	public T_SYS_PARAMETER getT_sys_parameter() {
		return t_sys_parameter;
	}
	public void setT_sys_parameter(T_SYS_PARAMETER t_sys_parameter) {
		this.t_sys_parameter = t_sys_parameter;
	}
	
	private ask_question t_ask_question;
	
	public ask_question getT_ask_question() {
		return t_ask_question;
	}

	public void setT_ask_question(ask_question t_ask_question) {
		this.t_ask_question = t_ask_question;
	}

	/**
	 * @author Hman
	 * @date 2016/12/08
	 * 老师每次获取学生问答列表
	 * */
	public String askQuestionsByStudent() throws Exception{
		// TODO Auto-generated method stub
		System.out.println("------------");
		HttpSession session = ServletActionContext.getRequest().getSession();
		if(t_ask_question==null){
			t_ask_question = new ask_question();
		}
		t_ask_question.setTeacher_id((Integer) session.getAttribute("userId"));
		System.out.println("askQuestionsByStudent:" + session.getAttribute("userId"));
		t_ask_question.setRecNum(questionService.getAskQueCountNum(t_ask_question));
		List<ask_question> lists = questionService.askQueItems(t_ask_question);
		t_ask_question.setData(lists);
		return "list";
	}
	
	public String daiding() {
		System.out.println("------------");
		HttpSession session = ServletActionContext.getRequest().getSession();
		t_ask_question.setTeacher_id((Integer) session.getAttribute("userId"));
		System.out.println("askQuestionsByStudent:" + session.getAttribute("userId"));
		t_ask_question.setRecNum(questionService.getAskQueCountNum(t_ask_question));
		List<ask_question> lists = questionService.askQueItems(t_ask_question);
		t_ask_question.setData(lists);
		return "list";
	}
	
	//试题管理
	public String items() throws Exception{
		if(getSession().getAttribute("roles").toString().indexOf("1046,")==-1){
			return "noRight";
		}
		if(testItem==null){
			testItem = new test_item();
		}
		testItem.setChoiceg(null);//没用用
		testItem.setRecNum(questionService.getMaxItemCountNum(testItem));
		testItem.setData(questionService.items(testItem)); 
		return "list";
	}
	//插入试题，跳转
	public String toInsertItem() throws Exception{
		if(getSession().getAttribute("roles").toString().indexOf("1047,")==-1){
			return "noRight";
		}
		return "insert";
	}
	//插入试题
	public String saveItem() throws Exception{
		if(getSession().getAttribute("roles").toString().indexOf("1047,")==-1){
			return "noRight";
		}
		File[] srcFiles = this.getUpload();
		Date date = new Date();
        SimpleDateFormat sdf =   new SimpleDateFormat("yyyyMMddHHmmss");
        String path = sdf.format(date);
        String path1 = "";
        List<String> successFileList=new ArrayList<String>();
		if(srcFiles!=null){
        	for (int i = 0; i < srcFiles.length; i++) {   
            	String path2 = path+String.valueOf(i)+"."+uploadFileName[i].substring(uploadFileName[i].lastIndexOf(".")+1,uploadFileName[i].length());
                String dstPath = getRealyPath(getSavePath())   
                        + "\\" + path+String.valueOf(i)+"."+uploadFileName[i].substring(uploadFileName[i].lastIndexOf(".")+1,uploadFileName[i].length());
                File dstFile = new File(dstPath);   
                if(copy(srcFiles[i], dstFile)){
                      successFileList.add(getUploadFileName()[i]);
                }
                path1 = path1+path2+",";
            }
        }
		if(!path1.equals("")){
			testItem.setPicUrl(path1.substring(0,path1.length()-1));
        }
		questionService.save(testItem);
		testItem.setChoiceg(null);
		testItem.setRecNum(questionService.getMaxItemCountNum(testItem));
		testItem.setData(questionService.items(testItem)); 
		return "list";
	}
	//更新试题
	public String updateItem() throws Exception{
		if(getSession().getAttribute("roles").toString().indexOf("1048,")==-1){
			return "noRight";
		}
		File[] srcFiles = this.getUpload();
		Date date = new Date();
        SimpleDateFormat sdf =   new SimpleDateFormat("yyyyMMddHHmmss");
        String path = sdf.format(date);
        String path1 = "";
        List<String> successFileList=new ArrayList<String>();
		if(srcFiles!=null){
        	for (int i = 0; i < srcFiles.length; i++) {   
            	String path2 = path+String.valueOf(i)+"."+uploadFileName[i].substring(uploadFileName[i].lastIndexOf(".")+1,uploadFileName[i].length());
                String dstPath = getRealyPath(getSavePath())   
                        + "\\" + path+String.valueOf(i)+"."+uploadFileName[i].substring(uploadFileName[i].lastIndexOf(".")+1,uploadFileName[i].length());
                File dstFile = new File(dstPath);   
                if(copy(srcFiles[i], dstFile)){
                      successFileList.add(getUploadFileName()[i]);
                }
                path1 = path1+path2+",";
            }
        }
		if(!path1.equals("")){
			testItem.setPicUrl(path1.substring(0,path1.length()-1));
        }
		questionService.update(testItem);
		testItem.setChoiceg(null);
		testItem.setRecNum(questionService.getMaxItemCountNum(testItem));
		testItem.setData(questionService.items(testItem)); 
		return "list";
	}

	public String itemById() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if(session.getAttribute("roles").toString().indexOf("1048,")==-1){
			return "noRight";
		}
		testItem = questionService.itemById(testItem);
		return "update";
	}
	public String deletePath() throws Exception{
		HttpSession session = ServletActionContext.getRequest().getSession();
		testItem = questionService.itemById(testItem);
		testItem.setPicUrl("");
		questionService.update(testItem);
		return "update";
	}
	public String itemByIdView() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		testItem = questionService.itemById(testItem);
		return "view";
	}
	public String deleteItem() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if(session.getAttribute("roles").toString().indexOf("1049,")==-1){
			return "noRight";
		}
		testItem.setChoiceg(null);
		testItem.setRecNum(questionService.getMaxItemCountNum(testItem)-1);
		testItem.setData(questionService.deleteItem(testItem)); 
		return "list";
	}
	
	//题目问答：既问解答、抢答活动，挑人作答，挑组作答
	public String asks() throws Exception{
		if(getSession().getAttribute("roles").toString().indexOf("1014,")==-1){
			return "noRight";
		}
		if(askLog==null){
			askLog = new ask_log();
		}
		//根据不同的类型获取不同类型的题目数量
		askLog.setRecNum(questionService.getMaxAskCountNum(askLog));
		askLog.setData(questionService.asks(askLog)); 
		return "list";
	}
	
	//添加问答
	public String toSelectItems() throws Exception{
		HttpSession session = ServletActionContext.getRequest().getSession();
		if(session.getAttribute("roles").toString().indexOf("1015,")==-1){
			return "noRight";
		}
		if(testItem==null){
			testItem = new test_item();
		}
		System.out.println("l1");
		if(askLog.getAskType()!=null){
			System.out.println("l2");
			if(askLog.getAskType().equals(4)){
				testItem.setQuestiontype("4");
			}else{
				testItem.setChoiceg("4");
			}
		}
		testItem.setRecNum(questionService.getMaxItemCountNum(testItem));
		testItem.setData(questionService.items(testItem)); 
		return "list";
	}
	
	//添加预习问答
	public String toPreviewSelectItems() throws Exception{
		HttpSession session = ServletActionContext.getRequest().getSession();
		if(session.getAttribute("roles").toString().indexOf("1015,")==-1){
			return "noRight";
		}
		if(testItem==null){
			testItem = new test_item();
		}
		
		testItem.setRecNum(questionService.getMaxItemCountNum(testItem));
		testItem.setData(questionService.items(testItem)); 
		return "list";
	}
	
	/**
	 * preview_add表对象
	 * @date 2016/10/10
	 * */
	private preview_add t_preview_add; // preview_add表
	private preview_send t_preview_send; // preview_send表
	
	public preview_add getT_preview_add() {
		return t_preview_add;
	}

	public void setT_preview_add(preview_add t_preview_add) {
		this.t_preview_add = t_preview_add;
	}

	public preview_send getT_preview_send() {
		return t_preview_send;
	}

	public void setT_preview_send(preview_send t_preview_send) {
		this.t_preview_send = t_preview_send;
	}

	/**
	 * 跳转到添加预习界面
	 * @author Hman
	 * @date 2016/10/10
	 * */
	public String toPreviewItems() throws Exception{
		HttpSession session = ServletActionContext.getRequest().getSession();
		if(session.getAttribute("roles").toString().indexOf("1080")==-1){
			return "noRight";
		}	
		return "add";
	}
	
	/**
	 * 添加预习内容到preview_add表
	 * @throws UnsupportedEncodingException preview_add的内容转化错,出现乱码
	 * */
	public String addPreview() {
		// TODO Auto-generated method stub
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
//		if (session.getAttribute("roles").toString().indexOf("1068,") == -1) {
//			return "noRight";
//		}
		
		System.out.println("upload:" + upload);
		System.out.println("uploadFileName:" + uploadFileName);
		System.out.println("savePath:" + savePath);
		System.out.println("uploadContentType:" + uploadContentType);
		
		String title = t_preview_add.getPreview_title().trim();
		t_preview_add.setPreview_title(title);
		String content_1 = t_preview_add.getPreview_content();
		if (!title.equals("") || title != "" || title.length() < 80 || content_1.length() < 300) {
		//	String content_begin = new String(t_preview_add.getPreview_content().getBytes("iso-8859-1"),"utf-8");
		//	System.out.println("content---" + content_begin);
		//	t_preview_add.setPreview_content(content_begin);
			if (upload == null || uploadFileName == null){
				t_preview_add.setPreview_tag(0);
			} else {
				
				File[] fjFiles = this.getUpload();
				String path1 = "";
				
				List<String> successFileList1=new ArrayList<String>();   
				if(fjFiles!=null){
					for (int i = 0; i < fjFiles.length; i++) {   
						String path2 = uploadFileName[i];
						String dstPath = getRealyPath(getSavePath())   
								+ "\\" +uploadFileName[i];
						File dstFile = new File(dstPath);   
						if(copy(fjFiles[i], dstFile)){//调用copy静态方法，文件复制操作
							successFileList1.add(getUploadFileName()[i]);
						}
						path1 = path1+path2+",";
					}
				}
				
				System.out.println("path1:" + path1);
				if(!path1.equals("")){
					String content = path1.substring(0,path1.length()-1) + "__" + t_preview_add.getPreview_content();
					t_preview_add.setPreview_content(content);
				}
				t_preview_add.setPreview_tag(1);
			}
			int teacherId = (Integer) session.getAttribute("userId");
//		    System.out.println(" teacherId---" + teacherId);
			t_preview_add.setCreate_time(new Date());
			t_preview_add.setTeacher_id(teacherId);
			
			questionService.addPreview(t_preview_add);
			if(department==null){
				department = new department();
			}
			department.setData(logService.departments(department));
		}
		return "list";
	}
	
	/**
	 * 跳转到发布预习内容列表
	 * 得到部门id
	 * */
	public String toReleasePreview() {
		// TODO
		if(department==null){
			department = new department();
		}
		department.setData(logService.departments(department));
		return "tolist";
	}

	/**
	 * 获得班级和预习列表
	 * */
	public String releasePreview() throws Exception{
		HttpSession session = ServletActionContext.getRequest().getSession();
		if(t_sys_parameter==null){
			t_sys_parameter = new T_SYS_PARAMETER();
		}
		
		if(tClass==null){
			tClass = new t_class();
		}
//		System.out.println("---classId---" + t_course_log.getClassId().toString());
		tClass.setDepartmentId(String.valueOf(t_course_log.getClassId()));//具体的部门
		//得到班级列表
		list = courseService.classByDepartmentId(tClass);
		
		t_sys_parameter.setParameterTypeId("年级");
		t_sys_parameter.setRecNum(logService.getMaxParamCountNum(t_sys_parameter));
		list2 = logService.params(t_sys_parameter);//年级		
		
		if(t_preview_add==null){
			t_preview_add = new preview_add();
		}
		t_preview_add.setTeacher_id((Integer) session.getAttribute("userId"));
//		System.out.println("add:topnum--->" + t_preview_add.getTopNum() +
//				"pageNo:" + t_preview_add.getPageNo() + "pageSize:" + t_preview_add.getPageSize());
		
		t_preview_add.setRecNum(questionService.getPreviewCountNum(t_preview_add));
		
		List<preview_add> items = questionService.previewItems(t_preview_add);
		List<preview_add> lists = new ArrayList<preview_add>();
		for (preview_add object : items) {
			String content = object.getPreview_content();
			if (content.contains("__")) {
				String[] content1 = content.split("__");
//				System.out.println("content1---" + content1.length);
				if(content1.length <= 1) {
					object.setPreview_content("");
				} else {
					object.setPreview_content(content.split("__")[1]);					
				}
			}
			lists.add(object);
		}
//		t_preview_add.setData(questionService.previewItems(t_preview_add));
		t_preview_add.setData(lists);
		return "list";
	}
	
	/**
	 * 无效
	 * */
	public String previewSelectItems() throws Exception{
		HttpSession session = ServletActionContext.getRequest().getSession();
		if(session.getAttribute("roles").toString().indexOf("1015,")==-1){
			return "noRight";
		}
		if(t_preview_add==null){
			t_preview_add = new preview_add();
		}
		t_preview_add.setTeacher_id((Integer) session.getAttribute("userId"));
		
		t_preview_add.setRecNum(questionService.getPreviewCountNum(t_preview_add));
		t_preview_add.setData(questionService.previewItems(t_preview_add)); 
		
		return "list";
	}
	
	/**
	 * 老师将选择好的预习添加到preview_send表
	 * */
	public String addPreviewToSend() {
//		System.out.println("---tamp_id:" + t_preview_send.getTemp_id().toString()
//				+ ";" + t_preview_add.getAdd_ids().toString());
//		---tamp_id:2052;16,15,13,12,
		String addIds = t_preview_add.getAdd_ids();
		List<Integer> ids = new ArrayList<Integer>();
		if(t_preview_send.getTemp_id().toString() != "" || !("").equals(t_preview_send.getTemp_id().toString())) {
			if (addIds != null) {
				for (int i = 0; i < addIds.split(",").length; i++) {
					ids.add(Integer.valueOf(addIds.split(",")[i]));
					t_preview_send.setPreview_add_id(Integer.valueOf(addIds.split(",")[i]));
					if(questionService.selectCommon(t_preview_send) > 0) {
						
					} else {
						t_preview_send.setSend_time(new Date());
						t_preview_send.setTemp_tag(0); // 0表示班级
						questionService.insertPreviewSent(t_preview_send);					
					}
					
				}
			}
		}
		return "list";
	}
	
	/**
	 * 老师查看发布过的预习记录
	 * */
	public String toReleasePreviewLogList() {
		if(department==null){
			department = new department();
		}
		department.setData(logService.departments(department));		
		return "list";
	}
	
	public String releasePreviewLogList() {
		HttpSession session = ServletActionContext.getRequest().getSession();
	
		if(tClass==null){
			tClass = new t_class();
		}
		
		tClass.setDepartmentId(String.valueOf(t_course_log.getClassId()));//具体的部门
		//得到班级列表
		list = courseService.classByDepartmentId(tClass);
		
		if(t_preview_send == null){
			t_preview_send = new preview_send();
		}
		
//		System.out.println("topNum--->" +t_preview_send.getTemp_id()+ ""+t_preview_send.getClass_name()+
//				"classId:" + tClass.getClassId()+"className:" + tClass.getClassName());
		
		t_preview_send.setTeacher_id((Integer) session.getAttribute("userId"));
		
		t_preview_send.setRecNum(questionService.getPreviewCountNum(t_preview_send));
		
		List<preview_send> items = questionService.previewItems(t_preview_send);
		List<preview_send> lists = new ArrayList<preview_send>();
		for (preview_send object : items) {
			String content = object.getPreview_content();
			if (content.contains("__")) {
				//object.setPreview_content(content.split("__")[1]);
				String[] content1 = content.split("__");
//				System.out.println("content1---" + content1.length);
				if(content1.length <= 1) {
					object.setPreview_content("");
				} else {
					object.setPreview_content(content.split("__")[1]);					
				}
			}
			lists.add(object);
		}

		t_preview_send.setData(lists);
//		t_preview_send.setData(questionService.previewItems(t_preview_send)); 

		return "list";
	}
	
	/**
	 *	删除预习内容
	 * */
	public String deletePreview() throws Exception{
		HttpSession session = ServletActionContext.getRequest().getSession();
		if(t_preview_send == null){
			t_preview_send = new preview_send();
		}
		System.out.println("sendID:"+t_preview_send.getPreview_send_id());
		boolean istag = questionService.deletePreviewSend(t_preview_send);
		if (istag) {
			if(tClass==null){
				tClass = new t_class();
			}
			
			tClass.setDepartmentId(String.valueOf(1));//具体的部门
			//得到班级列表
			list = courseService.classByDepartmentId(tClass);
			t_preview_send.setTeacher_id((Integer) session.getAttribute("userId"));
			
			t_preview_send.setRecNum(questionService.getPreviewCountNum(t_preview_send));
			t_preview_send.setData(questionService.previewItems(t_preview_send)); 
		}
		return "delete";
	}
	
	/**
	 * 查看预习内容
	 * @date 2016/10/13
	 * */
	public String seePreviewSend() {
		System.out.println("id1:" + t_preview_send.getPreview_send_id());
		if(t_preview_send == null){
			t_preview_send = new preview_send();
		}
//		System.out.println("id2:" + t_preview_send.getPreview_send_id());
		t_preview_send = questionService.selectLookPrevieqLog(t_preview_send);
		if (t_preview_send.getPreview_tag() == 1) {
			String content = t_preview_send.getPreview_content();
			if (content.contains("__")) {
				String[] content1 = content.split("__");
				if (content.split("__")[0].contains(".png") || content.split("__")[0].contains(".jpg")) {
					String dstPath = getRealyPath("/upload")   
							+ "\\" +content.split("__")[0];
//					System.out.println("dstPath------:" + dstPath);
					File dstFile = new File(dstPath);
					if (dstFile.exists()) {
						t_preview_send.setUrl("/jxhd/upload/" + content.split("__")[0]);
					}
				}
				
//				System.out.println("content1---" + content1.length);
				if(content1.length <= 1) {
					t_preview_send.setPreview_content("");
				} else {
//					object.setPreview_content(content.split("__")[1]);					
					t_preview_send.setPreview_content(content.split("__")[1]);
				}
			}
		}
		if (t_preview_send.getTemp_tag() == 0) {// 查询班级
			String className = questionService.selectClassName(t_preview_send.getTemp_id());
			t_preview_send.setClass_name(className);
		} else if (t_preview_send.getTemp_tag() == 1) { // 查询个人
			
		}
		return "list";
	}
	
	public String deletePreviewSend() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		if(t_preview_send == null){
			t_preview_send = new preview_send();
		}
		System.out.println("sendID:"+t_preview_send.getPreview_send_id());
		boolean istag = questionService.deletePreviewSend(t_preview_send);
		if (istag) {
			if(tClass==null){
				tClass = new t_class();
			}
			
			tClass.setDepartmentId(String.valueOf(1));//具体的部门
			//得到班级列表
			list = courseService.classByDepartmentId(tClass);
			t_preview_send.setTeacher_id((Integer) session.getAttribute("userId"));
			
			t_preview_send.setRecNum(questionService.getPreviewCountNum(t_preview_send));
			t_preview_send.setData(questionService.previewItems(t_preview_send)); 
		}
		return "delete";
	}
	
	//预习问题右边
	public String toQuestionR() throws Exception{
		HttpSession session = ServletActionContext.getRequest().getSession();
		if(session.getAttribute("roles").toString().indexOf("1080")==-1){
			return "noRight";
		}
		
		if(t_sys_parameter==null){
			t_sys_parameter = new T_SYS_PARAMETER();
		}
		
		if(tClass==null){
			tClass = new t_class();
		}
		tClass.setDepartmentId(String.valueOf(t_course_log.getClassId()));//具体的部门
		//得到班级列表
		list = courseService.classByDepartmentId(tClass);
		
		t_sys_parameter.setParameterTypeId("年级");
		t_sys_parameter.setRecNum(logService.getMaxParamCountNum(t_sys_parameter));
		list2 = logService.params(t_sys_parameter);//年级
		
		if(testItem==null){
			testItem = new test_item();
		}
		testItem.setRecNum(questionService.getMaxItemCountNum(testItem));
		testItem.setData(questionService.items(testItem)); 
		return "list";
	}
	//更新原来预习表，插入现在的预习并查询添加的预习
	public String addPreviewProblem(){
		if(preview == null){
			preview = new preview();
		}
		preview.setTeacher_id(Integer.valueOf(getSession().getAttribute("userId").toString()));
		preview.setRecNum(questionService.getPreviewQuestionNumber(preview));
		preview.setData(questionService.savePreviewQuestion(preview));
		return "list";
	}
	//查看以前的发送的预习列表
	public String lookPreviewProblem(){
		if(preview == null){
			preview = new preview();
		}
		preview.setTeacher_id(Integer.valueOf(getSession().getAttribute("userId").toString()));
		preview.setRecNum(questionService.getPreviewQuestionNumber(preview));
		preview.setData(questionService.lookPreviewQuestion(preview));
		return "list";
	}
	//查看具体的预习题目
	public String previewById(){
		if(preview == null){
			preview = new preview();
		}
		preview.setPreview_content(questionService.lookPreviewQuestionById(preview).getPreview_content());
		if(testItem==null){
			testItem = new test_item();
		}
		preview.setPageNo(testItem.getPageNo());
		testItem.setRecNum(questionService.getDetailQuestionNumber(preview));
		testItem.setData(questionService.getDetailQuestion(preview)); 
		getRequest().setAttribute("preview_id", preview.getPreview_id());
		return "list";
	}
	
	
	//添加错误题目转向
		public String toErrorItems() throws Exception{
			HttpSession session = ServletActionContext.getRequest().getSession();
			if(session.getAttribute("roles").toString().indexOf("1082")==-1){
				return "noRight";
			}
			if(department==null){
				department = new department();
			}
			department.setData(logService.departments(department));
			return "list";
		}
	
		//预习问题右边
		public String toErrorQuestionR() throws Exception{
			if(t_sys_parameter==null){
				t_sys_parameter = new T_SYS_PARAMETER();
			}
			
			if(tClass==null){
				tClass = new t_class();
			}
			tClass.setDepartmentId(String.valueOf(t_course_log.getClassId()));//具体的部门
			//得到班级列表
			list = courseService.classByDepartmentId(tClass);
			
			t_sys_parameter.setParameterTypeId("年级");
			t_sys_parameter.setRecNum(logService.getMaxParamCountNum(t_sys_parameter));
			list2 = logService.params(t_sys_parameter);//年级
			
			
			if(subject == null){
				subject = new subject();
			}
			list1  = courseService.subjects(subject);
			
			if(testItem==null){
				testItem = new test_item();
			}
			testItem.setRecNum(questionService.getMaxItemCountNum(testItem));
			testItem.setData(questionService.items(testItem)); 
			return "list";
		}
		//得到错误分组
		public String selectGroup()throws Exception{
			if(group_error == null){
				group_error = new group_error();
			}
			group_error.setData(questionService.selectGroup(group_error));
			return "list";
		}
		
		//增加错误问题
	public String addErrorProblem(){
			if(error_dispatcher == null){
				error_dispatcher = new error_dispatcher();
			}
			System.out.println(error_dispatcher.getStudent_id() + "liixangpeng");
			String student_id [] ;
			if(error_dispatcher.getStudent_id().contains("|")){
				System.out.println("nihao");
				student_id = error_dispatcher.getStudent_id().split("\\|");
				if(group_error == null){
					group_error = new group_error();
				}
				group_error.setClass_id(error_dispatcher.getClass_id());
				group_error.setGroup_name(student_id[1]);
				list = questionService.getGroupStudentId(group_error);
				for(int i=0;i<list.size()-1;i++){
					student_id[0] = student_id[0] + ((group_error)(list.get(i))).getStudent_id() + ",";
				}
				student_id[0] = student_id[0] + ((group_error)(list.get(list.size()-1))).getStudent_id();
				error_dispatcher.setStudent_id(student_id[0]);
			}else{
				error_dispatcher.setStudent_id(error_dispatcher.getStudent_id());
			}
		
			error_dispatcher.setTeacher_id(Integer.valueOf(getSession().getAttribute("userId").toString()));
			questionService.insertErrorDispatcher(error_dispatcher);
			getRequest().setAttribute("msg", "添加成功！");
			if(department==null){
				department = new department();
			}
			department.setData(logService.departments(department));
			return "list";
	}
	
		//错误分组跳转
			public String studentGroupsError() throws Exception{
				HttpSession session = ServletActionContext.getRequest().getSession();
				if(session.getAttribute("roles").toString().indexOf("1083")==-1){
					return "noRight";
				}
				if(department==null){
					department = new department();
				}
				department.setData(logService.departments(department));
				return "list";
			}
	
	//重置错误分组转向得到学生
	public String toErrorGroup() throws Exception{
		if(t_user1 == null){
			t_user1 = new t_user();
		}
		t_user1.setData(userService.getStudent(t_user1));
		return "list";
	}
	
	//将原来的错误分组置空，保存现在重置后的错误分组，跳转到修改页面
	public String errorGroupSave() throws Exception{
		if(group_error == null){
			group_error = new group_error();
		}
		questionService.updateBeforeGroups(group_error);
		String studentIds = group_error.getStudent_id();
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
					group_error.setStudent_id(studentId);
					group_error.setGroup_name(groupId);
					questionService.saveErrorGroup(group_error);
				}
			}
		}
		//得到存在分组人数
		list = questionService.getErrorGroups(group_error);
		return "list";
	}
	
	//更新错误分组
	public String toUpdateGroupError() throws Exception{
		if(group_error==null){
			group_error = new group_error();
		}
		//得到存在分组人数
		list = questionService.getErrorGroups(group_error);
		String userIds = "";
		for(int i=0;i<list.size();i++){
			group_error group_error1 = (group_error)list.get(i);
			userIds = userIds +group_error1.getStudent_id() +",";
		}
		if(!userIds.equals("")){
			userIds = userIds.substring(0,userIds.length()-1);
		}
		if(t_user1==null){
			t_user1 = new t_user();
		}
		t_user1.setSpeciality(userIds);
		t_user1.setData(userService.usersNoPage(t_user1));
		return "update";
	}
	
	public String toGetErrorGroups()throws Exception{
		if(group_error==null){
			group_error = new group_error();
		}
		//得到存在分组人数
		list = questionService.getErrorGroups(group_error);
		return "list";
	}
	
	public String toInsertAsk() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if(session.getAttribute("roles").toString().indexOf("1015,")==-1){
			return "noRight";
		}
		return "insert";
	}
	
	public String saveAsk() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if(session.getAttribute("roles").toString().indexOf("1015,")==-1){
			return "noRight";
		}
		if(askLog==null){
			askLog = new ask_log();
		}
		askLog.setTeacherId(Integer.valueOf(session.getAttribute("userId").toString()));
		askLog.setAskTime(new Date());
		t_course_log  t_course_log = new t_course_log();
		t_course_log.setUserId(Integer.valueOf(session.getAttribute("userId").toString()));
		t_course_log = courseService.courseLogNew(t_course_log);
		if(t_course_log!=null){
			askLog.setCourceId(t_course_log.getCourseId());
		}
		Object o = questionService.save(askLog);
		askLog.setAskId(Integer.valueOf(o.toString()));
		
		if(t_user1==null){
			t_user1 = new t_user();
		}
		t_user1.setClassId(t_course_log.getClassId());
		t_user1.setPageSize(1000);
		
		t_user1.setBeginTime(new Date());
		List list1  = userService.usersLeaveNoPage(t_user1);
		String userIds = "";
		for(int i=0;i<list1.size();i++){
			t_user t_user2 = (t_user)list1.get(i);
			userIds = userIds +t_user2.getUserId() +",";
		}
		if(!userIds.equals("")){
			userIds = userIds.substring(0,userIds.length()-1);
		}
		t_user1.setSpeciality(userIds);
		List list = userService.usersNoPage(t_user1);
		String ip = "";
		for(int i=0;i<list.size();i++){
			t_user1 = (t_user)list.get(i);
			if(t_user1.getIp()!=null&&!t_user1.getIp().equals("")){
				ip = t_user1.getIp();
				System.out.println("ip====="+ip);
				
				MyThread mt = new MyThread(ip,9990,"cmd_update_answer");
				mt.start();
//				NetTelnet telnet = new NetTelnet(ip, 9990, "",""); 
//				 telnet.sendCommand("cmd_update_answer");
//				 telnet.disconnect();
			}
		}
		testItem.setItemId(askLog.getItemId());
		testItem = questionService.itemById(testItem);
		
		t_user	t_user2 = new t_user();
		t_user2.setIsTeacher(0);
		t_user2.setPageSize(1000);
		t_user2.setClassId(t_course_log.getClassId());
		t_user1.setRecNum(userService.getMaxFileCountNum(t_user2));
		t_user1.setData(userService.usersNoPage(t_user2));
		if(answerLog==null){
			answerLog = new answer_log();
		}
		answerLog.setPageNo(1000);
		answerLog.setAskId(askLog.getAskId());
		answerLog.setData(questionService.answers(answerLog));
		if(askLog.getAskType().equals(4)){
			return "tupian";
		}if(askLog.getAskType().equals(2)){
			return "tiaoren";
		}else{
			return "view";
		}
	}
	
	// 学生和id信息组合
	String idAndName = "";
	
	public String getIdAndName() {
		return idAndName;
	}

	public void setIdAndName(String idAndName) {
		this.idAndName = idAndName;
	}

	//挑人作答
	public String toTiaoren() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if(session.getAttribute("roles").toString().indexOf("1020,")==-1){
			return "noRight";
		}
		if(askLog==null){
			askLog = new ask_log();
		}
		askLog.setTeacherId(Integer.valueOf(session.getAttribute("userId").toString()));
		askLog.setAskTime(new Date());
		t_course_log  t_course_log = new t_course_log();
		t_course_log.setUserId(Integer.valueOf(session.getAttribute("userId").toString()));
		t_course_log = courseService.courseLogNew(t_course_log);
		if(t_course_log!=null){
			askLog.setCourceId(t_course_log.getCourseId());
		}
		Object o = questionService.save(askLog);
		askLog.setAskId(Integer.valueOf(o.toString()));
		
		if(t_user1==null){
			t_user1 = new t_user();
		}
		t_user1.setClassId(t_course_log.getClassId());
		t_user1.setPageSize(1000);
		list = userService.users(t_user1);
		for (int i = 0; i < list.size(); i++) {
			int id = ((t_user)list.get(i)).getUserId();
			String name = ((t_user)list.get(i)).getName();
			if (i == list.size()-1){
				idAndName = idAndName + "'" + id + " "+ name +"'";				
			} else {
				idAndName = idAndName + "'" + id + " "+ name + "',";
			}
		}
		// '11515  李煜', '10549  李松', '10548  刘波', '10547  赵鹏'
		// System.out.println("idAndName:" + idAndName);
		
		return "tiaoren";
	}
	
	//挑组作答
	public String toTiaozu() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if(session.getAttribute("roles").toString().indexOf("1023,")==-1){
			return "noRight";
		}
		if(askLog==null){
			askLog = new ask_log();
		}
		askLog.setTeacherId(Integer.valueOf(session.getAttribute("userId").toString()));
		askLog.setAskTime(new Date());
		t_course_log  t_course_log = new t_course_log();
		t_course_log.setUserId(Integer.valueOf(session.getAttribute("userId").toString()));
		t_course_log = courseService.courseLogNew(t_course_log);
		if(t_course_log!=null){
			askLog.setCourceId(t_course_log.getCourseId());
		}
		Object o = questionService.save(askLog);
		askLog.setAskId(Integer.valueOf(o.toString()));
		
		if(student_group==null){
			student_group = new student_group();
		}
		student_group.setGroupStatus("0");
		student_group.setPageSize(1000);
		list = userService.groups(student_group);
		return "tiaozu";
	}
	public String sendAppAjax() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = ServletActionContext.getRequest().getSession();
		if(t_user1==null){
			t_user1 = new t_user();
		}
		t_user1.setUserId(Integer.valueOf(request.getParameter("userId").toString()));
		t_user1 = userService.userById(t_user1);
		String ip = t_user1.getIp();
		System.out.println("ip====="+ip);
		
		MyThread mt = new MyThread(ip,9990,"cmd_update_answer");
		mt.start();
		msg = "发送成功。";
		return "success";
	}
	public String sendZuAppAjax() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = ServletActionContext.getRequest().getSession();
		if(t_user1==null){
			t_user1 = new t_user();
		}
		student_group student_group = new student_group();
		student_group.setGroupName(Integer.valueOf(request.getParameter("groupId").toString()));
		student_group.setPageSize(1000);
		List list = userService.groupsByName(student_group);
		for(int i=0;i<list.size();i++){
			student_group = (student_group)list.get(i);
			t_user1.setUserId(Integer.valueOf(student_group.getStudentId()));
			t_user1 = userService.userById(t_user1);
			String ip = t_user1.getIp();
			System.out.println("ip====="+ip);
			
			MyThread mt = new MyThread(ip,9990,"cmd_update_answer");
			mt.start();
		}
		
		msg = "发送成功。";
		return "success";
	}
	public String sendApp() throws Exception{
		t_user	t_user2 = new t_user();
//		t_user1.setUserId(Integer.valueOf(request.getParameter("userId").toString()));
		t_user2 = userService.userById(t_user1);
		if(t_user2!=null){
			if(t_user2.getIp()!=null&&!t_user2.getIp().equals("")){
				String ip = t_user2.getIp();
				System.out.println("ip====="+ip);
				MyThread mt = new MyThread(ip,9990,"cmd_update_answer");
				mt.start();
			}
		}
		if(askLog==null){
			askLog = new ask_log();
		}
		askLog = questionService.askById(askLog);
		
		if(testItem==null){
			testItem = new test_item();
		}
		testItem.setItemId(askLog.getItemId());
		testItem = questionService.itemById(testItem);
		course course = new course();
		course.setCourceId(askLog.getCourceId());
		course = courseService.courseById(course);
		
		if(t_user1==null){
			t_user1 = new t_user();
		}
		t_user1.setIsTeacher(0);
		t_user1.setPageSize(1000);
		t_user1.setClassId(course.getClassId());
		t_user1.setRecNum(userService.getMaxFileCountNum(t_user1));
		t_user1.setData(userService.usersNoPage(t_user1));
		if(answerLog==null){
			answerLog = new answer_log();
		}
		answerLog.setPageNo(1000);
		answerLog.setAskId(askLog.getAskId());
		answerLog.setData(questionService.answers(answerLog));
		return "view";
	}
	public String sendZuApp() throws Exception{
		t_user	t_user2 = new t_user();
		student_group.setPageSize(1000);
		List list = userService.groupsByName(student_group);
		for(int i=0;i<list.size();i++){
			student_group = (student_group)list.get(i);
			t_user2.setUserId(Integer.valueOf(student_group.getStudentId()));
			t_user2 = userService.userById(t_user2);
			if(t_user2!=null){
				if(t_user2.getIp()!=null&&!t_user2.getIp().equals("")){
					String ip = t_user2.getIp();
					System.out.println("ip====="+ip);
					MyThread mt = new MyThread(ip,9990,"cmd_update_answer");
					mt.start();
				}
			}
		}
		if(askLog==null){
			askLog = new ask_log();
		}
		askLog = questionService.askById(askLog);
		
		if(testItem==null){
			testItem = new test_item();
		}
		testItem.setItemId(askLog.getItemId());
		testItem = questionService.itemById(testItem);
		course course = new course();
		course.setCourceId(askLog.getCourceId());
		course = courseService.courseById(course);
		
		if(t_user1==null){
			t_user1 = new t_user();
		}
		t_user1.setIsTeacher(0);
		t_user1.setPageSize(1000);
		t_user1.setClassId(course.getClassId());
		t_user1.setRecNum(userService.getMaxFileCountNum(t_user1));
		t_user1.setData(userService.usersNoPage(t_user1));
		if(answerLog==null){
			answerLog = new answer_log();
		}
		answerLog.setPageNo(1000);
		answerLog.setAskId(askLog.getAskId());
		answerLog.setData(questionService.answers(answerLog));
		return "view";
	}
	public String deleteAsk() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if(session.getAttribute("roles").toString().indexOf("1016,")==-1){
			return "noRight";
		}
		askLog.setRecNum(questionService.getMaxAskCountNum(askLog)-1);
		askLog.setData(questionService.deleteAsk(askLog)); 
		return "list";
	}
	public String toItem() throws Exception{
		if(testItem==null){
			testItem = new test_item();
		}
		testItem.setItemId(askLog.getItemId());
		testItem = questionService.itemById(testItem);
		
		course course = new course();
		course.setCourceId(askLog.getCourceId());
		course = courseService.courseById(course);
		if(t_user1==null){
			t_user1 = new t_user();
		}
		t_user1.setIsTeacher(0);
		t_user1.setPageSize(1000);
		t_user1.setClassId(course.getClassId());
		t_user1.setRecNum(userService.getMaxFileCountNum(t_user1));
		t_user1.setData(userService.usersNoPage(t_user1));
		if(answerLog==null){
			answerLog = new answer_log();
		}
		answerLog.setPageNo(1000);
		answerLog.setAskId(askLog.getAskId());
		answerLog.setData(questionService.answers(answerLog));
		if(askLog.getAskType().equals(4)){
			return "tupian";
		}else{
			return "view";
		}
	}
	public String askLog() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if(testItem==null){
			testItem = new test_item();
		}
		testItem.setItemId(askLog.getItemId());
		testItem = questionService.itemById(testItem);
		course course = new course();
		course.setCourceId(askLog.getCourceId());
		course = courseService.courseById(course);
		
		if(t_user1==null){
			t_user1 = new t_user();
		}
		t_user1.setIsTeacher(0);
		t_user1.setPageSize(1000);
		t_user1.setClassId(course.getClassId());
		t_user1.setRecNum(userService.getMaxFileCountNum(t_user1));
		t_user1.setData(userService.usersNoPage(t_user1));
		if(answerLog==null){
			answerLog = new answer_log();
		}
		answerLog.setPageNo(1000);
		answerLog.setAskId(askLog.getAskId());
		answerLog.setData(questionService.answers(answerLog));
		return "list";
	}
	public String askLog1() throws Exception{
		if(testItem==null){
			testItem = new test_item();
		}
		testItem.setItemId(askLog.getItemId());
		testItem = questionService.itemById(testItem);
		course course = new course();
		course.setCourceId(askLog.getCourceId());
		course = courseService.courseById(course);
		
		//查询抢答用户
		
		askLog = questionService.getIsAnswerById(askLog);
		//is_right=2代表已抢答但未回答
		if(askLog!=null){
		if(askLog.getFinishType()!=null){
		if(askLog.getFinishType().equals(1)){
			t_user1 = new t_user();
			t_user1.setUserId(askLog.getRobUserId());
			t_user1 = userService.userById1(t_user1);
		}
		}}
		return "list";
	}
	public String answerById() throws Exception{
		if(answerLog==null){
			answerLog = new answer_log();
		}
		List list = questionService.answers(answerLog);
		if(list.size()>0){
			answerLog = (answer_log)list.get(0);
		}
		if(testItem==null){
			testItem = new test_item();
		}
		testItem.setGradeId(answerLog.getAskId());
		testItem = questionService.itemByAskId(testItem);
		return "answerLog";
	}
	//查看已经回答学生的图片
	public String askLogTupian() throws Exception{
		course course = new course();
		course.setCourceId(askLog.getCourceId());
		course = courseService.courseById(course);
		if(testItem==null){
			testItem = new test_item();
		}
		testItem.setItemId(askLog.getItemId());
		testItem = questionService.itemById(testItem);
		HttpServletRequest request = ServletActionContext.getRequest();
		System.out.println("users=="+request.getParameter("users"));
		if(t_user1==null){
			t_user1 = new t_user();
		}
		t_user1.setIsTeacher(0);
		t_user1.setPageSize(1000);
		t_user1.setClassId(course.getClassId());
		
		t_user1.setRecNum(userService.getMaxFileCountNum(t_user1));
		t_user1.setData(userService.usersNoPage(t_user1));
		if(answerLog==null){
			answerLog = new answer_log();
		}
		answerLog.setPageNo(1000);
		answerLog.setAskId(askLog.getAskId());
		answerLog.setData(questionService.answers(answerLog));
		return "list";
	}
	
	public String askLogBidui() throws Exception{
		if(t_user1==null){
			t_user1 = new t_user();
		}
		t_user1.setIsTeacher(0);
		t_user1.setPageSize(1000);
		t_user1.setRecNum(userService.getMaxFileCountNum(t_user1));
		t_user1.setData(userService.usersNoPage(t_user1));
		
		if(testItem==null){
			testItem = new test_item();
		}
		testItem.setItemId(askLog.getItemId());
		testItem = questionService.itemById(testItem);
		if(answerLog==null){
			answerLog = new answer_log();
		}
		answerLog.setPageNo(1000);
		answerLog.setAskId(askLog.getAskId());
		answerLog.setData(questionService.answers(answerLog));
		return "list";
	}
	public String askTubiao() throws Exception{
		course course = new course();
		course.setCourceId(askLog.getCourceId());
		course = courseService.courseById(course);
		
		if(t_user1==null){
			t_user1 = new t_user();
		}
		t_user1.setIsTeacher(0);
		t_user1.setPageSize(1000);
		t_user1.setClassId(course.getClassId());
		t_user1.setRecNum(userService.getMaxFileCountNum(t_user1));
		t_user1.setData(userService.usersNoPage(t_user1));
		if(answerLog==null){
			answerLog = new answer_log();
		}
		answerLog.setPageNo(1000);
		answerLog.setAskId(askLog.getAskId());
		answerLog.setData(questionService.answers(answerLog));
		isRight = 0;
		isWrong = 0;
		qingjia = 0;
		String flag = "false";
		for(int n=0;n<t_user1.getData().size();n++){
			t_user t_user2 = (t_user)t_user1.getData().get(n);
			flag = "false";	
			for(int m=0;m<answerLog.getData().size();m++){
				answer_log answerLog1 = (answer_log)answerLog.getData().get(m);
				if(t_user2.getUserId().equals(answerLog1.getStudentId())){
					flag = "true";
					if(answerLog1.getIsRight().equals("1")){
						isRight++;
		 }else{
			 isWrong++;
		 }}}
	 	if(flag.equals("false")){
	 		qingjia++;
	 	}} 
		return "tubiao";
	}
//	public String questions() throws Exception{
//		if(JXHD_SEL==null){
//			JXHD_SEL = new JXHD_SEL();
//		}
////		JXHD_NOTSEL.setRecNum(questionService.getMaxNotselCountNum(JXHD_NOTSEL));
////		JXHD_NOTSEL.setData(questionService.notsels(JXHD_NOTSEL)); 
//		
//		JXHD_SEL.setRecNum(questionService.getMaxQuestionsCountNum(JXHD_SEL));
//		JXHD_SEL.setData(questionService.questions(JXHD_SEL)); 
//		return "list";
//	}
//	public String questionPapers() throws Exception{
//		
//		if(JXHD_QuestionPaper==null){
//			JXHD_QuestionPaper = new JXHD_QuestionPaper();
//		}
//		String Id = String.valueOf(JXHD_QuestionPaper.getShijuanid());
//		JXHD_QuestionPaper.setRecNum(questionService.getMaxQuestionPapersCountNum(JXHD_QuestionPaper));
//		JXHD_QuestionPaper.setData(questionService.QuestionPapers(JXHD_QuestionPaper)); 
//		if(Id.equals("1")){
//			return "list";
//		}else{
//			return "groupList";
//		}
//	}
//	public String saveQuestionPaper() throws Exception{
//		if(JXHD_QuestionPaper==null){
//			JXHD_QuestionPaper = new JXHD_QuestionPaper();
//		}
//		JXHD_QuestionPaper.setChutiMan(session.getAttribute("userName").toString());
//		JXHD_QuestionPaper.setChutiTime(new Date());
//		questionService.save(JXHD_QuestionPaper);
//		
//		JXHD_QuestionPaper JXHD_QuestionPaper1 = new JXHD_QuestionPaper();
//		JXHD_QuestionPaper.setRecNum(questionService.getMaxQuestionPapersCountNum(JXHD_QuestionPaper1));
//		JXHD_QuestionPaper.setData(questionService.QuestionPapers(JXHD_QuestionPaper1)); 
//		return "list";
//	}
//	public String toQuestionPaper() throws Exception{
//		JXHD_QuestionPaper = questionService.questionPaperById(JXHD_QuestionPaper);
//		if(JXHD_SEL.getQuestiontype().equals("单选题")||JXHD_SEL.getQuestiontype().equals("多选题")){
//			JXHD_SEL = questionService.selById(JXHD_SEL);
//			return "selDati";
//		}else{
//			if(JXHD_NOTSEL==null){
//				JXHD_NOTSEL = new JXHD_NOTSEL();
//			}
//			JXHD_NOTSEL.setId(JXHD_SEL.getId());
//			JXHD_NOTSEL = questionService.notselById(JXHD_NOTSEL);
//			return "notselDati";
//		}
//		
//	}
	//重置分组
	public String toFenzu() throws Exception{
		if(getSession().getAttribute("roles").toString().indexOf("1036,")==-1){
			return "noRight";
		}
		t_course_log t_course_log = new t_course_log();
		t_course_log.setUserId(Integer.valueOf(getSession().getAttribute("userId").toString()));
		t_course_log = courseService.courseLogNew(t_course_log);
		if(t_user1==null){
			t_user1 = new t_user();
		}
		t_user1.setIsTeacher(0);
		t_user1.setPageSize(1000);
		t_user1.setClassId(t_course_log.getClassId());
		//t_user1.setRecNum(userService.getMaxFileCountNum(t_user1));
		
		t_user1.setBeginTime(new Date());
		List list  = userService.usersLeaveNoPage(t_user1);
		String userIds = "";
		for(int i=0;i<list.size();i++){
			t_user t_user2 = (t_user)list.get(i);
			userIds = userIds +t_user2.getUserId() +",";
		}
		if(!userIds.equals("")){
			userIds = userIds.substring(0,userIds.length()-1);
		}
		t_user1.setSpeciality(userIds);
		t_user1.setData(userService.usersNoPage(t_user1));
		return "select";
	}
	
	//随机分组
	public String toRandomFenzu() throws Exception{
		if(getSession().getAttribute("roles").toString().indexOf("1036,")==-1){
			return "noRight";
		}
		t_course_log t_course_log = new t_course_log();
		t_course_log.setUserId(Integer.valueOf(getSession().getAttribute("userId").toString()));
		t_course_log = courseService.courseLogNew(t_course_log);
		if(t_user1==null){
			t_user1 = new t_user();
		}
		t_user1.setIsTeacher(0);
		t_user1.setPageSize(1000);
		t_user1.setClassId(t_course_log.getClassId());
		//t_user1.setRecNum(userService.getMaxFileCountNum(t_user1));
		
		t_user1.setBeginTime(new Date());
		List list  = userService.usersLeaveNoPage(t_user1);
		String userIds = "";
		for(int i=0;i<list.size();i++){
			t_user t_user2 = (t_user)list.get(i);
			userIds = userIds +t_user2.getUserId() +",";
		}
		if(!userIds.equals("")){
			userIds = userIds.substring(0,userIds.length()-1);
		}
		t_user1.setSpeciality(userIds);
		t_user1.setData(userService.usersNoPage(t_user1));//得到所有没有请假学生数据
		if(student_group == null){
			student_group = new student_group();
		}
		//得到正在上的课程
		t_course_log.setUserId(Integer.valueOf(getSession().getAttribute("userId").toString()));
		t_course_log = courseService.courseLogNew(t_course_log);
		student_group.setClassId(t_course_log.getClassId());
		userService.update(student_group);//更新原来的分组数据
		int length = t_user1.getData().size()/number_group;
		int left = t_user1.getData().size()%number_group;
		for(int i=0;i<length;i++){
			for(int j=0;j<number_group;j++){
				int r = (int) (Math.random()*t_user1.getData().size());
				student_group.setStudentId(((t_user)(t_user1.getData().get(r))).getUserId().toString());
				student_group.setClassId(t_course_log.getClassId());
				student_group.setGroupName(i+1);
				student_group.setCreateTime(new Date());
				student_group.setGroupStatus("0");
				userService.save(student_group);
				t_user1.getData().remove(r);
			}
			
		}
		for(int k=0;k<left;k++){//多余的分到原来的组中
			int m = 1;
			student_group.setStudentId(((t_user)(t_user1.getData().get(k))).getUserId().toString());
			student_group.setClassId(t_course_log.getClassId());
			student_group.setGroupName(m);
			student_group.setCreateTime(new Date());
			student_group.setGroupStatus("0");
			userService.save(student_group);
			m++;
		}
		student_group.setRecNum(userService.getMaxFileCountNum(student_group));
		student_group.setData(userService.studentGroups(student_group));
		return "select";
	}
	
	//修改分组
	public String toUpdateGroup() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if(session.getAttribute("roles").toString().indexOf("1037,")==-1){
			return "noRight";
		}
		if(student_group==null){
			student_group = new student_group();
		}
		//得到现在课程信息
		t_course_log t_course_log = new t_course_log();
		t_course_log.setUserId(Integer.valueOf(session.getAttribute("userId").toString()));
		t_course_log = courseService.courseLogNew(t_course_log);
		//得到已经存在的分组并且是本班级的
		student_group.setGroupStatus("0");
		student_group.setClassId(t_course_log.getClassId());
		//得到存在分组人数
		list = userService.studentGroups1(student_group);
		//得到请假的学生
		if(t_user1==null){
			t_user1 = new t_user();
		}
		t_user1.setIsTeacher(0);//0代表学生
		t_user1.setPageSize(1000);
		t_user1.setClassId(t_course_log.getClassId());
		//t_user1.setRecNum(userService.getMaxFileCountNum(t_user1));
		t_user1.setBeginTime(new Date());
		List list  = userService.usersLeaveNoPage(t_user1);
		String userIds = "";
		for(int i=0;i<list.size();i++){
			t_user t_user2 = (t_user)list.get(i);
			userIds = userIds +t_user2.getUserId() +",";
		}
		if(!userIds.equals("")){
			userIds = userIds.substring(0,userIds.length()-1);
			userIds = userIds + ",";
		}
		//所有的学生
		student_group student_group = new student_group();
		student_group.setGroupStatus("0");
		List list2 = userService.studentGroups1(student_group);
		for(int i=0;i<list2.size();i++){
			student_group student_group2 = (student_group)list2.get(i);
			userIds = userIds +student_group2.getStudentId() +",";
		}
		if(!userIds.equals("")){
			userIds = userIds.substring(0,userIds.length()-1);
		}
		System.out.println(userIds);//61916188,6191,6460,6194,第1个是请假的学生6191，其余是上课的学生
		t_user1.setSpeciality(userIds);
		t_user1.setData(userService.usersNoPage(t_user1));
		return "update";
	}
	
	public String twtj() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if(session.getAttribute("roles").toString().indexOf("1040,")==-1){
			return "noRight";
		}
		if(department==null){
			department = new department();
		}
		department.setData(logService.departments(department));
		askLog.setData(questionService.twtj(askLog));
		t_class t_class = new t_class();
		list = new ArrayList();
		list1 = new ArrayList();
		if(askLog.getDepartmentId()!=null){
			t_class.setDepartmentId(askLog.getDepartmentId());
			t_class.setGradeId(t_user1.getGradeId());
			list = courseService.classByDepartmentId(t_class);
		}
		if(askLog.getClassId()!=null){
			course course = new course();
			course.setClassId(askLog.getClassId());
			list1 = courseService.courseByClassId(course);
		}
		if(t_sys_parameter==null){
			t_sys_parameter = new T_SYS_PARAMETER();
		}
		t_sys_parameter.setPageSize(100);
		t_sys_parameter.setParameterTypeId("年级");
		t_sys_parameter.setRecNum(logService.getMaxParamCountNum(t_sys_parameter));
		t_sys_parameter.setData(logService.params(t_sys_parameter));
		return "list";
	}
	public String hdtj() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if(session.getAttribute("roles").toString().indexOf("1042,")==-1){
			return "noRight";
		}
		if(department==null){
			department = new department();
		}
		department.setData(logService.departments(department));
		askLog.setData(questionService.hdtj(askLog));
		list2 = new ArrayList();
		for(int i=0;i<askLog.getData().size();i++){
			ask_log askLog1 = (ask_log)askLog.getData().get(i);
			double sumNum = (double)askLog1.getSumNum();
			double rightNum = (double)askLog1.getRightNum();
			Double x=new Double(rightNum/sumNum);
			NumberFormat nt = NumberFormat.getPercentInstance();
			nt.setMinimumFractionDigits(2);
			askLog1.setPercent(nt.format(x));
			list2.add(askLog1);
		}
		
		t_class t_class = new t_class();
		list = new ArrayList();
		list1 = new ArrayList();
		if(askLog.getDepartmentId()!=null){
			t_class.setDepartmentId(askLog.getDepartmentId());
			t_class.setGradeId(t_user1.getGradeId());
			list = courseService.classByDepartmentId(t_class);
		}
		if(askLog.getClassId()!=null){
			course course = new course();
			course.setClassId(askLog.getClassId());
			list1 = courseService.courseByClassId(course);
		}
		if(t_sys_parameter==null){
			t_sys_parameter = new T_SYS_PARAMETER();
		}
		t_sys_parameter.setPageSize(100);
		t_sys_parameter.setParameterTypeId("年级");
		t_sys_parameter.setRecNum(logService.getMaxParamCountNum(t_sys_parameter));
		t_sys_parameter.setData(logService.params(t_sys_parameter));
		return "list";
	}
	public String toZhuanpan() throws Exception{
		
		int num =0;
		String name = "";
		String color = "";
		if(JXHD_QuestionPaper.getDatiMan()!=null){
			String s[] = JXHD_QuestionPaper.getDatiMan().split(",");
			for(int i=0;i<s.length;i++){
				if(s[i].indexOf("zu")>=0){
					num++;
					name = name + num+"组"+",";
					color = color + num+"组"+",";
				}
			}
		}
		JXHD_QuestionPaper.setStatus(name.substring(0, name.length()-1));
		return "zhuanpan";
	}
	public String toInsertPlItem() throws Exception{
		return "itemdr";
	}
	public String insertPlItem() throws Exception{
		File[] srcFiles = this.getUpload();
		InputStream is = new FileInputStream(srcFiles[0]);
		HSSFWorkbook hssfWorkbook = new HSSFWorkbook(is);
		test_item test_item = null;
        List<test_item> list = new ArrayList<test_item>();
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
                if(testItem==null){
                	testItem = new test_item();
                }
                test_item = new test_item();
                // 循环列Cell
                // 0学号 1姓名 2学院 3课程名 4 成绩
                // for (int cellNum = 0; cellNum <=4; cellNum++) {
                HSSFCell xm = hssfRow.getCell(0);
                if (xm == null) {
                	test_item.setQuestion(null);
                }else{
                	test_item.setQuestion(getValue(xm));
                }
                
                HSSFCell answer = hssfRow.getCell(1);
                if (answer == null) {
                	test_item.setAnswer(null);
                }else{
                	if(testItem.getQuestiontype().equals("2")){
                		test_item.setAnswer(String.valueOf(new Double(getValue(answer)).intValue()));
                	}else{
                		test_item.setAnswer(getValue(answer));
                	}
                	
                }
                
                HSSFCell score = hssfRow.getCell(2);
                if (score == null) {
                	test_item.setScore(null);
                }else{
                	test_item.setScore(score.getNumericCellValue());
                }
                
                HSSFCell a = hssfRow.getCell(3);
                if (a == null) {
                	test_item.setChoicea(null);
                }else{
                	test_item.setChoicea(a.getStringCellValue());
                }
                
                HSSFCell b = hssfRow.getCell(4);
                if (b == null) {
                	test_item.setChoiceb(null);
                }else{
                	test_item.setChoiceb(b.getStringCellValue());
                }
                HSSFCell c = hssfRow.getCell(5);
                if (c == null) {
                	test_item.setChoicec(null);
                }else{
                	test_item.setChoicec(c.getStringCellValue());
                }
                HSSFCell d = hssfRow.getCell(6);
                if (d == null) {
                	test_item.setChoiced(null);
                }else{
                	test_item.setChoiced(d.getStringCellValue());
                }
                HSSFCell e = hssfRow.getCell(7);
                if (e == null) {
                	test_item.setChoicee(null);
                }else{
                	test_item.setChoicee(e.getStringCellValue());
                }
                HSSFCell f = hssfRow.getCell(8);
                if (f == null) {
                	test_item.setChoicef(null);
                }else{
                	test_item.setChoicef(f.getStringCellValue());
                }
                HSSFCell g = hssfRow.getCell(9);
                if (g == null) {
                	test_item.setChoiceg(null);
                }else{
                	test_item.setChoiceg(g.getStringCellValue());
                }
                HSSFCell num = hssfRow.getCell(10);
                if (num == null) {
                	test_item.setChoicenum(1);
                }else{
                	test_item.setChoicenum(new   Double(getValue(num)).intValue());
                }
                test_item.setQuestiontype(testItem.getQuestiontype());
                Object o = questionService.save(test_item);
//                T_LS_XMK.setId(Integer.valueOf(o.toString()));
//    	        list.add(T_LS_XMK);   
            }
        }
        msg = "导入成功。";
        testItem.setChoiceg(null);
        testItem.setRecNum(questionService.getMaxItemCountNum(testItem));
		testItem.setData(questionService.items(testItem)); 
		return "list";
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
//	public String questionPaperView() throws Exception{
//		JXHD_QuestionPaper = questionService.questionPaperById(JXHD_QuestionPaper);
//		if(JXHD_SEL.getQuestiontype().equals("单选题")||JXHD_SEL.getQuestiontype().equals("多选题")){
//			JXHD_SEL = questionService.selById(JXHD_SEL);
//			return "selView";
//		}else{
//			if(JXHD_NOTSEL==null){
//				JXHD_NOTSEL = new JXHD_NOTSEL();
//			}
//			JXHD_NOTSEL.setId(JXHD_SEL.getId());
//			JXHD_NOTSEL = questionService.notselById(JXHD_NOTSEL);
//			return "notselView";
//		}
//		
//	}
//	public String saveQuestionPaperAnswer() throws Exception{
//		if(JXHD_QuestionPaper==null){
//			JXHD_QuestionPaper = new JXHD_QuestionPaper();
//		}
//		JXHD_QuestionPaper.setDatiMan(session.getAttribute("userName").toString());
//		JXHD_QuestionPaper.setDatiTime(new Date());
//		JXHD_QuestionPaper.setRecNum(questionService.getMaxQuestionPapersCountNum(JXHD_QuestionPaper));
//		JXHD_QuestionPaper.setData(questionService.update(JXHD_QuestionPaper)); 
//		return "list";
//	}
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
	
}
