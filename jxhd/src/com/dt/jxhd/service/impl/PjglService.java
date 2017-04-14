package com.dt.jxhd.service.impl;

import java.util.List;

import com.dt.jxhd.commons.service.BaseService;
import com.dt.jxhd.domain.evaluation_grade;
import com.dt.jxhd.domain.evaluation_item;
import com.dt.jxhd.domain.evaluation_item_grade;
import com.dt.jxhd.domain.evaluation_result;
import com.dt.jxhd.domain.evaluation_student;
import com.dt.jxhd.domain.evalution_comment;
import com.dt.jxhd.domain.evalution_teacher_comment;
import com.dt.jxhd.service.iface.IPjglService;

public class PjglService extends BaseService implements IPjglService{

	public Object save(evaluation_item evaluation_item){
		return this.insertBySqlAndReturn("evaluation_item.evaluation_insert",evaluation_item);
	}
	public List update(evaluation_item evaluation_item){
		this.updateBySql("evaluation_item.evaluation_update",evaluation_item);
		evaluation_item = new evaluation_item();
		return (List) this.getListData("evaluation_item.evaluations", evaluation_item);
	}
	public List items(evaluation_item evaluation_item){
		return (List) this.getListData("evaluation_item.evaluations", evaluation_item);
	}
	public evaluation_item evaluationById(evaluation_item evaluation_item){
		return (evaluation_item) this.getSingleData("evaluation_item.evaluation_selectById", evaluation_item);
	}
	public int getMaxItemCountNum(evaluation_item evaluation_item){
		Object obj = this.getSingleData("evaluation_item.getItemCountnum",evaluation_item);
		int num = 0;
		if (obj != null) {
			num = ((Integer) obj).intValue();
		}
		return num;
	}
	public List deleteItem(evaluation_item evaluation_item){
		this.deleteBySql("evaluation_item.deleteEvaluation",evaluation_item);
		evaluation_item = new evaluation_item();
		return (List) this.getListData("evaluation_item.evaluations", evaluation_item);
	}
	public Object saveGrade(evaluation_grade evaluation_grade){
		return this.insertBySqlAndReturn("evaluation_grade.grade_insert",evaluation_grade);
	}
	public List updateGrade(evaluation_grade evaluation_grade){
		this.updateBySql("evaluation_grade.grade_update",evaluation_grade);
		evaluation_grade = new evaluation_grade();
		return (List) this.getListData("evaluation_grade.evaluationGrades", evaluation_grade);
	}
	public List evaluationGrades(evaluation_grade evaluation_grade){
		return (List) this.getListData("evaluation_grade.evaluationGrades", evaluation_grade);
	}
	public evaluation_grade evaluationGradeById(evaluation_grade evaluation_grade){
		return (evaluation_grade) this.getSingleData("evaluation_grade.grade_selectById", evaluation_grade);
	}
	public List evaluationGradeByItemId(evaluation_grade evaluation_grade){
		return (List) this.getListData("evaluation_grade.grade_selectByItemId", evaluation_grade);
	}
	public int getMaxItemCountNum(evaluation_grade evaluation_grade){
		Object obj = this.getSingleData("evaluation_grade.getGradeCountnum",evaluation_grade);
		int num = 0;
		if (obj != null) {
			num = ((Integer) obj).intValue();
		}
		return num;
	}
	public List deleteGrade(evaluation_grade evaluation_grade){
		this.deleteBySql("evaluation_grade.deleteEvaluationGrade",evaluation_grade);
		evaluation_grade = new evaluation_grade();
		return (List) this.getListData("evaluation_grade.evaluationGrades", evaluation_grade);
	}
	public Object saveEvaluationStu(evaluation_student evaluation_student){
		return this.insertBySqlAndReturn("evaluation_student.evaluationStu_insert",evaluation_student);
	}
	public List updateEvaluationStu(evaluation_student evaluation_student){
		this.updateBySql("evaluation_student.evaluationStu_update",evaluation_student);
		evaluation_student = new evaluation_student();
		return (List) this.getListData("evaluation_student.evaluationStudents", evaluation_student);
	}
	public List EvaluationStus(evaluation_student evaluation_student){
		return (List) this.getListData("evaluation_student.evaluationStudents", evaluation_student);
	}
	public evaluation_student EvaluationStuById(evaluation_student evaluation_student){
		return (evaluation_student) this.getSingleData("evaluation_student.evaluationStu_selectById", evaluation_student);
	}
	public int getMaxEvaluationStuCountNum(evaluation_student evaluation_student){
		Object obj = this.getSingleData("evaluation_student.getEvaluationStuCountnum",evaluation_student);
		int num = 0;
		if (obj != null) {
			num = ((Integer) obj).intValue();
		}
		return num;
	}
	public List deleteEvaluationStu(evaluation_student evaluation_student){
		this.deleteBySql("evaluation_student.deleteEvaluationStu",evaluation_student);
		evaluation_student = new evaluation_student();
		return (List) this.getListData("evaluation_student.evaluationStudents", evaluation_student);
	}
	public Object saveEvaluationRes(evaluation_result evaluation_reuslt){
		return this.insertBySqlAndReturn("evaluation_result.evaluationRes_insert",evaluation_reuslt);
	}
	public List updateEvaluationRes(evaluation_result evaluation_reuslt){
		this.updateBySql("evaluation_result.evaluationStu_update",evaluation_reuslt);
		evaluation_reuslt = new evaluation_result();
		return (List) this.getListData("evaluation_result.evaluationResults", evaluation_reuslt);
	}
	public List EvaluationStus(evaluation_result evaluation_reuslt){
		return (List) this.getListData("evaluation_result.evaluationResults", evaluation_reuslt);
	}
	public List EvaluationGroups(evaluation_result evaluation_reuslt){
		return (List) this.getListData("evaluation_result.evaluationGroups", evaluation_reuslt);
	}
	public evaluation_student EvaluationStuById(evaluation_result evaluation_reuslt){
		return (evaluation_student) this.getSingleData("evaluation_result.evaluationRes_selectById", evaluation_reuslt);
	}
	public int getMaxEvaluationStuCountNum(evaluation_result evaluation_reuslt){
		Object obj = this.getSingleData("evaluation_result.getEvaluationResCountnum",evaluation_reuslt);
		int num = 0;
		if (obj != null) {
			num = ((Integer) obj).intValue();
		}
		return num;
	}
	public int getMaxEvaluationGroupCountNum(evaluation_result evaluation_reuslt){
		Object obj = this.getSingleData("evaluation_result.getEvaluationGroupCountnum",evaluation_reuslt);
		int num = 0;
		if (obj != null) {
			num = ((Integer) obj).intValue();
		}
		return num;
	}
	public List deleteEvaluationStu(evaluation_result evaluation_reuslt){
		this.deleteBySql("evaluation_result.deleteEvaluationRes",evaluation_reuslt);
		evaluation_reuslt = new evaluation_result();
		return (List) this.getListData("evaluation_result.evaluationResults", evaluation_reuslt);
	}
	public List deleteEvaluationGroup(evaluation_result evaluation_reuslt){
		this.deleteBySql("evaluation_result.deleteEvaluationRes",evaluation_reuslt);
		evaluation_reuslt = new evaluation_result();
		return (List) this.getListData("evaluation_result.evaluationGroups", evaluation_reuslt);
	}
	public Object save(evaluation_item_grade evaluation_item_grade){
		return this.insertBySqlAndReturn("evaluation_item_grade.item_grade_insert",evaluation_item_grade);
	}
	public void deleteEvaluationItemGrade(evaluation_item_grade evaluation_item_grade){
		this.deleteBySql("evaluation_item_grade.item_grade_delete",evaluation_item_grade);
	}
	public List itemGrades(evaluation_item_grade evaluation_item_grade){
		return (List) this.getListData("evaluation_item_grade.itemGrades", evaluation_item_grade);
	}
	@Override
	public int getTeacherCommentForTeacherCountNum(evalution_teacher_comment t_teacher_comment) {
		// TODO Auto-generated method stub
		Object obj = this.getSingleData("evalution_teacher_comment.getTeacherClassTeacherCountNum",t_teacher_comment);
		int num = 0;
		if (obj != null) {
			num = ((Integer) obj).intValue();
		}
		return num;
	}
	@Override
	public List getTeacherForTeacherComment(evalution_teacher_comment t_teacher_comment) {
		// TODO Auto-generated method stub
		return this.getListData("evalution_teacher_comment.getTeacherAndTeacherClassComment", t_teacher_comment);
	}
	@Override
	public int getBeCommentStudentCountNum(
			evalution_teacher_comment t_teacher_comment) {
		Object obj = this.getSingleData("evalution_teacher_comment.beCommentedStudentCountNumber",t_teacher_comment);
		int num = 0;
		if (obj != null) {
			num = ((Integer) obj).intValue();
		}
		return num;
	}
	@Override
	public List getBeCommentStudentList(
			evalution_teacher_comment t_teacher_comment) {
		// TODO Auto-generated method stub
		return this.getListData("evalution_teacher_comment.beCommentedStudentList", t_teacher_comment);
	}
	@Override
	public int getBeCommentTeacherSelfCountNum(
			evalution_teacher_comment t_teacher_comment) {
		Object obj = this.getSingleData("evalution_teacher_comment.beCommentedTeacherSelfAndCountNumber",t_teacher_comment);
		int num = 0;
		if (obj != null) {
			num = ((Integer) obj).intValue();
		}
		return num;
	}
	@Override
	public List getBeCommentTeacherSelfList(
			evalution_teacher_comment t_teacher_comment) {
		// TODO Auto-generated method stub
		return this.getListData("evalution_teacher_comment.beCommentedTeacherAndSelfList", t_teacher_comment);
	}
	@Override
	public int getBeCommentTeacherCountNum(
			evalution_teacher_comment t_teacher_comment) {
		Object obj = this.getSingleData("evalution_teacher_comment.beCommentedTeacherCountNumber",t_teacher_comment);
		int num = 0;
		if (obj != null) {
			num = ((Integer) obj).intValue();
		}
		return num;
	}
	@Override
	public List getBeCommentTeacherList(
			evalution_teacher_comment t_teacher_comment) {
		// TODO Auto-generated method stub
		return this.getListData("evalution_teacher_comment.beCommentedTeacherList", t_teacher_comment);
	}
	@Override
	public List getLookStudentBeCommented(
			evalution_teacher_comment t_teacher_comment) {
		// TODO Auto-generated method stub
		return this.getListData("evalution_teacher_comment.lookBeCommentedStudentCentent", t_teacher_comment);
	}
	@Override
	public int selectTeacherComment(
			evalution_teacher_comment t_teacher_comment) {
		// TODO Auto-generated method stub
		Object obj = this.getSingleData("evalution_teacher_comment.selectComment", t_teacher_comment);
		int num = 0;
		if (obj != null) {
			num = ((Integer) obj).intValue();
		}
		return num;
	}
	@Override
	public void updateTeacherComment(evalution_comment t_teacher_comment) {
		// TODO Auto-generated method stub
		this.updateBySql("evalution_comment.updateComment",t_teacher_comment);
	}
	@Override
	public Integer insertTeacherComment(
			evalution_teacher_comment t_teacher_comment) {
		// TODO Auto-generated method stub
		Integer n = ((Integer)this.insertBySqlAndReturn("evalution_comment.insertEvalutionComment",t_teacher_comment)).intValue();
		//System.out.println("-----n" + n);
		return n;
	}
	@Override
	public evalution_teacher_comment insertCommentByTeacher(
			evalution_teacher_comment t_teacher_comment) {
		// TODO Auto-generated method stub
		return (evalution_teacher_comment) this.insertBySqlAndReturn("evalution_teacher_comment.insertTeacherComment",t_teacher_comment);
	}
}
