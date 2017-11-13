package model;

import java.io.Serializable;

public class Graph1 implements Serializable{
    int year;
    int nos;

    public Graph1(int year, int nos) {
        this.year = year;
        this.nos = nos;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public int getNos() {
        return nos;
    }

    public void setNos(int nos) {
        this.nos = nos;
    }
    
}
