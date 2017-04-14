package test;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.net.Socket;
 
 
/**
 * Telnet简单实现
 * 
 * @author xueliang 2010.11.6
 * 
 */
public class Telnet {
	private InputStream is;
	private OutputStream os;
	private Socket client;
	private byte[] readBuffer = new byte[1024];
 
	/**
	 * 打开telnet连接
	 * @param ip
	 * @param port 23
	 * @return
	 * @throws CmdException 
	 */
	public Telnet(String ip){
		this(ip, 23);
	}
 
	/**
	 * 打开telnet连接
	 * @param ip
	 * @param port
	 * @return
	 * @throws CmdException 
	 */
	public Telnet(String ip, int port){
		try {
			client = new Socket();
			client.setSoTimeout(1000);//设置is的read方法阻塞时间为5秒
			client.connect(new InetSocketAddress(ip,port));
			is = client.getInputStream();
			os = client.getOutputStream();
		} catch (Exception e) {
			this.close();
		} 
	}
	/**
	 * 命令中不要包括回车、换行
	 * @param cmd
	 */
	public void sendCmd(String cmd) {
//		cmd += "\r\0";
		if (os != null) {
			try {
				os.write(cmd.getBytes());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
 
 
	/**
	 * 关闭telnet连接
	 */
	public void close() {
		if (is != null) {
			try {
				is.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		if (os != null) {
			try {
				os.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		if (client != null) {
			try {
				client.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	public static void main(String[] args) {
		 try {
			String ips[] = new String[4];
			 ips[0] = "10.21.24.243";
			 ips[1] = "10.21.24.24";
			 ips[2] = "10.21.24.3";
			 ips[3] = "10.21.24.4";
			 for(int i=0;i<4;i++){
				 MyThread mt = new MyThread(ips[i],9990,"cmd_point,1235");
				 mt.start();
			 }
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
