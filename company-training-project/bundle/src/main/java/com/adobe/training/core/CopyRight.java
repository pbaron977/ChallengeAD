package com.adobe.training.core;
import  com.adobe.cq.sightly.WCMUse;

public class CopyRight extends WCMUse{

    private String currentMsg;
    
    @Override
    public void activate() throws Exception {
        currentMsg = "Layne - cambio 4 y 32 pm";
    }
    
    public String getCurrentMsg(){
        return currentMsg;
    }

}