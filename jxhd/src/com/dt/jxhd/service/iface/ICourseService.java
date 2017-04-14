package com.dt.jxhd.service.iface;

import java.util.List;

import com.dt.jxhd.domain.JXHD_NOTSEL;
import com.dt.jxhd.domain.JXHD_QuestionPaper;
import com.dt.jxhd.domain.JXHD_SEL;
import com.dt.jxhd.domain.JXHD_shijuan;
import com.dt.jxhd.domain.answer_log;
import com.dt.jxhd.domain.ask_log;
import com.dt.jxhd.domain.class_section;
import com.dt.jxhd.domain.course;
import com.dt.jxhd.domain.subject;
import com.dt.jxhd.domain.t_class;
import com.dt.jxhd.domain.t_course_log;
import com.dt.jxhd.domain.test_item;



public interface ICourseService {

	public List<course> cources(course course);//得到具体的课程列表
	public int getCourseNum(course course);//得到课程数目
	public Object save(course course);
	public course courseById(course course);
	public Object save(t_course_log t_course_log);
	//查询某个部门下的班级
	public List classByDepartmentId(t_class t_class);
	public List courseByClassId(course course);
	//得到课程信息
	public t_course_log courseLogNew(t_course_log t_course_log);
	public List subjects(subject subject);
	public List sections(class_section class_section);
	public int getSectionsNum(class_section class_section);
	public Object save(class_section class_section);
	public class_section sectionById(class_section class_section);
	public void deleteSection(class_section class_section);
	public course courseBys(course course);
	public void deleteCourse(course course);
	public Object update(course course);
	public t_course_log courseLogById(t_course_log t_course_log);
	public List courseLogs(t_course_log t_course_log);
	public int getCourseLogsNum(t_course_log t_course_log);
}
