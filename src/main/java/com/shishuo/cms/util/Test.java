package com.shishuo.cms.util;

/**
 * Created by GentleNi
 * Date 2018-05-20 11:09
 **/

public class Test {
    public static void main(String[] args) {
        int i=1,k=1,s=0;
        while(i<=5){
            s=s+k/(i*(i+1));
            i+=1;
            k=-k;
        }
    }
}
