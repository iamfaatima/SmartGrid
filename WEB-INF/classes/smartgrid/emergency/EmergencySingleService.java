package smartgrid.emergency;

public class EmergencySingleService {
    private int id;
    private String name;
    private String contact_number;
    private String description;
    private int response_time;
    private String type;

    public EmergencySingleService(int id, String name, String contact_number, String description, int response_time, String type) {
        this.id = id;
        this.name = name;
        this.contact_number = contact_number;
        this.description = description;
        this.response_time = response_time;
        this.type = type;
    }

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getContact_number() {
        return this.contact_number;
    }

    public void setContact_number(String contact_number) {
        this.contact_number = contact_number;
    }

    public String getDescription() {
        return this.description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getResponse_time() {
        return this.response_time;
    }

    public void setResponse_time(int response_time) {
        this.response_time = response_time;
    }

    public String getType() {
        return this.type;
    }

    public void setType(String type) {
        this.type = type;
    }
    


}
