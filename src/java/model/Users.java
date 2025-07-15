
package model;

import java.io.Serializable;

public class Users implements Serializable{
    private int userID;
    private String fullName;
    private String email;
    private String password;
    private String phone;
    private String address;
    private int roleID;
    private int otp;

    public Users() {
    }

    public Users(int userID, String fullName, String email, String password, String phone, String address, int roleID) {
        this.userID = userID;
        this.fullName = fullName;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.address = address;
        this.roleID = roleID;
    }

    public Users(int userID, String fullName, String email, String phone, String address, int roleID) {
        this.userID = userID;
        this.fullName = fullName;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.roleID = roleID;
    }

    public int getOtp() {
        return otp;
    }

    public void setOtp(int otp) {
        this.otp = otp;
    }
    
    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

    @Override
    public String toString() {
        return "Users{" + "userID=" + userID + ", fullName=" + fullName + ", email=" + email + ", password=" + password + ", phone=" + phone + ", address=" + address + ", roleID=" + roleID + '}';
    }

}
