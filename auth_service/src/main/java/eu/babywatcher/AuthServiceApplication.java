package eu.babywatcher;

import java.security.Principal;
import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@SpringBootApplication
@Controller
@EnableEurekaClient
@EnableDiscoveryClient 
public class AuthServiceApplication  {

	/*@RequestMapping({ "/user", "/me"})
	public Map<String, String> user(Principal principal) {
		Map<String, String> map = new LinkedHashMap<>();
		map.put("name", principal.getName());
		return map;
	}*/
	
    public static void main(String[] args) {
        SpringApplication.run(AuthServiceApplication.class, args);
    }

}
