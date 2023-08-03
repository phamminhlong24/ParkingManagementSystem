/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pm.dto;

import java.sql.Date;
import java.sql.Timestamp;

/**
 *
 * @author KIM DUONG
 */
public class Booking {

    private int bookingID;
    private String vehiclePlateNumber;
    private int durationOfBooking;
    private String slotNumber;
    private int status;
    private String username;
    private Timestamp bookDate;
    private int timeStart;
    private int timeEnd;

    public Booking() {
    }

    public Booking(int bookingID, String vehiclePlateNumber, int durationOfBooking, String slotNumber, int status, String username, Timestamp bookDate, int timeStart, int timeEnd) {
        this.bookingID = bookingID;
        this.vehiclePlateNumber = vehiclePlateNumber;
        this.durationOfBooking = durationOfBooking;
        this.slotNumber = slotNumber;
        this.status = status;
        this.username = username;
        this.bookDate = bookDate;
        this.timeStart = timeStart;
        this.timeEnd = timeEnd;
    }

    public Booking(int bookingID, String vehiclePlateNumber, int durationOfBooking, String slotNumber, int status, String username, Timestamp bookDate) {
        this.bookingID = bookingID;
        this.vehiclePlateNumber = vehiclePlateNumber;
        this.durationOfBooking = durationOfBooking;
        this.slotNumber = slotNumber;
        this.status = status;
        this.username = username;
        this.bookDate = bookDate;
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
     * @return the durationOfBooking
     */
    public int getDurationOfBooking() {
        return durationOfBooking;
    }

    /**
     * @param durationOfBooking the durationOfBooking to set
     */
    public void setDurationOfBooking(int durationOfBooking) {
        this.durationOfBooking = durationOfBooking;
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
     * @return the status
     */
    public int getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(int status) {
        this.status = status;
    }

    /**
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * @return the bookDate
     */
    public Timestamp getBookDate() {
        return bookDate;
    }

    /**
     * @param bookDate the bookDate to set
     */
    public void setBookDate(Timestamp bookDate) {
        this.bookDate = bookDate;
    }

    /**
     * @return the timeStart
     */
    public int getTimeStart() {
        return timeStart;
    }

    /**
     * @param timeStart the timeStart to set
     */
    public void setTimeStart(int timeStart) {
        this.timeStart = timeStart;
    }

    /**
     * @return the timeEnd
     */
    public int getTimeEnd() {
        return timeEnd;
    }

    /**
     * @param timeEnd the timeEnd to set
     */
    public void setTimeEnd(int timeEnd) {
        this.timeEnd = timeEnd;
    }

    @Override
    public String toString() {
        return "Booking{" + "bookingID=" + bookingID + ", vehiclePlateNumber=" + vehiclePlateNumber + ", durationOfBooking=" + durationOfBooking + ", slotNumber=" + slotNumber + ", status=" + status + ", username=" + username + ", bookDate=" + bookDate + ", timeStart=" + timeStart + ", timeEnd=" + timeEnd + '}';
    }

}
