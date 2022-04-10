package com.aladhas.fitness.model;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
public class Today_trainings {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	private Date date;
	private String subscrip;
	private int number_sub;
	private String name;
	private String phone;
	private int count_trining;
	private int count_done;
	private Double price;

	@OneToOne(fetch = FetchType.EAGER)
	private Customers cust;

	public Today_trainings() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Today_trainings(Date date, String subscrip, String name, String phone, Double price, Customers cust) {
		super();
		this.date = date;
		this.subscrip = subscrip;
		this.name = name;
		this.phone = phone;
		this.price = price;
		this.cust = cust;
	}
	public Today_trainings(Long id, Date date, String subscrip, int number_sub, String name, String phone,
			int count_trining, int count_done, Double price, Customers cust) {
		super();
		this.id = id;
		this.date = date;
		this.subscrip = subscrip;
		this.number_sub = number_sub;
		this.name = name;
		this.phone = phone;
		this.count_trining = count_trining;
		this.count_done = count_done;
		this.price = price;
		this.cust = cust;
	}
	public Today_trainings(Date date, String subscrip, int number_sub, String name, String phone, int count_trining,
			int count_done, Double price, Customers cust) {
		super();
		this.date = date;
		this.subscrip = subscrip;
		this.number_sub = number_sub;
		this.name = name;
		this.phone = phone;
		this.count_trining = count_trining;
		this.count_done = count_done;
		this.price = price;
		this.cust = cust;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getSubscrip() {
		return subscrip;
	}
	public void setSubscrip(String subscrip) {
		this.subscrip = subscrip;
	}
	public int getNumber_sub() {
		return number_sub;
	}
	public void setNumber_sub(int number_sub) {
		this.number_sub = number_sub;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getCount_trining() {
		return count_trining;
	}
	public void setCount_trining(int count_trining) {
		this.count_trining = count_trining;
	}
	public int getCount_done() {
		return count_done;
	}
	public void setCount_done(int count_done) {
		this.count_done = count_done;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Customers getCust() {
		return cust;
	}
	public void setCust(Customers cust) {
		this.cust = cust;
	}


}
