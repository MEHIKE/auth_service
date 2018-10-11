package eu.babywatcher;

import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableResourceServer;
import org.springframework.security.oauth2.config.annotation.web.configuration.ResourceServerConfigurerAdapter;

//@Configuration
//@EnableResourceServer
//@Order(199)
abstract class ResourceServerConfiguration { //extends ResourceServerConfigurerAdapter {
/*  @Override
  public void configure(HttpSecurity http) throws Exception {
    http
      .antMatcher("/me")
      .authorizeRequests().anyRequest().authenticated();
  }*/
}