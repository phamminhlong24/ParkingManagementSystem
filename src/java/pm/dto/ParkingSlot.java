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
public class ParkingSlot {

    private int parkingSlotID;
    private String parkingSlotNumber;
    private int parkingSlotStatus;

    public ParkingSlot() {
    }

    public ParkingSlot(int parkingSlotID) {
        this.parkingSlotID = parkingSlotID;
    }
    
    

    public ParkingSlot(int parkingSlotID, String parkingSlotNumber, int parkingSlotStatus) {
        this.parkingSlotID = parkingSlotID;
        this.parkingSlotNumber = parkingSlotNumber;
        this.parkingSlotStatus = parkingSlotStatus;
    }

    public int getParkingSlotID() {
        return parkingSlotID;
    }

    public void setParkingSlotID(int parkingSlotID) {
        this.parkingSlotID = parkingSlotID;
    }

    public String getParkingSlotNumber() {
        return parkingSlotNumber;
    }

    public void setParkingSlotNumber(String parkingSlotNumber) {
        this.parkingSlotNumber = parkingSlotNumber;
    }

    public int getParkingSlotStatus() {
        return parkingSlotStatus;
    }

    public void setParkingSlotStatus(int parkingSlotStatus) {
        this.parkingSlotStatus = parkingSlotStatus;
    }

    @Override
    public String toString() {
        return "ParkingSlot{" + "parkingSlotID=" + parkingSlotID + ", parkingSlotNumber=" + parkingSlotNumber + ", parkingSlotStatus=" + parkingSlotStatus + '}';
    }

}
