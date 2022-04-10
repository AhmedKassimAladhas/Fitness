package com.aladhas.fitness.model;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
public class Sell {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private Date date_sell;
	private String emp;

	@OneToOne(fetch = FetchType.EAGER)
	private Products Prod;

	private Double price;
	private int count;
	private Double Discount;
	private Double Total;
	private String Notes;

	public Sell() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Sell(Long id, Date date_sell, String emp, Products prod, Double price, int count, Double discount,
			Double total, String notes) {
		super();
		this.id = id;
		this.date_sell = date_sell;
		this.emp = emp;
		Prod = prod;
		this.price = price;
		this.count = count;
		Discount = discount;
		Total = total;
		Notes = notes;
	}

	public Sell(Date date_sell, String emp, Products prod, Double price, int count, Double discount, Double total,
			String notes) {
		super();
		this.date_sell = date_sell;
		this.emp = emp;
		Prod = prod;
		this.price = price;
		this.count = count;
		Discount = discount;
		Total = total;
		Notes = notes;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getDate_sell() {
		return date_sell;
	}

	public void setDate_sell(Date date_sell) {
		this.date_sell = date_sell;
	}

	public String getEmp() {
		return emp;
	}

	public void setEmp(String emp) {
		this.emp = emp;
	}

	public Products getProd() {
		return Prod;
	}

	public void setProd(Products prod) {
		Prod = prod;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public Double getDiscount() {
		return Discount;
	}

	public void setDiscount(Double discount) {
		Discount = discount;
	}

	public Double getTotal() {
		return Total;
	}

	public void setTotal(Double total) {
		Total = total;
	}

	public String getNotes() {
		return Notes;
	}

	public void setNotes(String notes) {
		Notes = notes;
	}

	
}
