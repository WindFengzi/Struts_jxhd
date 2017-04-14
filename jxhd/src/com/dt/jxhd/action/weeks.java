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

	// 用来全局控制 上一周，本周，下一周的周数变化
	private static int weeks = 0;

	// 获得当前日期与本周一相差的天数
	private static int getMondayPlus() {
		Calendar cd = Calendar.getInstance();
		// 获得今天是一周的第几天，星期日是第一天，星期二是第二天......
		int dayOfWeek = cd.get(Calendar.DAY_OF_WEEK);
		if (dayOfWeek == 1) {
			return -6;
		} else {
			return 2 - dayOfWeek;
		}
	}

	// 获得上周星期一的日期
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

	// 获得本周星期一的日期
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

	// 获得下周星期一的日期
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

	// 获得相应周的周日的日期
	public static String getSunday() {
		int mondayPlus = 0;

		Calendar cd = Calendar.getInstance();
		// 获得今天是一周的第几天，星期日是第一天，星期二是第二天......
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
		String[] weeks = new String[7];// 返回的这周的日期
		String[] a = date.split("-");
		int week = getDayOfWeek(a[0], a[1], a[2]);// 获取周几
		int minWeek = 0;
		int maxWeek = 7;
		String format = "yyyy-MM-dd";
		if (week == 1) {
			// 如果是周日（老外是从周日开始算一周，所以有点恶心）
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

	//获得本周的第一天和最后一天   year是本年，month是本月-1，day是1，weeks是本周-1
	public  List<date> getWeeksDate(int year, int month, int day,	int weeks) {
		int mondayPlus = 0;
		Calendar cd = Calendar.getInstance();
		System.out.println("nihao");
		System.out.println(cd.DAY_OF_WEEK);
		System.out.println("nihao");
		
		// 获得今天是一周的第几天，星期日是第一天，星期二是第二天......
		cd.set(year, month, day);// 3月26
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
		currentDate.set(year, month, day);// 3月26
		currentDate.add(GregorianCalendar.DATE, mondayPlus + 7 * weeks);
		Date monday = currentDate.getTime();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String preMonday = sdf.format(monday);
		System.out.println(preMonday);

		weeks w = new weeks();
		String s[] = null;

		List<date> list = new ArrayList<date>();
		try {
			s = w.getStringDate(preMonday);//调用weeks的getStringDate()方法
			for (int i = 0; i < 7; i++) {
				date d = new date();// 创建date(domain)
				System.out.println("=====" + s[i]);
				if (i == 0) {
					d.setWeek("星期一");
				} else if (i == 1) {
					d.setWeek("星期二");
				}
				if (i == 2) {
					d.setWeek("星期三");
				}
				if (i == 3) {
					d.setWeek("星期四");
				}
				if (i == 4) {
					d.setWeek("星期五");
				}
				if (i == 5) {
					d.setWeek("星期六");
				}
				if (i == 6) {
					d.setWeek("星期日");
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
			return "星期一";
		} else if (i == 1) {
			return "星期二";
		} else if (i == 2) {
			return "星期三";
		} else if (i == 3) {
			return "星期四";
		} else if (i == 4) {
			return "星期五";
		} else if (i == 5) {
			return "星期六";
		} else {
			return "星期日";
		}
	}
}
