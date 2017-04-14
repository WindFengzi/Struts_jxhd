package com.dt.jxhd.service.impl;

import java.util.List;

import com.dt.jxhd.commons.service.BaseService;
import com.dt.jxhd.domain.answer_log;
import com.dt.jxhd.domain.ask_log;
import com.dt.jxhd.domain.ask_question;
import com.dt.jxhd.domain.error_dispatcher;
import com.dt.jxhd.domain.group_error;
import com.dt.jxhd.domain.preview;
import com.dt.jxhd.domain.preview_add;
import com.dt.jxhd.domain.preview_send;
import com.dt.jxhd.domain.test_item;
import com.dt.jxhd.service.iface.IQuestionService;

public class QuestionService extends BaseService implements IQuestionService{

	public Object save(test_item test_item){
		return this.insertBySqlAndReturn("test_item.item_insert",test_item);
	}
	public List update(test_item test_item){
		this.updateBySql("test_item.item_update",test_item);
		test_item = new test_item();
		return (List) this.getListData("test_item.items", test_item);
	}
	public List items(test_item test_item){
		// TODO
		return (List) this.getListData("test_item.items", test_item);
	}
	public test_item itemById(test_item test_item){
		return (test_item) this.getSingleData("test_item.item_selectById", test_item);
	}
	public test_item itemByAskId(test_item test_item){
		return (test_item) this.getSingleData("test_item.item_selectByAskId", test_item);
	}
	public int getMaxItemCountNum(test_item test_item){
		Object obj = this.getSingleData("test_item.getItemCountnum",test_item);
		int num = 0;
		if (obj != null) {
			num = ((Integer) obj).intValue();
		}
		return num;
	}
	public List deleteItem(test_item test_item){
		this.deleteBySql("test_item.deleteItem",test_item);
		test_item = new test_item();
		return (List) this.getListData("test_item.items", test_item);
	}
	public Object save(ask_log ask_log){
		return this.insertBySqlAndReturn("ask_log.ask_insert",ask_log);
	}
	public List update(ask_log ask_log){
		this.updateBySql("ask_log.ask_update",ask_log);
		ask_log = new ask_log();
		return (List) this.getListData("ask_log.asks", ask_log);
	}
	public List asks(ask_log ask_log){
		return (List) this.getListData("ask_log.asks", ask_log);
	}
	public List twtj(ask_log ask_log){
		return (List) this.getListData("ask_log.twtj", ask_log);
	}
	public List hdtj(ask_log ask_log){
		return (List) this.getListData("ask_log.hdtj", ask_log);
	}
	public ask_log askById(ask_log ask_log){
		return (ask_log) this.getSingleData("ask_log.ask_selectById", ask_log);
	}
	public ask_log getIsAnswerById(ask_log ask_log){
		return (ask_log) this.getSingleData("ask_log.v_get_is_answerById", ask_log);
	}
	//根据类型获得以前问答的题目
	public int getMaxAskCountNum(ask_log ask_log){
		Object obj = this.getSingleData("ask_log.getAskCountnum",ask_log);
		int num = 0;
		if (obj != null) {
			num = ((Integer) obj).intValue();
		}
		return num;
	}
	public List deleteAsk(ask_log ask_log){
		this.deleteBySql("ask_log.deleteAsk",ask_log);
		//ask_log = new ask_log();
		return (List) this.getListData("ask_log.asks", ask_log);
	}
	public List answers(answer_log answer_log){
		return (List) this.getListData("answer_log.answers", answer_log);
	}
	@Override
	public List savePreviewQuestion(preview preview) {
		// TODO Auto-generated method stub
		this.updateBySqlAndReturn("preview.updatePreviewQuestion", preview);
		this.insertBySqlAndReturn("preview.addPreviewQuestion", preview);
		return (List)this.getListData("preview.selectPreviewBefore", preview);
	}
	@Override
	public List lookPreviewQuestion(preview preview) {
		// TODO Auto-generated method stub
		return (List)this.getListData("preview.selectPreviewBefore", preview);
	}
	//根据id查询具体的新闻
	@Override
	public preview lookPreviewQuestionById(preview preview) {
		// TODO Auto-generated method stub
		return (preview)this.getSingleData("preview.lookPreviewQuestionById", preview);
	}
	@Override
	public List getDetailQuestion(preview preview) {
		// TODO Auto-generated method stub
		return (List)this.getListData("preview.getDetailQuestion", preview);
	}
	//给多少个班级添加预习题
	@Override
	public int getPreviewQuestionNumber(preview preview) {
		// TODO Auto-generated method stub
		Object obj = this.getSingleData("preview.getPreviewQuestionNumber",preview);
		int num = 0;
		if (obj != null) {
			num = ((Integer) obj).intValue();
		}
		return num;
	}
	//得到具体添加预习题目的数量，便于分页
	@Override
	public int getDetailQuestionNumber(preview preview) {
		// TODO Auto-generated method stub
		Object obj = this.getSingleData("preview.getDetailQuestionNumber",preview);
		int num = 0;
		if (obj != null) {
			num = ((Integer) obj).intValue();
		}
		return num;
	}
	//得到错误发送的分组
	@Override
	public List selectGroup(group_error group_error) {
		// TODO Auto-generated method stub
		return (List)this.getListData("group_error.selectGroup", group_error);
	}
	//得到错误分组中的学生
	@Override
	public List getGroupStudentId(group_error group_error) {
		// TODO Auto-generated method stub
		return (List)this.getListData("group_error.getGroupStudentId", group_error);
	}
	//插入错误分组数据
	@Override
	public Object insertErrorDispatcher(error_dispatcher error_dispatcher) {
		return this.insertBySqlAndReturn("error_dispatcher.insertErrorDispatcher", error_dispatcher);
	}
	@Override
	public Object updateBeforeGroups(group_error group_error) {
		return this.updateBySqlAndReturn("group_error.updateBeforeGroups", group_error);
	}
	@Override
	public Object saveErrorGroup(group_error group_error) {
		return this.insertBySqlAndReturn("group_error.saveErrorGroup", group_error);
	}
	@Override
	public List getErrorGroups(group_error group_error) {
		return this.getListData("group_error.getErrorGroups", group_error);
	}
	/**
	 * @date 2016/10/10
	 * */
	@Override
	public Object addPreview(preview_add t_preview_add) {
		return this.insertBySqlAndReturn("preview_add.addPreview", t_preview_add);
	}
	@Override
	public List previewItems(preview_add t_preview_add) {
		// TODO Auto-generated method stub
		return (List)this.getListData("preview_add.previewItems", t_preview_add);
	}
	@Override
	public int getPreviewCountNum(preview_add t_preview_add) {
		Object obj = this.getSingleData("preview_add.getItemCountnum",t_preview_add);
		int num = 0;
		if (obj != null) {
			num = ((Integer) obj).intValue();
		}
		return num;
	}
	@Override
	public void insertPreviewSent(preview_send t_preview_send) {
		// TODO Auto-generated method stub
		this.insertBySqlAndReturn("preview_send.addPreviewSend", t_preview_send);
	}
	@Override
	public int getPreviewCountNum(preview_send t_preview_send) {
		// TODO Auto-generated method stub
		Object obj = this.getSingleData("preview_send.getItemCountnum",t_preview_send);
		int num = 0;
		if (obj != null) {
			num = ((Integer) obj).intValue();
		}
		return num;
	}
	@Override
	public List previewItems(preview_send t_preview_send) {
		// TODO Auto-generated method stub
		return (List)this.getListData("preview_send.releasePreviewLog", t_preview_send);
	}
	@Override
	public int selectCommon(preview_send t_preview_send) {
		// TODO Auto-generated method stub
		Object obj = this.getSingleData("preview_send.getSelectCommomNum",t_preview_send);
		int num = 0;
		if (obj != null) {
			num = ((Integer) obj).intValue();
		}
		return num;
	}
	@Override
	public preview_send selectLookPrevieqLog(preview_send t_preview_send) {
		// TODO Auto-generated method stub 
		return (preview_send) this.getSingleData("preview_send.lookPrevieqLog", t_preview_send);
	}
	@Override
	public String selectClassName(Integer temp_id) {
		// TODO Auto-generated method stub
		Object obj = this.getSingleData("preview_send.getclassname", temp_id);
		return obj.toString();
	}
	@Override
	public boolean deletePreviewSend(preview_send t_preview_send) {
		// TODO Auto-generated method stub
		this.deleteBySql("preview_send.deletePreviewSend", t_preview_send);
		return true;
	}
	@Override
	public int getAskQueCountNum(ask_question t_ask_question) {
		Object obj = this.getSingleData("ask_question.getCountNum",t_ask_question);
		int num = 0;
		if (obj != null) {
			num = ((Integer) obj).intValue();
		}
		return num;
	}
	@Override
	public List<ask_question> askQueItems(ask_question t_ask_question) {
		return (List)this.getListData("ask_question.getAskQueList", t_ask_question);
	}
}
