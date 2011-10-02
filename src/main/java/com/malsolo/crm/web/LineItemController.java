package com.malsolo.crm.web;

import com.malsolo.crm.domain.LineItem;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "lineitems", formBackingObject = LineItem.class)
@RequestMapping("/lineitems")
@Controller
public class LineItemController {
}
