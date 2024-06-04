package asm.java5Nhom6.service;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;

@Configuration
public class MessagesConfig {
	@Bean("messageSource")
	public MessageSource getMessageSource() {
	ReloadableResourceBundleMessageSource ms 
	= new ReloadableResourceBundleMessageSource();
	ms.setBasenames("classpath:messages/Users");
	ms.setDefaultEncoding("utf-8");
	return ms;
	}
}