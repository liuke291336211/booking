package com.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateChange {

    //将时间类型的转成自定义格式的字符串
    public static String dateToString(Date date, String patt){
        SimpleDateFormat sdf = new SimpleDateFormat(patt);
        String format = sdf.format(date);
        return format;
    }
    
}
