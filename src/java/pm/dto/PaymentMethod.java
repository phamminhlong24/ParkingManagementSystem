/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pm.dto;

/**
 *
 * @author KIM DUONG
 */
public class PaymentMethod {

    private int methodID;
    private String methodName;

    public PaymentMethod() {
    }

    public PaymentMethod(int methodID, String methodName) {
        this.methodID = methodID;
        this.methodName = methodName;
    }

    public int getMethodID() {
        return methodID;
    }

    public void setMethodID(int methodID) {
        this.methodID = methodID;
    }

    public String getMethodName() {
        return methodName;
    }

    public void setMethodName(String methodName) {
        this.methodName = methodName;
    }

}
