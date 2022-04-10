package com.aladhas.fitness.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Sections {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	private String Sec_name;
	private String Sec_Details;
	private Double Price;
	private String offer;
	private Double offer_price;
	
	public Sections() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Sections(Long id, String sec_name, String sec_Details, Double price, String offer, Double offer_price) {
		super();
		this.id = id;
		Sec_name = sec_name;
		Sec_Details = sec_Details;
		Price = price;
		this.offer = offer;
		this.offer_price = offer_price;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getSec_name() {
		return Sec_name;
	}

	public void setSec_name(String sec_name) {
		Sec_name = sec_name;
	}

	public String getSec_Details() {
		return Sec_Details;
	}

	public void setSec_Details(String sec_Details) {
		Sec_Details = sec_Details;
	}

	public Double getPrice() {
		return Price;
	}

	public void setPrice(Double price) {
		Price = price;
	}

	public String getOffer() {
		return offer;
	}

	public void setOffer(String offer) {
		this.offer = offer;
	}

	public Double getOffer_price() {
		return offer_price;
	}

	public void setOffer_price(Double offer_price) {
		this.offer_price = offer_price;
	}
	
}
