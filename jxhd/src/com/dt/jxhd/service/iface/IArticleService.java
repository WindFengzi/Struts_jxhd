package com.dt.jxhd.service.iface;

import java.util.List;

import com.dt.jxhd.domain.notice;



public interface IArticleService {
	public Object save(notice notice);//增加公告
	public List<notice> articles(notice notice);//查找公告集合
	public notice articleById(notice notice);//根据notice查询一条记录
	public List<notice> update(notice notice);//修改公告再返回查找公告集合
	public int getMaxFileCountNum(notice notice);//文章总条数
	public List<notice> deleteArticle(notice notice);//删除公告再返回公告集合
}
