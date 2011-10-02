package com.malsolo.crm.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.malsolo.crm.domain.Customer;

@RooWebScaffold(path = "customers", formBackingObject = Customer.class)
@RequestMapping("/customers")
@Controller
public class CustomerController {
}
