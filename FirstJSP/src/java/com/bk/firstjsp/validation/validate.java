/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bk.firstjsp.validation;

/**
 *
 * @author bkawan
 * @date Apr 10, 2016
 * @time 12:27:33 PM
 */
public class validate {

    
   public static void isEmpty(String param){
       if(param == null){
           
           System.out.println("Is required Field");
       }
   }
}
