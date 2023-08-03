/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pm.dto;

import java.io.Serializable;

/**
 *
 * @author tranh
 */
public class Notify implements Serializable{
    private int userId;
    private String notiDescription;
    private String slotNumber;
    private String parkingType;

    public Notify() {
    }

    public Notify(int userId, String notiDescription, String slotNumber, String parkingType) {
        this.userId = userId;
        this.notiDescription = notiDescription;
        this.slotNumber = slotNumber;
        this.parkingType = parkingType;
    }

    /**
     * @return the userId
     */
    public int getUserId() {
        return userId;
    }

    /**
     * @param userId the userId to set
     */
    public void setUserId(int userId) {
        this.userId = userId;
    }

    /**
     * @return the notiDescription
     */
    public String getNotiDescription() {
        return notiDescription;
    }

    /**
     * @param notiDescription the notiDescription to set
     */
    public void setNotiDescription(String notiDescription) {
        this.notiDescription = notiDescription;
    }

    /**
     * @return the slotNumber
     */
    public String getSlotNumber() {
        return slotNumber;
    }

    /**
     * @param slotNumber the slotNumber to set
     */
    public void setSlotNumber(String slotNumber) {
        this.slotNumber = slotNumber;
    }

    /**
     * @return the parkingType
     */
    public String getParkingType() {
        return parkingType;
    }

    /**
     * @param parkingType the parkingType to set
     */
    public void setParkingType(String parkingType) {
        this.parkingType = parkingType;
    }

    
    
}
