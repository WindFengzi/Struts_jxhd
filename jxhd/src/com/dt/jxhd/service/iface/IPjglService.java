package com.dt.jxhd.service.iface;

import java.util.List;

import com.dt.jxhd.domain.JXHD_NOTSEL;
import com.dt.jxhd.domain.JXHD_QuestionPaper;
import com.dt.jxhd.domain.JXHD_SEL;
import com.dt.jxhd.domain.JXHD_shijuan;
import com.dt.jxhd.domain.evaluation_grade;
import com.dt.jxhd.domain.evaluation_item;
import com.dt.jxhd.domain.evaluation_item_grade;
import com.dt.jxhd.domain.evaluation_result;
import com.dt.jxhd.domain.evaluation_student;
import com.dt.jxhd.domain.evalution_comment;
import com.dt.jxhd.domain.evalution_teacher_comment;
import com.dt.jxhd.domain.test_item;



public interface IPjglService {

	public Object save(evaluation_item evaluation_item);
	public List update(evaluation_item evaluation_item);
	public List items(evaluation_item evaluation_item);
	public evaluation_item evaluationById(evaluation_item evaluation_item);
	public int getMaxItemCountNum(evaluation_item evaluation_item);
	public List deleteItem(evaluation_item evaluation_item);
	public Object saveGrade(evaluation_grade evaluation_grade);
	public List updateGrade(evaluation_grade evaluation_grade);
	public List evaluationGrades(evaluation_grade evaluation_grade);
	public evaluation_grade evaluationGradeById(evaluation_grade evaluation_grade);
	public int getMaxItemCountNum(evaluation_grade evaluation_grade);
	public List deleteGrade(evaluation_grade evaluation_grade);
	public Object saveEvaluationStu(evaluation_student evaluation_student);
	public List updateEvaluationStu(evaluation_student evaluation_student);
	public List EvaluationStus(evaluation_student evaluation_student);
	public evaluation_student EvaluationStuById(evaluation_student evaluation_student);
	public int getMaxEvaluationStuCountNum(evaluation_student evaluation_student);
	public List deleteEvaluationStu(evaluation_student evaluation_student);
	public Object saveEvaluationRes(evaluation_result evaluation_reuslt);
	public List updateEvaluationRes(evaluation_result evaluation_reuslt);
	public List EvaluationStus(evaluation_result evaluation_reuslt);
	public evaluation_student EvaluationStuById(evaluation_result evaluation_reuslt);
	public int getMaxEvaluationStuCountNum(evaluation_result evaluation_reuslt);
	public List deleteEvaluationStu(evaluation_result evaluation_reuslt);
	public List EvaluationGroups(evaluation_result evaluation_reuslt);
	public int getMaxEvaluationGroupCountNum(evaluation_result evaluation_reuslt);
	public List deleteEvaluationGroup(evaluation_result evaluation_reuslt);
	public Object save(evaluation_item_grade evaluation_item_grade);
	public void deleteEvaluationItemGrade(evaluation_item_grade evaluation_item_grade);
	public List itemGrades(evaluation_item_grade evaluation_item_grade);
	public List evaluationGradeByItemId(evaluation_grade evaluation_grade);
//	public int getClassAndStudentCommentCountNum(evalution_teacher_comment evalution_teacher_comment);
//	public List getClassAndStudentCommentList(evalution_teacher_comment evalution_teacher_comment);
	public int getTeacherCommentForTeacherCountNum(evalution_teacher_comment t_teacher_comment);
	public List getTeacherForTeacherComment(evalution_teacher_comment t_teacher_comment);
	public int getBeCommentStudentCountNum(
			evalution_teacher_comment t_teacher_comment);
	public List getBeCommentStudentList(
			evalution_teacher_comment t_teacher_comment);
	public int getBeCommentTeacherSelfCountNum(
			evalution_teacher_comment t_teacher_comment);
	public List getBeCommentTeacherSelfList(
			evalution_teacher_comment t_teacher_comment);
	public int getBeCommentTeacherCountNum(
			evalution_teacher_comment t_teacher_comment);
	public List getBeCommentTeacherList(
			evalution_teacher_comment t_teacher_comment);
	public List getLookStudentBeCommented(
			evalution_teacher_comment t_teacher_comment);
	public int selectTeacherComment(
			evalution_teacher_comment t_teacher_comment);
	public void updateTeacherComment(evalution_comment t_teacher_comment);
	public Integer insertTeacherComment(
			evalution_teacher_comment t_teacher_comment);
	public evalution_teacher_comment insertCommentByTeacher(
			evalution_teacher_comment t_teacher_comment);
}
