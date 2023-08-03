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
public class PaymentType {

    private int typeID;
    private String typeName;

    public PaymentType() {
    }

    public PaymentType(int typeID, String typeName) {
        this.typeID = typeID;
        this.typeName = typeName;
    }

    public int getTypeID() {
        return typeID;
    }

    public void setTypeID(int typeID) {
        this.typeID = typeID;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

}
