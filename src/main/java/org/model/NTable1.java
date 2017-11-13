package model;

import java.io.Serializable;

public class NTable1 implements Serializable
{
    String name;
    String vac;
    String pack;

    public NTable1(String name, String vac, String pack) {
        this.name = name;
        this.vac = vac;
        this.pack = pack;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getVac() {
        return vac;
    }

    public void setVac(String vac) {
        this.vac = vac;
    }

    public String getPack() {
        return pack;
    }

    public void setPack(String pack) {
        this.pack = pack;
    }
 
}
