package com.malsolo.crm.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/env")
public class EnvironmentController_ {

	private static final Logger logger = LoggerFactory.getLogger(EnvironmentController_.class);
	
	public void env(HttpServletResponse response) throws IOException {
	    response.setContentType("text/plain");
	    PrintWriter out = response.getWriter();
	    out.println("System Environment:");
	    for (Map.Entry<String, String> envvar : System.getenv().entrySet()) {
	        out.println(envvar.getKey() + ": " + envvar.getValue());
	    }
	}

}
