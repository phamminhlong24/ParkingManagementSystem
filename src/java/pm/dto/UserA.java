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
public class UserA {

    private int uID;
    private String userName;
    private String password;
    private String fullname;
    private String email;
    private String address;
    private String phone;
    private int gender;
    private int status;
    private int role;
    private String codeEmail;
    public UserA() {
    }

    public UserA(int uID, String userName, String password, String fullname, String email, String address, String phone, int gender, int status, int role) {
        this.uID = uID;
        this.userName = userName;
        this.password = password;
        this.fullname = fullname;
        this.email = email;
        this.address = address;
        this.phone = phone;
        this.gender = gender;
        this.status = status;
        this.role = role;
    }

    public UserA(String userName, String email, String codeEmail) {
        this.userName = userName;
        this.email = email;
        this.codeEmail = codeEmail;
    }

    

    public int getuID() {
        return uID;
    }

    public void setuID(int uID) {
        this.uID = uID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    /**
     * @return the codeEmail
     */
    public String getCodeEmail() {
        return codeEmail;
    }

    /**
     * @param codeEmail the codeEmail to set
     */
    public void setCodeEmail(String codeEmail) {
        this.codeEmail = codeEmail;
    }

}
