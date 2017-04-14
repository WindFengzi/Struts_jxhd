package com.dt.jxhd.service.impl;

import java.util.List;

import com.dt.jxhd.commons.service.BaseService;
import com.dt.jxhd.domain.notice;
import com.dt.jxhd.service.iface.IArticleService;
//�������
public class ArticleService extends BaseService implements IArticleService{

	public Object save(notice notice){
		return this.insertBySqlAndReturn("notice.article_insert",notice);
	}
	@SuppressWarnings("unchecked")
	public List<notice> update(notice notice){
		this.updateBySql("notice.article_update",notice);//�޸�ĳһ������
		return (List<notice>) this.getListData("notice.articles", notice);//�õ��������ݲ�����
	}
	@SuppressWarnings("unchecked")
	public List<notice> articles(notice notice){
		return (List<notice>) this.getListData("notice.articles", notice);
	}
	public notice articleById(notice notice){
		return (notice) this.getSingleData("notice.article_selectById", notice);
	}
	public int getMaxFileCountNum(notice notice){
		Object obj = this.getSingleData("notice.getArticleCountnum",notice);
		int num = 0;
		if (obj != null) {
			num = ((Integer) obj).intValue();//�õ�Object����ת��ΪInteger�ڵ�����intValue����
		}
		return num;
	}
	@SuppressWarnings("unchecked")
	public List<notice> deleteArticle(notice notice){//ɾ��һ������󷵻����й���
		this.deleteBySql("notice.deleteArticle",notice);
		return (List<notice>) this.getListData("notice.articles", notice);
	}
}
