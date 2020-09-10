
package com.zhu;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

@ServletComponentScan(basePackages= {"com.zhu.filter"})
@SpringBootApplication
public class APP {
	public static void main(String[] args) {  
		SpringApplication.run(APP.class, args);
	}

}

