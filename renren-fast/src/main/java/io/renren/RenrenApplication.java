/**
 * Copyright (c) 2016-2019 人人开源 All rights reserved.
 *
 * https://www.renren.io
 *
 * 版权所有，侵权必究！
 */

package io.renren;

import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.core.env.ConfigurableEnvironment;

@Slf4j
@SpringBootApplication
public class RenrenApplication {

	private static final Logger LOGGER = LoggerFactory.getLogger(RenrenApplication.class);
	public static void main(String[] args) {
		ConfigurableApplicationContext context = SpringApplication.run(RenrenApplication.class, args);
		ConfigurableEnvironment environment = context.getEnvironment();
		LOGGER.info("application: localhost: {}", environment.getProperty("server.port"));
	}

}
