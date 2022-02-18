package smartgrid.services;

public class SingleService {
    private int id;
    private String name;
    private int user_id;
    private String description;
    private int rating;
    private float price;
    private String service_type;
    private String contact_number;

    public SingleService(int id, String name, int user_id, String description, int rating, float price, String service_type, String contact_number) {
        this.id = id;
        this.name = name;
        this.user_id = user_id;
        this.description = description;
        this.rating = rating;
        this.price = price;
        this.service_type = service_type;
        this.contact_number = contact_number;
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

    public int getUser_id() {
        return this.user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getDescription() {
        return this.description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getRating() {
        return this.rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public float getPrice() {
        return this.price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getService_type() {
        return this.service_type;
    }

    public void setService_type(String service_type) {
        this.service_type = service_type;
    }

    public String getContact_number() {
        return this.contact_number;
    }

    public void setContact_number(String contact_number) {
        this.contact_number = contact_number;
    }
    
    

}
