package com.zhu.domain;

import lombok.Data;

@Data
public class Msg {

	int code;
	Object obj;
	
	public Msg(){} 
	public Msg(int code,Object obj){
		this.code=code;
		this.obj=obj;
	}
	
}
