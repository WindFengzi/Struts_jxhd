package test;

public class MyThread extends Thread{
	private String ip;
	private int port;
	private String cmd;
	public MyThread(String ip,int port,String cmd){//cmd="cmd_point,"+验证码
		this.ip=ip;
		this.port=port;
		this.cmd=cmd;
	}	
	public void run(){
			System.out.println("开始。。。。"); 
			Telnet telnet = new Telnet(ip,port);
			telnet.sendCmd(cmd);
			telnet.close();
			System.out.println("结束。。");
	}
}