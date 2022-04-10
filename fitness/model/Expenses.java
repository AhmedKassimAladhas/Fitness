package com.aladhas.fitness.model;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Expenses {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	private Date date_entry;
	private String Ex_name;
	private String emp;
	private Double price;
	private String Notes;

	public Expenses() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Expenses(Long id, Date date_entry, String ex_name, String emp, Double price, String notes) {
		super();
		this.id = id;
		this.date_entry = date_entry;
		Ex_name = ex_name;
		this.emp = emp;
		this.price = price;
		Notes = notes;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getDate_entry() {
		return date_entry;
	}

	public void setDate_entry(Date date_entry) {
		this.date_entry = date_entry;
	}

	public String getEx_name() {
		return Ex_name;
	}

	public void setEx_name(String ex_name) {
		Ex_name = ex_name;
	}

	public String getEmp() {
		return emp;
	}

	public void setEmp(String emp) {
		this.emp = emp;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getNotes() {
		return Notes;
	}

	public void setNotes(String notes) {
		Notes = notes;
	}

}
