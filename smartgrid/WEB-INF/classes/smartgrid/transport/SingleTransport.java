package smartgrid.transport;

public class SingleTransport {
    private int id;
    private String name;
    private String description;
    private float fare;
    private String type;
    private String route;
    private String timing;

    public SingleTransport(int id, String name, String description, float fare, String type, String route, String timing) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.fare = fare;
        this.type = type;
        this.route = route;
        this.timing = timing;
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

    public String getDescription() {
        return this.description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getFare() {
        return this.fare;
    }

    public void setFare(float fare) {
        this.fare = fare;
    }

    public String getType() {
        return this.type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getRoute() {
        return this.route;
    }

    public void setRoute(String route) {
        this.route = route;
    }

    public String getTiming() {
        return this.timing;
    }

    public void setTiming(String timing) {
        this.timing = timing;
    }
    
}
