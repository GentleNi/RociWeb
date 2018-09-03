package com.shishuo.cms.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by GentleNi
 * Date 2018-04-21 20:04
 **/

public class ChangeLanguageUtils {

    public static void initLanguage(HttpServletRequest request,HttpSession session){
        //根据http header 确定语言
        if(session.getAttribute("language") == null){
            if(request.getHeader("Accept-Language").contains("zh-CN")){
                session.setAttribute("language","zh-CN");
            }else{
                session.setAttribute("language","en");
            }
        }
    }
    public static void handleLanguage(HttpSession session, HttpServletRequest request){
        if(session.getAttribute("language") == null){
            if(request.getHeader("Accept-Language").contains("zh-CN")){
                session.setAttribute("language","zh-CN");
            }else{
                session.setAttribute("language","en");
            }
        }else{
            if(session.getAttribute("language").equals("zh-CN")){
                session.setAttribute("language","en");
            }else{
                session.setAttribute("language","zh-CN");
            }
        }
    }
}
