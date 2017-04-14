package com.dt.jxhd.service.impl;

import java.util.List;

import com.dt.jxhd.commons.service.BaseService;
import com.dt.jxhd.domain.notice;
import com.dt.jxhd.service.iface.IArticleService;
//公告管理
public class ArticleService extends BaseService implements IArticleService{

	public Object save(notice notice){
		return this.insertBySqlAndReturn("notice.article_insert",notice);
	}
	@SuppressWarnings("unchecked")
	public List<notice> update(notice notice){
		this.updateBySql("notice.article_update",notice);//修改某一条数据
		return (List<notice>) this.getListData("notice.articles", notice);//得到所有数据并返回
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
			num = ((Integer) obj).intValue();//得到Object对象转化为Integer在调用其intValue属性
		}
		return num;
	}
	@SuppressWarnings("unchecked")
	public List<notice> deleteArticle(notice notice){//删除一条公告后返回所有公告
		this.deleteBySql("notice.deleteArticle",notice);
		return (List<notice>) this.getListData("notice.articles", notice);
	}
}
