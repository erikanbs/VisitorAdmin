package com.remarkgroup.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class User implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	@Column(name = "fullName")
	private String fullName;

	@Column(name = "email")
	private String email;

	// private Set<Visitor> visitors;

	public int getId() {
		return id;
	}

	public User() {
	}

	public User(String fullName, String email) {
		super();
		this.fullName = fullName;
		this.email = email;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}
