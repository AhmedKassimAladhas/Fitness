package com.aladhas.fitness.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Products {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long ID;
	
	private String date_entry;
	private String Name_Prod;
	private Double Price;
	private int Count;
	private String Notes;
	
	public Products() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Products(Long iD, String date_entry, String name_Prod, Double price, int count, String notes) {
		super();
		ID = iD;
		this.date_entry = date_entry;
		Name_Prod = name_Prod;
		Price = price;
		Count = count;
		Notes = notes;
	}

	public Long getID() {
		return ID;
	}

	public void setID(Long iD) {
		ID = iD;
	}

	public String getDate_entry() {
		return date_entry;
	}

	public void setDate_entry(String date_entry) {
		this.date_entry = date_entry;
	}

	public String getName_Prod() {
		return Name_Prod;
	}

	public void setName_Prod(String name_Prod) {
		Name_Prod = name_Prod;
	}

	public Double getPrice() {
		return Price;
	}

	public void setPrice(Double price) {
		Price = price;
	}

	public int getCount() {
		return Count;
	}

	public void setCount(int count) {
		Count = count;
	}

	public String getNotes() {
		return Notes;
	}

	public void setNotes(String notes) {
		Notes = notes;
	}
	
	
}
