package com.aladhas.fitness.model;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Customers {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long Cid;
	private String Name;
	private String Phone;
	private String Phone2;
	private String Address;
	private String Gender;
	private int Subscrip_Number;
	private Date sub_end;
	private String last_sub;
	private Long numberLast_sub;
	private Date trainingDay;
	private String trainingCount;
	
	public Customers() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Customers(Long cid, String name, String phone, String phone2, String address, String gender,
			int subscrip_Number, String last_sub) {
		super();
		Cid = cid;
		Name = name;
		Phone = phone;
		Phone2 = phone2;
		Address = address;
		Gender = gender;
		Subscrip_Number = subscrip_Number;
		this.last_sub = last_sub;
	}


	public Long getCid() {
		return Cid;
	}

	public void setCid(Long cid) {
		Cid = cid;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public String getPhone() {
		return Phone;
	}

	public void setPhone(String phone) {
		Phone = phone;
	}

	public String getPhone2() {
		return Phone2;
	}

	public void setPhone2(String phone2) {
		Phone2 = phone2;
	}

	public String getAddress() {
		return Address;
	}

	public void setAddress(String address) {
		Address = address;
	}

	public String getGender() {
		return Gender;
	}

	public void setGender(String gender) {
		Gender = gender;
	}

	
	public int getSubscrip_Number() {
		return Subscrip_Number;
	}

	public void setSubscrip_Number(int subscrip_Number) {
		Subscrip_Number = subscrip_Number;
	}
	
	public Date getSub_end() {
		return sub_end;
	}

	public void setSub_end(Date sub_end) {
		this.sub_end = sub_end;
	}
	
	public String getLast_sub() {
		return last_sub;
	}

	public void setLast_sub(String last_sub) {
		this.last_sub = last_sub;
	}

	public Long getNumberLast_sub() {
		return numberLast_sub;
	}

	public void setNumberLast_sub(Long numberLast_sub) {
		this.numberLast_sub = numberLast_sub;
	}

	public Date getTrainingDay() {
		return trainingDay;
	}

	public void setTrainingDay(Date trainingDay) {
		this.trainingDay = trainingDay;
	}

	public String getTrainingCount() {
		return trainingCount;
	}

	public void setTrainingCount(String trainingCount) {
		this.trainingCount = trainingCount;
	}
	
}
