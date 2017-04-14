package com.dt.jxhd.service.iface;

import java.util.List;

import com.dt.jxhd.domain.JXHD_NOTSEL;
import com.dt.jxhd.domain.JXHD_QuestionPaper;
import com.dt.jxhd.domain.JXHD_SEL;
import com.dt.jxhd.domain.JXHD_shijuan;
import com.dt.jxhd.domain.answer_log;
import com.dt.jxhd.domain.ask_log;
import com.dt.jxhd.domain.ask_question;
import com.dt.jxhd.domain.error_dispatcher;
import com.dt.jxhd.domain.group_error;
import com.dt.jxhd.domain.preview;
import com.dt.jxhd.domain.preview_add;
import com.dt.jxhd.domain.preview_send;
import com.dt.jxhd.domain.test_item;



public interface IQuestionService {

	public Object save(test_item test_item);
	public List update(test_item test_item);
	public List items(test_item test_item);
	public test_item itemById(test_item test_item);
	public int getMaxItemCountNum(test_item test_item);
	public List deleteItem(test_item test_item);
	public Object save(ask_log ask_log);
	public List update(ask_log ask_log);
	public List asks(ask_log ask_log);
	public ask_log askById(ask_log ask_log);
	//根据不同的类型获得以前已经问答的题目
	public int getMaxAskCountNum(ask_log ask_log);
	public List deleteAsk(ask_log ask_log);
	public List answers(answer_log answer_log);
	public ask_log getIsAnswerById(ask_log ask_log);
	public test_item itemByAskId(test_item test_item);
	public List twtj(ask_log ask_log);
	public List hdtj(ask_log ask_log);
	public List savePreviewQuestion(preview preview);
	public List lookPreviewQuestion(preview preview);
	//得到添加各个班级预习题的数量
	public int getPreviewQuestionNumber(preview preview);
	//根据id查询具体的新闻
	public preview lookPreviewQuestionById(preview preview);
	//得到具体题目的数量
	public int getDetailQuestionNumber(preview preview);
	//得到具体的题目
	public List getDetailQuestion(preview preview);
	//得到错误发送的分组
	public List selectGroup(group_error group_error);
	//得到错误分组中的学生
	public List getGroupStudentId(group_error group_error);
	//插入错误题目数据
	public Object insertErrorDispatcher(error_dispatcher error_dispatcher);
	//更新原来的错误分组
	public Object updateBeforeGroups(group_error group_error);
	//保存现在的错误分组
	public Object saveErrorGroup(group_error group_error);
	//修改的时候，得到现存在的分组
	public List getErrorGroups(group_error group_error);
	
	// 老师添加的预习内容
	public Object addPreview(preview_add t_preview_add);
	// 获取预习列表
	public List previewItems(preview_add t_preview_add);
	// 得到老师拥有的预习条数
	public int getPreviewCountNum(preview_add t_preview_add);
	// 批量添加预习ID到preview_send表中
	public void insertPreviewSent(preview_send t_preview_send);
	
	public int getPreviewCountNum(preview_send t_preview_send);
	public List previewItems(preview_send t_preview_send);
	public int selectCommon(preview_send t_preview_send);
	public preview_send selectLookPrevieqLog(preview_send t_preview_send);
	public String selectClassName(Integer temp_id);
	public boolean deletePreviewSend(preview_send t_preview_send);
	public int getAskQueCountNum(ask_question t_ask_question);
	public List<ask_question> askQueItems(ask_question t_ask_question);
}
