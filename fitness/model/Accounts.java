package com.aladhas.fitness.model;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Accounts {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	private String Emp;
	private Date Date_today;
	private Double Subscrip;
	private Double Prod;
	private Double trainingToday;
	private Double Expense;
	private Double Total;
	private String Notes;

	public Accounts() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Accounts(Long id, String emp, Date date_today, Double subscrip, Double prod, Double trainingToday,
			Double expense, Double total, String notes) {
		super();
		this.id = id;
		Emp = emp;
		Date_today = date_today;
		Subscrip = subscrip;
		Prod = prod;
		this.trainingToday = trainingToday;
		Expense = expense;
		Total = total;
		Notes = notes;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getEmp() {
		return Emp;
	}

	public void setEmp(String emp) {
		Emp = emp;
	}

	public Date getDate_today() {
		return Date_today;
	}

	public void setDate_today(Date date_today) {
		Date_today = date_today;
	}

	public Double getSubscrip() {
		return Subscrip;
	}

	public void setSubscrip(Double subscrip) {
		Subscrip = subscrip;
	}

	public Double getProd() {
		return Prod;
	}

	public void setProd(Double prod) {
		Prod = prod;
	}

	public Double getTrainingToday() {
		return trainingToday;
	}

	public void setTrainingToday(Double trainingToday) {
		this.trainingToday = trainingToday;
	}

	public Double getExpense() {
		return Expense;
	}

	public void setExpense(Double expense) {
		Expense = expense;
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
