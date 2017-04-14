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
	//���ݲ�ͬ�����ͻ����ǰ�Ѿ��ʴ����Ŀ
	public int getMaxAskCountNum(ask_log ask_log);
	public List deleteAsk(ask_log ask_log);
	public List answers(answer_log answer_log);
	public ask_log getIsAnswerById(ask_log ask_log);
	public test_item itemByAskId(test_item test_item);
	public List twtj(ask_log ask_log);
	public List hdtj(ask_log ask_log);
	public List savePreviewQuestion(preview preview);
	public List lookPreviewQuestion(preview preview);
	//�õ���Ӹ����༶Ԥϰ�������
	public int getPreviewQuestionNumber(preview preview);
	//����id��ѯ���������
	public preview lookPreviewQuestionById(preview preview);
	//�õ�������Ŀ������
	public int getDetailQuestionNumber(preview preview);
	//�õ��������Ŀ
	public List getDetailQuestion(preview preview);
	//�õ������͵ķ���
	public List selectGroup(group_error group_error);
	//�õ���������е�ѧ��
	public List getGroupStudentId(group_error group_error);
	//���������Ŀ����
	public Object insertErrorDispatcher(error_dispatcher error_dispatcher);
	//����ԭ���Ĵ������
	public Object updateBeforeGroups(group_error group_error);
	//�������ڵĴ������
	public Object saveErrorGroup(group_error group_error);
	//�޸ĵ�ʱ�򣬵õ��ִ��ڵķ���
	public List getErrorGroups(group_error group_error);
	
	// ��ʦ��ӵ�Ԥϰ����
	public Object addPreview(preview_add t_preview_add);
	// ��ȡԤϰ�б�
	public List previewItems(preview_add t_preview_add);
	// �õ���ʦӵ�е�Ԥϰ����
	public int getPreviewCountNum(preview_add t_preview_add);
	// �������ԤϰID��preview_send����
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
