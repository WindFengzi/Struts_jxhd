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
	//�����Զ�װ������,�Զ�ע��articleService��bean
	public IArticleService articleService;
	public void setArticleService(IArticleService articleService) {
		this.articleService = articleService;
	}
	
	public notice notice;//����
	public notice getNotice() {
		return notice;
	}
	public void setNotice(notice notice) {
		this.notice = notice;
	}
	public List<notice> list;//�����������з��ص�����
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
	
	private File[] fjupload;//�ϴ����ļ���name����
	private String[] fjuploadFileName;//�ϴ��ļ����ļ������飬����Ǹ��������fjupload����
	private String savePath;//�ļ��ϴ���Ĭ��·������strutsConfig.xml��������
	
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
	/*private File upload;       //�ļ�   
	private String uploadContentType;   //�ļ�����
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
	
	private T_SYS_LOG T_SYS_LOG;//ϵͳ��־
	public T_SYS_LOG getT_SYS_LOG() {
		return T_SYS_LOG;
	}
	public void setT_SYS_LOG(T_SYS_LOG t_sys_log) {
		T_SYS_LOG = t_sys_log;
	}
	//�Զ�װ��logService��bean
	private ILogService logService;

	public void setLogService(ILogService logService) {
		this.logService = logService;
	}
	
	//������ӵ�ʵ�ʲ���
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
                if(copy(fjFiles[i], dstFile)){//����copy��̬�������ļ����Ʋ���
                      successFileList1.add(getFjuploadFileName()[i]);
                }
                if(notice.getClassId()!=null){//����û������
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
		if(notice == null){//���-����-�༭-���ؿ��ܻ���ִ���
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
		//��ӵ���־��dbo.T_SYS_LOGֻ��������־�����ñ����е�insertSysLog����
		this.insertSysLog("��ӣ�"+notice.getTitle()+" ������Ϣ��","1");
		//��Ӻ�����
		notice = new notice();
		notice.setRecNum(articleService.getMaxFileCountNum(notice));
		notice.setData(articleService.articles(notice));
		return "list";
	}
	
	//������ӣ�ֱ��ת�����ҳ��
	public String toInsert() throws Exception{
		if(getSession().getAttribute("roles").toString().indexOf("1002,")==-1){
			return "noRight";
		}
		return "insert";
	}
	
	//�����ѯ
	public String articles() throws Exception{
		if(getSession().getAttribute("roles").toString().indexOf("1001,")==-1){
			return "noRight";
		}
		if(notice==null){
			notice = new notice();//��Ϊ��Ҫ�õ����ݣ���notice����������
		}
		if(getRequest().getParameter("msg")!=null){//msg��������null,����ִ���������
			notice.setClassId(Integer.valueOf(getRequest().getParameter("msg")));
			getRequest().setAttribute("msg", getRequest().getParameter("msg"));
		}
		notice.setRecNum(articleService.getMaxFileCountNum(notice));//�õ���������
		notice.setData(articleService.articles(notice));//�õ����µļ���
		return "list";
	}
	
	
	//�޸�ĳһ������
	public String articleById() throws Exception{
		if(getSession().getAttribute("roles").toString().indexOf("1003,")==-1){
			return "noRight";
		}
		notice = articleService.articleById(notice);
		//����ж����������������������ַֿ���������fjuploadFileName������
		if(notice.getAttachfileurl()!=null&&!notice.getAttachfileurl().equals("")){
			fjuploadFileName = notice.getAttachfileurl().split(",");
		}
		return "update";
	}
	//����id��ѯһ������
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
	
	//�޸Ĳ�����Ȼ����ʾһ������
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
               if(copy(fjFiles[i], dstFile)){//����copy��̬����
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
	
	//����ɾ��������ɾ�������ݿ�����Ȼ�м�¼��ֻ������������¼��delated���Ը���Ϊ1
	public String deleteArticle() throws Exception{
		if(getSession().getAttribute("roles").toString().indexOf("1004,")==-1){
			return "noRight";
		}
		notice = articleService.articleById(notice);//����notice��ѯһ����¼
		notice.setDeleted(1);
		list = articleService.update(notice);//����������delete���ԣ�������Ҫ�������ݿ�
		//ɾ�����ݿ⽫��delete���Ը�ΪΪ1��Ȼ����£����������²�ѯ���ݿ�
		notice = new notice();
		notice.setRecNum(articleService.getMaxFileCountNum(notice));//��ѯ����û�б�ɾ��������������delete����Ϊ0
		notice.setData(articleService.articles(notice));
		return "list";
	}
	
	//�޸Ĺ�����ɾ������
	public String deleteFj() throws Exception{
		String fj = notice.getAttachfileurl();//ҳ���ϵĸ�������
		notice = articleService.articleById(notice);//���ݿ��еĸ���
		notice.setAttachfileurl(str(notice.getAttachfileurl(),fj));
		list = articleService.update(notice);
		if(notice.getAttachfileurl()!=null&&!notice.getAttachfileurl().equals("")){
			fjuploadFileName = notice.getAttachfileurl().split(",");
		}
		return "update";
	}
	
	
	//�����ļ��ϴ��ĸ���    
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
    
    //ҳ���ϵĸ��������ݿ��б���ĸ����Ƚ�
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
	
	//����ϵͳ��־,�û���Ӽ�¼��ʱ������
	public String insertSysLog(String memo,String type) throws Exception{
		T_SYS_LOG =new T_SYS_LOG();
		T_SYS_LOG.setId(logService.getMaxLogCountNum(T_SYS_LOG)+1);
		T_SYS_LOG.setOperationDate(new Date());
		T_SYS_LOG.setLoginName(getSession().getAttribute("login").toString());
		T_SYS_LOG.setUserName(getSession().getAttribute("userName").toString());
		T_SYS_LOG.setMemo(memo);
		T_SYS_LOG.setOperationType(type);//���ò�������Ϊ1
		T_SYS_LOG.setIp(ServletActionContext.getRequest().getRemoteAddr());
		T_SYS_LOG.setData(logService.save(T_SYS_LOG));
		return "list";
	}
	
	private String fileName;//���ص��ļ���,view.jsp����
	private String savePathDownload = "/upload/";//���ڵ��ļ�·��
	//����ĳһ�����еĸ���
	public String articleFileDownload() throws UnsupportedEncodingException{
		savePathDownload = savePathDownload + new String(fileName.getBytes("ISO8859-1" ),"UTF-8");
		System.out.println("save" + savePathDownload);
		return SUCCESS;
	}
	
	//�ļ��������صõ���
	public InputStream getInputStream(){
		return ServletActionContext.getServletContext().getResourceAsStream(savePathDownload);
	}
	//�õ������ļ�������
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
