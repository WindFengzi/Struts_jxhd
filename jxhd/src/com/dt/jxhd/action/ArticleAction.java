package com.dt.jxhd.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.dt.jxhd.domain.T_SYS_LOG;
import com.dt.jxhd.domain.notice;
import com.dt.jxhd.service.iface.IArticleService;
import com.dt.jxhd.service.iface.ILogService;


public class ArticleAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	private static final int BUFFER_SIZE=16*1024;
	//用于自动装配属性,自动注入articleService的bean
	public IArticleService articleService;
	public void setArticleService(IArticleService articleService) {
		this.articleService = articleService;
	}
	
	public notice notice;//公告
	public notice getNotice() {
		return notice;
	}
	public void setNotice(notice notice) {
		this.notice = notice;
	}
	public List<notice> list;//用来保存所有返回的数据
	public List<notice> getList() {
		return list;
	}
	public void setList(List<notice> list) {
		this.list = list;
	}
	public String msg;
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	private File[] fjupload;//上传的文件的name属性
	private String[] fjuploadFileName;//上传文件的文件名数组，这个是根据上面的fjupload来的
	private String savePath;//文件上传的默认路径，在strutsConfig.xml中有配置
	
	public File[] getFjupload() {
		return fjupload;
	}
	public void setFjupload(File[] fjupload) {
		this.fjupload = fjupload;
	}

	public String[] getFjuploadFileName() {
		return fjuploadFileName;
	}
	public void setFjuploadFileName(String[] fjuploadFileName) {
		this.fjuploadFileName = fjuploadFileName;
	}
	
	public String getSavePath() {
		return savePath;
	}
	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}
	/*private File upload;       //文件   
	private String uploadContentType;   //文件类型
	public File getUpload() {
		return upload;
	}
	public void setUpload(File upload) {
		this.upload = upload;
	}
	public String getUploadContentType() {
		return uploadContentType;
	}
	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}*/
	
	private T_SYS_LOG T_SYS_LOG;//系统日志
	public T_SYS_LOG getT_SYS_LOG() {
		return T_SYS_LOG;
	}
	public void setT_SYS_LOG(T_SYS_LOG t_sys_log) {
		T_SYS_LOG = t_sys_log;
	}
	//自动装配logService的bean
	private ILogService logService;

	public void setLogService(ILogService logService) {
		this.logService = logService;
	}
	
	//公告添加的实际操作
	public String saveArticle() throws Exception{
		if(getSession().getAttribute("roles").toString().indexOf("1002,")==-1){
			return "noRight";
		}
		File[] fjFiles = this.getFjupload();
        String path1 = "";
	        
        List<String> successFileList1=new ArrayList<String>();   
		if(fjFiles!=null){
        	for (int i = 0; i < fjFiles.length; i++) {   
            	String path2 = fjuploadFileName[i];
                String dstPath = getRealyPath(getSavePath())   
                        + "\\" +fjuploadFileName[i];
                File dstFile = new File(dstPath);   
                if(copy(fjFiles[i], dstFile)){//调用copy静态方法，文件复制操作
                      successFileList1.add(getFjuploadFileName()[i]);
                }
                if(notice.getClassId()!=null){//根本没有作用
                	 if(notice.getClassId().toString().equals("5")){
                    	 path1 = path2;
                    }else{
                    	 path1 = path1+path2+",";
                    }
                }else{
                	 path1 = path1+path2+",";
                }
            }
        }
		if(notice == null){//添加-保存-编辑-返回可能会出现错误
			notice = new notice();
			notice.setRecNum(articleService.getMaxFileCountNum(notice));
			notice.setData(articleService.articles(notice));
			return "list";
		}
		notice.setUpdateTime(new Date());
		notice.setPubIt(Integer.valueOf(1));
		notice.setDeleted(Integer.valueOf(0));
		notice.setBody(getRequest().getParameter("body"));
		notice.setPublisher(getSession().getAttribute("userName").toString());
		notice.setAttachfileurl(path1);
		articleService.save(notice);
		//添加到日志，dbo.T_SYS_LOG只有新闻日志，调用本类中的insertSysLog方法
		this.insertSysLog("添加："+notice.getTitle()+" 公告信息。","1");
		//添加后重新
		notice = new notice();
		notice.setRecNum(articleService.getMaxFileCountNum(notice));
		notice.setData(articleService.articles(notice));
		return "list";
	}
	
	//公告添加，直接转向添加页面
	public String toInsert() throws Exception{
		if(getSession().getAttribute("roles").toString().indexOf("1002,")==-1){
			return "noRight";
		}
		return "insert";
	}
	
	//公告查询
	public String articles() throws Exception{
		if(getSession().getAttribute("roles").toString().indexOf("1001,")==-1){
			return "noRight";
		}
		if(notice==null){
			notice = new notice();//因为需要得到数据，用notice来保存数据
		}
		if(getRequest().getParameter("msg")!=null){//msg本来就是null,不会执行下面语句
			notice.setClassId(Integer.valueOf(getRequest().getParameter("msg")));
			getRequest().setAttribute("msg", getRequest().getParameter("msg"));
		}
		notice.setRecNum(articleService.getMaxFileCountNum(notice));//得到文章条数
		notice.setData(articleService.articles(notice));//得到文章的集合
		return "list";
	}
	
	
	//修改某一条新闻
	public String articleById() throws Exception{
		if(getSession().getAttribute("roles").toString().indexOf("1003,")==-1){
			return "noRight";
		}
		notice = articleService.articleById(notice);
		//如果有多个附件，将多个附件的名字分开，保存在fjuploadFileName数组中
		if(notice.getAttachfileurl()!=null&&!notice.getAttachfileurl().equals("")){
			fjuploadFileName = notice.getAttachfileurl().split(",");
		}
		return "update";
	}
	//根据id查询一条新闻
	public String articleByIdView() throws Exception{
		notice = articleService.articleById(notice);
		if(notice.getAttachfileurl()!=null&&!notice.getAttachfileurl().equals("")){
			fjuploadFileName = notice.getAttachfileurl().split(",");
			/*for(int i = 0;i<fjuploadFileName.length;i++){
				System.out.println("uploadName1" + fjuploadFileName[i]);
			}*/
		}
		return "view";
	}
	
	//修改并保存然后显示一条公告
	public String updateArticle() throws Exception{
		if(getSession().getAttribute("roles").toString().indexOf("1003,")==-1){
			return "noRight";
		}
		File[] fjFiles = this.getFjupload();
        String path1 = "";
        List<String> successFileList1=new ArrayList<String>();   
		if(fjFiles!=null){
       	for (int i = 0; i < fjFiles.length; i++) { 
           	String path2 = fjuploadFileName[i];
               String dstPath = getRealyPath(getSavePath())   
                       + "\\" + fjuploadFileName[i];
               File dstFile = new File(dstPath);   
               if(copy(fjFiles[i], dstFile)){//调用copy静态方法
                     successFileList1.add(getFjuploadFileName()[i]);
               }
               path1 = path1+path2+",";
           }
       }
		if(notice == null){
			notice = new notice();
		}
		notice.setUpdateTime(new Date());
		notice.setPubIt(Integer.valueOf(1));
		notice.setDeleted(Integer.valueOf(0));
		notice.setBody(getRequest().getParameter("body"));
		notice.setPublisher(getSession().getAttribute("userName").toString());
		notice.setAttachfileurl(path1+notice.getAttachfileurl());
		articleService.update(notice);
		notice = new notice();
		notice.setRecNum(articleService.getMaxFileCountNum(notice));
		notice.setData(articleService.articles(notice));
		return "list";
	}
	
	//公告删除，公告删除后，数据库中仍然有记录，只不过将此条记录的delated属性更改为1
	public String deleteArticle() throws Exception{
		if(getSession().getAttribute("roles").toString().indexOf("1004,")==-1){
			return "noRight";
		}
		notice = articleService.articleById(notice);//根据notice查询一条记录
		notice.setDeleted(1);
		list = articleService.update(notice);//重新设置了delete属性，所以需要更新数据库
		//删除数据库将其delete属性更为为1，然后更新，接下来重新查询数据库
		notice = new notice();
		notice.setRecNum(articleService.getMaxFileCountNum(notice));//查询所有没有被删除的总条数，即delete属性为0
		notice.setData(articleService.articles(notice));
		return "list";
	}
	
	//修改公告中删除附件
	public String deleteFj() throws Exception{
		String fj = notice.getAttachfileurl();//页面上的附件名字
		notice = articleService.articleById(notice);//数据库中的附件
		notice.setAttachfileurl(str(notice.getAttachfileurl(),fj));
		list = articleService.update(notice);
		if(notice.getAttachfileurl()!=null&&!notice.getAttachfileurl().equals("")){
			fjuploadFileName = notice.getAttachfileurl().split(",");
		}
		return "update";
	}
	
	
	//附件文件上传的复制    
    private static boolean  copy(File src, File dst) {   
        boolean result=false;   
        InputStream in = null;   
        OutputStream out = null;   
        try {   
            in = new BufferedInputStream(new FileInputStream(src), BUFFER_SIZE);   
            out = new BufferedOutputStream(new FileOutputStream(dst),   
                    BUFFER_SIZE);   
            byte[] buffer = new byte[BUFFER_SIZE];   
            int len = 0;   
            while ((len = in.read(buffer)) > 0) {   
                out.write(buffer, 0, len);   
            }   
            result=true;   
        } catch (Exception e) {   
            e.printStackTrace();   
            result=false;   
        } finally {   
            if (null != in) {   
                try {   
                    in.close();   
                } catch (IOException e) {   
                    e.printStackTrace();   
                }   
            }   
            if (null != out) {   
                try {   
                    out.close();   
                } catch (IOException e) {   
                    e.printStackTrace();   
                }   
            }   
        }   
        return result;   
    }  
    
    //页面上的附件与数据库中保存的附件比较
	public String str(String s1,String s2){
		String arr[] = s1.split(",");
		String tmp = "";
		for(int i=0;i<arr.length;i++){
			if(!arr[i].equals(s2)){
				tmp = tmp + arr[i]+",";
			}
		}
		return tmp;
	}
	
	//插入系统日志,用户添加记录的时候会调用
	public String insertSysLog(String memo,String type) throws Exception{
		T_SYS_LOG =new T_SYS_LOG();
		T_SYS_LOG.setId(logService.getMaxLogCountNum(T_SYS_LOG)+1);
		T_SYS_LOG.setOperationDate(new Date());
		T_SYS_LOG.setLoginName(getSession().getAttribute("login").toString());
		T_SYS_LOG.setUserName(getSession().getAttribute("userName").toString());
		T_SYS_LOG.setMemo(memo);
		T_SYS_LOG.setOperationType(type);//设置操作类型为1
		T_SYS_LOG.setIp(ServletActionContext.getRequest().getRemoteAddr());
		T_SYS_LOG.setData(logService.save(T_SYS_LOG));
		return "list";
	}
	
	private String fileName;//下载的文件名,view.jsp中有
	private String savePathDownload = "/upload/";//下在的文件路径
	//下载某一新闻中的附件
	public String articleFileDownload() throws UnsupportedEncodingException{
		savePathDownload = savePathDownload + new String(fileName.getBytes("ISO8859-1" ),"UTF-8");
		System.out.println("save" + savePathDownload);
		return SUCCESS;
	}
	
	//文件附件下载得到流
	public InputStream getInputStream(){
		return ServletActionContext.getServletContext().getResourceAsStream(savePathDownload);
	}
	//得到附件文件下载名
	public String getDownloadFileName(){
		System.out.println("fileName" + fileName);
		return fileName;
	}
	
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getSavePathDownload() {
		return savePathDownload;
	}
	public void setSavePathDownload(String savePathDownload) {
		this.savePathDownload = savePathDownload;
	}
}
