package com.dt.jxhd.service.iface;

import java.util.List;

import com.dt.jxhd.domain.notice;



public interface IArticleService {
	public Object save(notice notice);//���ӹ���
	public List<notice> articles(notice notice);//���ҹ��漯��
	public notice articleById(notice notice);//����notice��ѯһ����¼
	public List<notice> update(notice notice);//�޸Ĺ����ٷ��ز��ҹ��漯��
	public int getMaxFileCountNum(notice notice);//����������
	public List<notice> deleteArticle(notice notice);//ɾ�������ٷ��ع��漯��
}
