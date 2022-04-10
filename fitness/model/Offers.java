package com.aladhas.fitness.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "offers")
public class Offers {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String Offer_name;
	private String Offer_Details;
	private Double Offer_Price;
	private Date Date_Start;
	private Date Date_End;

	@ManyToOne(fetch = FetchType.EAGER)
	private Sections Sec;
	
	@Column(name ="Notes")
	private String Notes;

	public Offers() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Offers(Long id, String offer_name, String offer_Details, Double offer_Price, Date date_Start, Date date_End,
			Sections sec, String notes) {
		super();
		this.id = id;
		Offer_name = offer_name;
		Offer_Details = offer_Details;
		Offer_Price = offer_Price;
		Date_Start = date_Start;
		Date_End = date_End;
		Sec = sec;
		Notes = notes;
	}

	public Offers(String offer_name, String offer_Details, Double offer_Price, Date date_Start, Date date_End,
			Sections sec, String notes) {
		super();
		Offer_name = offer_name;
		Offer_Details = offer_Details;
		Offer_Price = offer_Price;
		Date_Start = date_Start;
		Date_End = date_End;
		Sec = sec;
		Notes = notes;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getOffer_name() {
		return Offer_name;
	}

	public void setOffer_name(String offer_name) {
		Offer_name = offer_name;
	}

	public String getOffer_Details() {
		return Offer_Details;
	}

	public void setOffer_Details(String offer_Details) {
		Offer_Details = offer_Details;
	}

	public Double getOffer_Price() {
		return Offer_Price;
	}

	public void setOffer_Price(Double offer_Price) {
		Offer_Price = offer_Price;
	}

	public Date getDate_Start() {
		return Date_Start;
	}

	public void setDate_Start(Date date_Start) {
		Date_Start = date_Start;
	}

	public Date getDate_End() {
		return Date_End;
	}

	public void setDate_End(Date date_End) {
		Date_End = date_End;
	}

	public Sections getSec() {
		return Sec;
	}

	public void setSec(Sections sec) {
		Sec = sec;
	}

	public String getNotes() {
		return Notes;
	}

	public void setNotes(String notes) {
		Notes = notes;
	}

	

}
