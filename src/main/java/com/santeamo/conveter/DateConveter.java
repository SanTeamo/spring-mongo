package com.santeamo.conveter;

import org.springframework.core.convert.converter.Converter;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateConveter implements Converter<String, Date> {

    public Date convert(String source) {

        try {
            if (source!=null) {
                System.out.println("日期："+source);
                DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                dateFormat.setLenient(false);
                return dateFormat.parse(source);
            }
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }

        return null;
    }

}
