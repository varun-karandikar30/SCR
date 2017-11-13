
package model;


public class StName {
    String name;
    double gpa;
    String branch;
    String email;

    public StName(String name, double gpa, String branch, String email) {
        this.name = name;
        this.gpa = gpa;
        this.branch = branch;
        this.email = email;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getGpa() {
        return gpa;
    }

    public void setGpa(double gpa) {
        this.gpa = gpa;
    }

    public String getBranch() {
        return branch;
    }

    public void setBranch(String branch) {
        this.branch = branch;
    }

    
}
