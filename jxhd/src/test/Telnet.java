package test;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.net.Socket;
 
 
/**
 * Telnet��ʵ��
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
	 * ��telnet����
	 * @param ip
	 * @param port 23
	 * @return
	 * @throws CmdException 
	 */
	public Telnet(String ip){
		this(ip, 23);
	}
 
	/**
	 * ��telnet����
	 * @param ip
	 * @param port
	 * @return
	 * @throws CmdException 
	 */
	public Telnet(String ip, int port){
		try {
			client = new Socket();
			client.setSoTimeout(1000);//����is��read��������ʱ��Ϊ5��
			client.connect(new InetSocketAddress(ip,port));
			is = client.getInputStream();
			os = client.getOutputStream();
		} catch (Exception e) {
			this.close();
		} 
	}
	/**
	 * �����в�Ҫ�����س�������
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
	 * �ر�telnet����
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
