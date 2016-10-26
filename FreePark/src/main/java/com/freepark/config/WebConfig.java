package com.freepark.config;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.MediaType;
import org.springframework.http.converter.ByteArrayHttpMessageConverter;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.Jackson2ObjectMapperBuilder;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.security.web.method.annotation.AuthenticationPrincipalArgumentResolver;
import org.springframework.validation.Validator;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;
import org.springframework.web.servlet.view.tiles3.TilesViewResolver;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;

@Configuration
@ComponentScan(basePackages = "com.freepark")
@EnableWebMvc
public class WebConfig  extends WebMvcConfigurerAdapter {

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		super.addResourceHandlers(registry);
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	}

	@Override
	public void configureMessageConverters(
			List<HttpMessageConverter<?>> converters) {
		super.configureMessageConverters(converters);
		converters.add(converterJackson());
		converters.add(byteArrayHttpMessageConverter());
	}

	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		super.configureViewResolvers(registry);
	}
	
	@Bean
    public AuthenticationPrincipalArgumentResolver authenticationPrincipalArgumentResolver(){
        return new AuthenticationPrincipalArgumentResolver();
    }
	
	@Bean
	public LocalValidatorFactoryBean validator(){
		LocalValidatorFactoryBean localValidatorFactoryBean = new LocalValidatorFactoryBean();
		return localValidatorFactoryBean;
	}
	
	
	@Override
	public Validator getValidator() {
		return validator();
	}
	
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		super.addInterceptors(registry);
	}

	@Override
	public void addArgumentResolvers(
			List<HandlerMethodArgumentResolver> argumentResolvers) {
		argumentResolvers.add(authenticationPrincipalArgumentResolver());
	}
	
	@Bean
	public InternalResourceViewResolver getInternalResourceViewResolver() {
	  InternalResourceViewResolver resolver = new InternalResourceViewResolver();
	  resolver.setPrefix("/WEB-INF/views/");
	  resolver.setSuffix(".jsp");
	  resolver.setOrder(0);
	  return resolver;
	}
	
	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
	  configurer.enable();
	}

	@Bean
    public MappingJackson2HttpMessageConverter converterJackson() {
		final ObjectMapper objectMapper=new ObjectMapper();
		final Jackson2ObjectMapperBuilder builder = new Jackson2ObjectMapperBuilder();
	    builder.indentOutput(true).dateFormat(new SimpleDateFormat("dd-MM-yyyy hh:mm"));
		objectMapper.enable(SerializationFeature.INDENT_OUTPUT);
		MappingJackson2HttpMessageConverter converter = new MappingJackson2HttpMessageConverter(builder.build());
        converter.setObjectMapper(objectMapper);
	    return converter;
    }
	
	private List<MediaType> getSupportedMediaTypes() {
	    List<MediaType> list = new ArrayList<MediaType>();
	    list.add(MediaType.ALL);
	    return list;
	}
	
	@Bean
	public ByteArrayHttpMessageConverter byteArrayHttpMessageConverter() {
	    ByteArrayHttpMessageConverter arrayHttpMessageConverter = new ByteArrayHttpMessageConverter();
	    arrayHttpMessageConverter.setSupportedMediaTypes(getSupportedMediaTypes());
	    return arrayHttpMessageConverter;
	}
	
	
	 @Bean
	 public TilesViewResolver getTilesViewResolver() {
	  TilesViewResolver tilesViewResolver = new TilesViewResolver();
	  tilesViewResolver.setViewClass(TilesView.class);
	  tilesViewResolver.setContentType("text/html;charset=UTF-8");
	  return tilesViewResolver;
	 }


	 @Bean
	 public TilesConfigurer getTilesConfigurer() {
	  TilesConfigurer tilesConfigurer = new TilesConfigurer();
	  tilesConfigurer.setCheckRefresh(true);
	  tilesConfigurer.setDefinitions("WEB-INF/tiles/tiles-definitions.xml");
	  tilesConfigurer.setPreparerFactoryClass(org.springframework.web.servlet.view.tiles3.SpringBeanPreparerFactory.class);
      	  
	  return tilesConfigurer;
	 }

}
