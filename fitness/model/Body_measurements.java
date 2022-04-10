package com.aladhas.fitness.model;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
public class Body_measurements {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long ID;
	private Date Today_date;
	private int Age;
	private Double Hight;
	private Double Weight;
	private Double Fats;
	private Double Muscles;
	private Double Calories;
	
	@OneToOne(fetch = FetchType.EAGER)
	private Customers c;
	
	public Body_measurements() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Body_measurements(Long iD, Date today_date, int age, Double hight, Double weight, Double fats,
			Double muscles, Double calories, Customers c) {
		super();
		ID = iD;
		Today_date = today_date;
		Age = age;
		Hight = hight;
		Weight = weight;
		Fats = fats;
		Muscles = muscles;
		Calories = calories;
		this.c = c;
	}

	public Long getID() {
		return ID;
	}

	public void setID(Long iD) {
		ID = iD;
	}

	public Date getToday_date() {
		return Today_date;
	}

	public void setToday_date(Date today_date) {
		Today_date = today_date;
	}

	public int getAge() {
		return Age;
	}

	public void setAge(int age) {
		Age = age;
	}

	public Double getHight() {
		return Hight;
	}

	public void setHight(Double hight) {
		Hight = hight;
	}

	public Double getWeight() {
		return Weight;
	}

	public void setWeight(Double weight) {
		Weight = weight;
	}

	public Double getFats() {
		return Fats;
	}

	public void setFats(Double fats) {
		Fats = fats;
	}

	public Double getMuscles() {
		return Muscles;
	}

	public void setMuscles(Double muscles) {
		Muscles = muscles;
	}

	public Double getCalories() {
		return Calories;
	}

	public void setCalories(Double calories) {
		Calories = calories;
	}

	public Customers getC() {
		return c;
	}

	public void setC(Customers c) {
		this.c = c;
	}

	
	
	
}
