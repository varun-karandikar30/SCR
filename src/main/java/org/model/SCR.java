package model;

import java.io.Serializable;

public class SCR implements Serializable{
    String sname;
    String cname;
    String apply;
    String status;

    public SCR(String sname, String cname, String apply, String status) {
        this.sname = sname;
        this.cname = cname;
        this.apply = apply;
        this.status = status;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getApply() {
        return apply;
    }

    public void setApply(String apply) {
        this.apply = apply;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    
}
