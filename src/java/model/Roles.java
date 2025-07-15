
package model;

import java.io.Serializable;

public class Roles implements Serializable {
    private int roleID;
    private String name;

    public Roles() {
    }

    public Roles(int roleID, String name) {
        this.roleID = roleID;
        this.name = name;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Roles{" + "roleID=" + roleID + ", name=" + name + '}';
    }
    
}
