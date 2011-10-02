package com.malsolo.crm.web;

import com.malsolo.crm.domain.Company;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "companys", formBackingObject = Company.class)
@RequestMapping("/companys")
@Controller
public class CompanyController {
}
