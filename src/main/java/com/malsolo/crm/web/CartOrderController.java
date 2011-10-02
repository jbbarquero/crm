package com.malsolo.crm.web;

import com.malsolo.crm.domain.CartOrder;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "cartorders", formBackingObject = CartOrder.class)
@RequestMapping("/cartorders")
@Controller
public class CartOrderController {
}
