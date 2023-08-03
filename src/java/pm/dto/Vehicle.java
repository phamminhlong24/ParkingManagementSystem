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
public class Vehicle {

    private int vehicleID;
    private int vehicleUserID;
    private String vehicleDescription;
    private String vehicleName;
    private String plateNumber;
    private int status;

    public Vehicle() {
    }

    public Vehicle(int vehicleID, int vehicleUserID, String vehicleName, String vehicleDescription, String plateNumber, int status) {
        this.vehicleID = vehicleID;
        this.vehicleUserID = vehicleUserID;
        this.vehicleName = vehicleName;
        this.vehicleDescription = vehicleDescription;
        this.plateNumber = plateNumber;
        this.status = status;
    }

    public int getVehicleID() {
        return vehicleID;
    }

    public void setVehicleID(int vehicleID) {
        this.vehicleID = vehicleID;
    }

    public int getVehicleUserID() {
        return vehicleUserID;
    }

    public void setVehicleUserID(int vehicleUserID) {
        this.vehicleUserID = vehicleUserID;
    }

    public String getVehicleDescription() {
        return vehicleDescription;
    }

    public void setVehicleDescription(String vehicleDescription) {
        this.vehicleDescription = vehicleDescription;
    }

    public String getPlateNumber() {
        return plateNumber;
    }

    public void setPlateNumber(String plateNumber) {
        this.plateNumber = plateNumber;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    /**
     * @return the vehicleName
     */
    public String getVehicleName() {
        return vehicleName;
    }

    /**
     * @param vehicleName the vehicleName to set
     */
    public void setVehicleName(String vehicleName) {
        this.vehicleName = vehicleName;
    }

}
