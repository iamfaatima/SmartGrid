package smartgrid.authentication;

public class User
{
	private String id;
	private String name;
	private String email;
	private String password;
	private String gender;
	private String phone;
	private String address;
	
	public User(String id, String name, String email, String password, String gender, String phone, String address)
	{
		this.id = id;
		this.name = name; 
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.phone = phone;
		this.address = address;
	}
	
	//Getters
	
	public String getId()
	{
		return this.id;
	}
	public String getName()
	{
		return this.name;
	}
	public String getEmail()
	{
		return this.email;
	}
	public String getPassword()
	{
		return this.password;
	}
	public String getGender()
	{
		return this.gender;
	}
	public String getPhone()
	{
		return this.phone;
	}
	public String getAddress()
	{
		return this.address;
	}
	
	//Setters
	
	public void setId(String id)
	{
		this.id = id;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public void setEmail(String email)
	{
		this.email = email;
	}
	public void setPassword(String password)
	{
		this.password = password;
	}
	public void setGender(String gender)
	{
		this.gender = gender;
	}
	public void setPhone(String phone)
	{
		this.phone = phone;
	}
	public void setAddress(String address)
	{
		this.address = address;
	}
	
}