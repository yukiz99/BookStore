package com.zhu.domain;

import lombok.Data;

@Data
public class User {
	private String id;
	private String username;
	private String password;
	private String cellphone;
	private String email;
	private String address;
	private boolean admin;
}
