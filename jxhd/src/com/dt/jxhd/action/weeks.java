package com.dt.jxhd.action;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import com.dt.jxhd.domain.date;

public class weeks {

	// ����ȫ�ֿ��� ��һ�ܣ����ܣ���һ�ܵ������仯
	private static int weeks = 0;

	// ��õ�ǰ�����뱾��һ��������
	private static int getMondayPlus() {
		Calendar cd = Calendar.getInstance();
		// ��ý�����һ�ܵĵڼ��죬�������ǵ�һ�죬���ڶ��ǵڶ���......
		int dayOfWeek = cd.get(Calendar.DAY_OF_WEEK);
		if (dayOfWeek == 1) {
			return -6;
		} else {
			return 2 - dayOfWeek;
		}
	}

	// �����������һ������
	public String getPreviousMonday() {
		weeks--;
		int mondayPlus = this.getMondayPlus();
		GregorianCalendar currentDate = new GregorianCalendar();
		currentDate.add(GregorianCalendar.DATE, mondayPlus + 7 * weeks);
		Date monday = currentDate.getTime();
		DateFormat df = DateFormat.getDateInstance();
		String preMonday = df.format(monday);
		return preMonday;
	}

	// ��ñ�������һ������
	public String getCurrentMonday() {
		weeks = 0;
		int mondayPlus = this.getMondayPlus();
		GregorianCalendar currentDate = new GregorianCalendar();
		currentDate.add(GregorianCalendar.DATE, mondayPlus);
		Date monday = currentDate.getTime();
		DateFormat df = DateFormat.getDateInstance();
		String preMonday = df.format(monday);
		return preMonday;
	}

	// �����������һ������
	public String getNextMonday() {
		weeks++;
		int mondayPlus = this.getMondayPlus();
		GregorianCalendar currentDate = new GregorianCalendar();
		currentDate.add(GregorianCalendar.DATE, mondayPlus + 7 * weeks);
		Date monday = currentDate.getTime();
		DateFormat df = DateFormat.getDateInstance();
		String preMonday = df.format(monday);
		return preMonday;
	}

	// �����Ӧ�ܵ����յ�����
	public static String getSunday() {
		int mondayPlus = 0;

		Calendar cd = Calendar.getInstance();
		// ��ý�����һ�ܵĵڼ��죬�������ǵ�һ�죬���ڶ��ǵڶ���......
		int dayOfWeek = cd.get(Calendar.DAY_OF_WEEK);
		if (dayOfWeek == 1) {
			mondayPlus = -6;
		} else {
			mondayPlus = 2 - dayOfWeek;
		}

		GregorianCalendar currentDate = new GregorianCalendar();
		currentDate.add(GregorianCalendar.DATE, mondayPlus + 7 * weeks + 6);
		Date monday = currentDate.getTime();
		DateFormat df = DateFormat.getDateInstance();
		String preMonday = df.format(monday);
		return preMonday;
	}

	public  String[] getStringDate(String date) throws ParseException {
		String[] weeks = new String[7];// ���ص����ܵ�����
		String[] a = date.split("-");
		int week = getDayOfWeek(a[0], a[1], a[2]);// ��ȡ�ܼ�
		int minWeek = 0;
		int maxWeek = 7;
		String format = "yyyy-MM-dd";
		if (week == 1) {
			// ��������գ������Ǵ����տ�ʼ��һ�ܣ������е���ģ�
			weeks[6] = date;
			for (int i = 5; i >= 0; i--) {
				weeks[i] = getFormatDateAdd(getStrToDate(date, format), -1,
						format);
				date = weeks[i];
			}
		} else {
			int temp = week - 2;
			weeks[temp] = date;
			for (int i = temp - 1; i >= minWeek; i--) {
				weeks[i] = getFormatDateAdd(getStrToDate(date, format), -1,
						format);
				date = weeks[i];
			}
			date = weeks[temp];
			for (int i = temp + 1; i < maxWeek; i++) {
				weeks[i] = getFormatDateAdd(getStrToDate(date, format), 1,
						format);
				date = weeks[i];
			}
		}
		return weeks;
	}

	public static int getDayOfWeek(String year, String month, String day) {
		Calendar cal = new GregorianCalendar(new Integer(year).intValue(),
				new Integer(month).intValue() - 1, new Integer(day).intValue());
		return cal.get(Calendar.DAY_OF_WEEK);
	}

	public static Date getStrToDate(String date, String format)
			throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		return sdf.parse(date);
	}

	public static String getFormatDateTime(Date date, String format) {
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		return sdf.format(date);
	}

	public static String getFormatDateAdd(Date date, int amount, String format) {
		Calendar cal = new GregorianCalendar();
		cal.setTime(date);
		cal.add(GregorianCalendar.DATE, amount);
		return getFormatDateTime(cal.getTime(), format);
	}

	//��ñ��ܵĵ�һ������һ��   year�Ǳ��꣬month�Ǳ���-1��day��1��weeks�Ǳ���-1
	public  List<date> getWeeksDate(int year, int month, int day,	int weeks) {
		int mondayPlus = 0;
		Calendar cd = Calendar.getInstance();
		System.out.println("nihao");
		System.out.println(cd.DAY_OF_WEEK);
		System.out.println("nihao");
		
		// ��ý�����һ�ܵĵڼ��죬�������ǵ�һ�죬���ڶ��ǵڶ���......
		cd.set(year, month, day);// 3��26
		int dayOfWeek = cd.get(Calendar.DAY_OF_WEEK);
		System.out.println("aus");
		System.out.println(dayOfWeek);
		System.out.println(Calendar.DAY_OF_WEEK);
		System.out.println("aus");
		if (dayOfWeek == 1) {
			mondayPlus = -6;
		} else {
			mondayPlus = 2 - dayOfWeek;
		}
		System.out.println("111" + mondayPlus);

		GregorianCalendar currentDate = new GregorianCalendar();
		currentDate.set(year, month, day);// 3��26
		currentDate.add(GregorianCalendar.DATE, mondayPlus + 7 * weeks);
		Date monday = currentDate.getTime();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String preMonday = sdf.format(monday);
		System.out.println(preMonday);

		weeks w = new weeks();
		String s[] = null;

		List<date> list = new ArrayList<date>();
		try {
			s = w.getStringDate(preMonday);//����weeks��getStringDate()����
			for (int i = 0; i < 7; i++) {
				date d = new date();// ����date(domain)
				System.out.println("=====" + s[i]);
				if (i == 0) {
					d.setWeek("����һ");
				} else if (i == 1) {
					d.setWeek("���ڶ�");
				}
				if (i == 2) {
					d.setWeek("������");
				}
				if (i == 3) {
					d.setWeek("������");
				}
				if (i == 4) {
					d.setWeek("������");
				}
				if (i == 5) {
					d.setWeek("������");
				}
				if (i == 6) {
					d.setWeek("������");
				}
				d.setDate(s[i]);
				list.add(d);
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public static void main(String[] args) {
		weeks w = new weeks();
		w.getWeeksDate(2014, 7, 4, 1);

		// Calendar cal1 = new GregorianCalendar(new Integer("2014").intValue(),
		// new Integer("6").intValue() - 1, new Integer("30").intValue());
		// cal1.setFirstDayOfWeek(Calendar.MONDAY);
		// String week = String.valueOf(cal1.get(Calendar.WEEK_OF_MONTH)-1);
		// System.out.println(week);
		//
		// String dateString = "2014-06-30";
		// Date date;
		// try {
		// SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		// date = sdf.parse(dateString);
		// Calendar calendar = Calendar.getInstance();
		// calendar.setTime(date);
		// calendar.setFirstDayOfWeek(Calendar.MONDAY);
		// int weekOfMonth = calendar.get(Calendar.WEEK_OF_MONTH)-1;
		// System.out.println(weekOfMonth);
		// } catch (ParseException e) {
		// // TODO Auto-generated catch block
		// e.printStackTrace();
		// }

	}

	public String getWeek(int i) {
		if (i == 0) {
			return "����һ";
		} else if (i == 1) {
			return "���ڶ�";
		} else if (i == 2) {
			return "������";
		} else if (i == 3) {
			return "������";
		} else if (i == 4) {
			return "������";
		} else if (i == 5) {
			return "������";
		} else {
			return "������";
		}
	}
}
