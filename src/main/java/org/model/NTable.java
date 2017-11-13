package model;

import java.io.Serializable;
import java.sql.Date;

public class NTable implements Serializable{

    String cname;
    Date doj;
    Date dline;

    public NTable(String cname, Date doj, Date dline) {
        this.cname = cname;
        this.doj = doj;
        this.dline = dline;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public Date getDoj() {
        return doj;
    }

    public void setDoj(Date doj) {
        this.doj = doj;
    }

    public Date getDline() {
        return dline;
    }

    public void setDline(Date dline) {
        this.dline = dline;
    }
    
    
}
