package smartgrid.authentication;

public class image
{
    private String title;
    private String id;
    private String email;

    public image(String t, String id, String email)
    {
        this.title = t;
        this.id = id;
        this.email = email;
    }

    public String getTitle()
    {
        return this.title;
    }

    public String getId()
    {
        return this.id;
    }
    public String getEmail()
    {
        return this.email;
    }
}