package com.aladhas.fitness.model;



import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
public class New_Subscriptions {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@OneToOne(fetch = FetchType.EAGER)
	private Customers Cust;

	@OneToOne(fetch = FetchType.EAGER)
	private Sections Sec;

	private Date date_start;
	private Date date_end;
	private int count;
	private int countDone;
	private Double price;
	private String expiry;

	public New_Subscriptions() {
		super();
		// TODO Auto-generated constructor stub
	}

	public New_Subscriptions(Long id, Customers cust, Sections sec, Date date_start, Date date_end, int count,
			int countDone, Double price, String expiry) {
		super();
		this.id = id;
		Cust = cust;
		Sec = sec;
		this.date_start = date_start;
		this.date_end = date_end;
		this.count = count;
		this.countDone = countDone;
		this.price = price;
		this.expiry = expiry;
	}

	public New_Subscriptions(Customers cust, Sections sec, Date date_start, Date date_end, int count, int countDone,
			Double price, String expiry) {
		super();
		Cust = cust;
		Sec = sec;
		this.date_start = date_start;
		this.date_end = date_end;
		this.count = count;
		this.countDone = countDone;
		this.price = price;
		this.expiry = expiry;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Customers getCust() {
		return Cust;
	}

	public void setCust(Customers cust) {
		Cust = cust;
	}

	public Sections getSec() {
		return Sec;
	}

	public void setSec(Sections sec) {
		Sec = sec;
	}

	public Date getDate_start() {
		return date_start;
	}

	public void setDate_start(Date date_start) {
		this.date_start = date_start;
	}

	public Date getDate_end() {
		return date_end;
	}

	public void setDate_end(Date date_end) {
		this.date_end = date_end;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getExpiry() {
		return expiry;
	}

	public void setExpiry(String expiry) {
		this.expiry = expiry;
	}

	public int getCountDone() {
		return countDone;
	}

	public void setCountDone(int countDone) {
		this.countDone = countDone;
	}

}
