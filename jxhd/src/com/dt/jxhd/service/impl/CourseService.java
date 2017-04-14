package com.dt.jxhd.service.impl;

import java.util.List;

import com.dt.jxhd.commons.service.BaseService;
import com.dt.jxhd.domain.class_section;
import com.dt.jxhd.domain.course;
import com.dt.jxhd.domain.subject;
import com.dt.jxhd.domain.t_class;
import com.dt.jxhd.domain.t_course_log;
import com.dt.jxhd.service.iface.ICourseService;

//课程管理
public class CourseService extends BaseService implements ICourseService{
	//得到具体的课程列表
	@SuppressWarnings("unchecked")
	public List<course> cources(course course){
		return (List<course>) this.getListData("course.courses", course);
	}
	//得到课程数目
	public int getCourseNum(course course){
		Object obj = this.getSingleData("course.courseNum",course);
		int num = 0;
		if (obj != null) {
			num = ((Integer) obj).intValue();
		}
		return num;
	}
	public Object save(course course){
		return this.insertBySqlAndReturn("course.course_insert",course);
	}
	public course courseById(course course){
		return (course) this.getSingleData("course.courseByCourceId", course);
	}
	public course courseBys(course course){
		return (course) this.getSingleData("course.courseBys", course);
	}
	public Object update(course course){
		return  (Object)this.updateBySqlAndReturn("course.course_update",course);
	}
	public void deleteCourse(course course){
		this.deleteBySql("course.course_delete",course);
	}
	public Object save(t_course_log t_course_log){
		return this.insertBySqlAndReturn("t_course_log.courseLog_insert",t_course_log);
	}
	//查找某一个部门【计算机科学与技术】下的班级
	public List classByDepartmentId(t_class t_class){
		return (List) this.getListData("t_class.classByDepartmentId", t_class);
	}
	public List courseByClassId(course course){
		return (List) this.getListData("course.courseByClassId", course);
	}
	
	public t_course_log courseLogNew(t_course_log t_course_log){
		return (t_course_log) this.getSingleData("t_course_log.courseLogNew", t_course_log);
	}
	public List courseLogs(t_course_log t_course_log){
		return (List) this.getListData("t_course_log.courseLogs", t_course_log);
	}
	public int getCourseLogsNum(t_course_log t_course_log){
		Object obj = this.getSingleData("t_course_log.courseLogsNum",t_course_log);
		int num = 0;
		if (obj != null) {
			num = ((Integer) obj).intValue();
		}
		return num;
	}
	public t_course_log courseLogById(t_course_log t_course_log){
		return (t_course_log) this.getSingleData("t_course_log.courseLogById", t_course_log);
	}
	public List subjects(subject subject){
		return (List) this.getListData("subject.subjects", subject);
	}
	public List sections(class_section class_section){
		return (List) this.getListData("class_section.sections", class_section);
	}
	public int getSectionsNum(class_section class_section){
		Object obj = this.getSingleData("class_section.sectionNum",class_section);
		int num = 0;
		if (obj != null) {
			num = ((Integer) obj).intValue();
		}
		return num;
	}
	public Object save(class_section class_section){
		return this.insertBySqlAndReturn("class_section.section_insert",class_section);
	}
	public class_section sectionById(class_section class_section){
		return (class_section) this.getSingleData("class_section.sectionById", class_section);
	}
	public void deleteSection(class_section class_section){
		this.deleteBySql("class_section.section_delete",class_section);
	}
}
