package model;

public class Campus {
    
    private int id;
    private String campus;

    public Campus(int id, String campus) {
        this.id = id;
        this.campus = campus;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCampus() {
        return campus;
    }

    public void setCampus(String campus) {
        this.campus = campus;
    }

    @Override
    public String toString() {
        return campus;
    }
}
