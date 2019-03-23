package com.santeamo.model;
/**
 * 用户实体类
 *  Created by santeamo on 2019/03/02
 */
import java.io.Serializable;
import java.util.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.format.annotation.DateTimeFormat;

@Document(collection="user")
public class User implements Serializable{

	private static final long serialVersionUID = 5370126753723948798L;
	@Id
	private String id;
	
	private String name;

	private char sex;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birthday;

	private String username;

	private String password;

	private String telephone;

	private String email;

	private Integer type;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public char getSex() {
		return sex;
	}

	public void setSex(char sex) {
		this.sex = sex;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "User{" +
				"id='" + id + '\'' +
				", name='" + name + '\'' +
				", sex=" + sex +
				", birthday='" + birthday + '\'' +
				", username='" + username + '\'' +
				", password='" + password + '\'' +
				", telephone='" + telephone + '\'' +
				", email='" + email + '\'' +
				", type='" + type + '\'' +
				'}';
	}
}
