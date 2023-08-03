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
public class RegistrationError {

    private String usernameLengthErr;
    private String usernameIsExisted;
    private String passwordLengthErr;
    private String phoneLengthErr;
    private String phoneContainLetter;
    private String fullnameLengthErr;
    private String emailLengthErr;
    private String addressLengthErr;
    
    private String vehicleNameLengthErr;
    private String vehiclePlateLengthErr;
    private String vehiclePlateIsExisted;
    private String vehicleDesLengthErr;
    
    public RegistrationError(){
        
    }

    public String getUsernameLengthErr() {
        return usernameLengthErr;
    }

    public void setUsernameLengthErr(String usernameLengthErr) {
        this.usernameLengthErr = usernameLengthErr;
    }

    public String getUsernameIsExisted() {
        return usernameIsExisted;
    }

    public void setUsernameIsExisted(String usernameIsExisted) {
        this.usernameIsExisted = usernameIsExisted;
    }

    public String getPasswordLengthErr() {
        return passwordLengthErr;
    }

    public void setPasswordLengthErr(String passwordLengthErr) {
        this.passwordLengthErr = passwordLengthErr;
    }

    public String getEmailLengthErr() {
        return emailLengthErr;
    }

    public void setEmailLengthErr(String emailLengthErr) {
        this.emailLengthErr = emailLengthErr;
    }

    public String getFullnameLengthErr() {
        return fullnameLengthErr;
    }

    public void setFullnameLengthErr(String fullnameLengthErr) {
        this.fullnameLengthErr = fullnameLengthErr;
    }

    public String getAddressLengthErr() {
        return addressLengthErr;
    }

    public void setAddressLengthErr(String addressLengthErr) {
        this.addressLengthErr = addressLengthErr;
    }

    public String getPhoneLengthErr() {
        return phoneLengthErr;
    }

    public void setPhoneLengthErr(String phoneLengthErr) {
        this.phoneLengthErr = phoneLengthErr;
    }

    public String getPhoneContainLetter() {
        return phoneContainLetter;
    }

    public String getVehicleNameLengthErr() {
        return vehicleNameLengthErr;
    }

    public void setVehicleNameLengthErr(String vehicleNameLengthErr) {
        this.vehicleNameLengthErr = vehicleNameLengthErr;
    }

    public String getVehiclePlateLengthErr() {
        return vehiclePlateLengthErr;
    }

    public void setVehiclePlateLengthErr(String vehiclePlateLengthErr) {
        this.vehiclePlateLengthErr = vehiclePlateLengthErr;
    }

    public String getVehiclePlateIsExisted() {
        return vehiclePlateIsExisted;
    }

    public void setVehiclePlateIsExisted(String vehiclePlateIsExisted) {
        this.vehiclePlateIsExisted = vehiclePlateIsExisted;
    }

    public String getVehicleDesLengthErr() {
        return vehicleDesLengthErr;
    }

    public void setVehicleDesLengthErr(String vehicleDesLengthErr) {
        this.vehicleDesLengthErr = vehicleDesLengthErr;
    }

    
    
    public void setPhoneContainLetter(String phoneContainLetter) {
        this.phoneContainLetter = phoneContainLetter;
    }
    
}
