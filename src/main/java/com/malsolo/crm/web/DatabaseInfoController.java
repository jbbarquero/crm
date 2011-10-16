package com.malsolo.crm.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping("/databaseinfo/**")
@Controller
public class DatabaseInfoController {
	
	@Autowired
	DataSource dataSource;

    @RequestMapping
    public void get(ModelMap modelMap, HttpServletRequest request, HttpServletResponse response) {
    }

    @RequestMapping(method = RequestMethod.POST, value = "{id}")
    public void post(@PathVariable Long id, ModelMap modelMap, HttpServletRequest request, HttpServletResponse response) {
    }

    @RequestMapping
    public String index(ModelMap modelMap) {
    	JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
    	String userInfo = jdbcTemplate.queryForObject("select user", String.class);
    	String urlInfo = "?";
    	if (dataSource instanceof BasicDataSource) {
    		urlInfo = ((BasicDataSource) dataSource).getUrl();
    	}
    	String versionInfo = jdbcTemplate.queryForObject("select version()", String.class);
    	modelMap.put("userInfo", userInfo);
    	modelMap.put("urlInfo", urlInfo);
    	modelMap.put("versionInfo", versionInfo);
    	return "databaseinfo/index";
    }
    
    @RequestMapping
    public String info(ModelMap modelMap) {
    	String appHost = System.getenv("VCAP_APP_HOST");
    	String appPort = System.getenv("VCAP_APP_PORT");
    	modelMap.put("appHost", appHost);
    	modelMap.put("appPort", appPort);
    	return "databaseinfo/info";
    }
    
    
}
