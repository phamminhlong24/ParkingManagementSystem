/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pm.dto;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author tranh
 */
public class Request implements Serializable{
    private int requestId;
    private int bookingID;
    private String vehiclePlateNumber;
    private String parkingSlotNumber;
    private int requestStatus;
    private int userId;
    private String dateRequest;

    public Request() {
    }
    

    public Request(int requestId, int bookingID, String vehiclePlateNumber, String parkingSlotNumber, int requestStatus, int userId, String dateRequest) {
        this.requestId = requestId;
        this.bookingID = bookingID;
        this.vehiclePlateNumber = vehiclePlateNumber;
        this.parkingSlotNumber = parkingSlotNumber;
        this.requestStatus = requestStatus;
        this.userId = userId;
        this.dateRequest = dateRequest;
    }

    public Request(int requestId, int bookingID, int requestStatus, int userId, String dateRequest) {
        this.requestId = requestId;
        this.bookingID = bookingID;
        this.requestStatus = requestStatus;
        this.userId = userId;
        this.dateRequest = dateRequest;
    }
    
    

    /**
     * @return the requestId
     */
    public int getRequestId() {
        return requestId;
    }

    /**
     * @param requestId the requestId to set
     */
    public void setRequestId(int requestId) {
        this.requestId = requestId;
    }

    /**
     * @return the bookingID
     */
    public int getBookingID() {
        return bookingID;
    }

    /**
     * @param bookingID the bookingID to set
     */
    public void setBookingID(int bookingID) {
        this.bookingID = bookingID;
    }

    /**
     * @return the vehiclePlateNumber
     */
    public String getVehiclePlateNumber() {
        return vehiclePlateNumber;
    }

    /**
     * @param vehiclePlateNumber the vehiclePlateNumber to set
     */
    public void setVehiclePlateNumber(String vehiclePlateNumber) {
        this.vehiclePlateNumber = vehiclePlateNumber;
    }

    /**
     * @return the parkingSlotNumber
     */
    public String getParkingSlotNumber() {
        return parkingSlotNumber;
    }

    /**
     * @param parkingSlotNumber the parkingSlotNumber to set
     */
    public void setParkingSlotNumber(String parkingSlotNumber) {
        this.parkingSlotNumber = parkingSlotNumber;
    }

    /**
     * @return the requestStatus
     */
    public int getRequestStatus() {
        return requestStatus;
    }

    /**
     * @param requestStatus the requestStatus to set
     */
    public void setRequestStatus(int requestStatus) {
        this.requestStatus = requestStatus;
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
     * @return the dateRequest
     */
    public String getDateRequest() {
        return dateRequest;
    }

    /**
     * @param dateRequest the dateRequest to set
     */
    public void setDateRequest(String dateRequest) {
        this.dateRequest = dateRequest;
    }

   
    
}
