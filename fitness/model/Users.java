package com.aladhas.fitness.model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
public class Users {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long ID;
	
	private String Username;
	private String Password;
	private String Grants;
	
	@OneToOne(fetch = FetchType.EAGER )
	private Employees e;

	public Users() {
		
	}

	public Users(Long iD, String username, String password, String grants, Employees e) {
		super();
		ID = iD;
		Username = username;
		Password = password;
		Grants = grants;
		this.e = e;
	}

	public Long getID() {
		return ID;
	}

	public void setID(Long iD) {
		ID = iD;
	}

	public String getUsername() {
		return Username;
	}

	public void setUsername(String username) {
		Username = username;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}

	public String getGrants() {
		return Grants;
	}

	public void setGrants(String grants) {
		Grants = grants;
	}

	public Employees getE() {
		return e;
	}

	public void setE(Employees e) {
		this.e = e;
	}

		
	
}
