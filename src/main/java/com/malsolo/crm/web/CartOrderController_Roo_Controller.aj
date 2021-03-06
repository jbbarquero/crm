// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.malsolo.crm.web;

import com.malsolo.crm.domain.CartOrder;
import com.malsolo.crm.domain.Customer;
import com.malsolo.crm.domain.LineItem;
import java.io.UnsupportedEncodingException;
import java.lang.Integer;
import java.lang.Long;
import java.lang.String;
import java.util.Collection;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect CartOrderController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String CartOrderController.create(@Valid CartOrder cartOrder, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("cartOrder", cartOrder);
            addDateTimeFormatPatterns(uiModel);
            return "cartorders/create";
        }
        uiModel.asMap().clear();
        cartOrder.persist();
        return "redirect:/cartorders/" + encodeUrlPathSegment(cartOrder.getCartOrderId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String CartOrderController.createForm(Model uiModel) {
        uiModel.addAttribute("cartOrder", new CartOrder());
        addDateTimeFormatPatterns(uiModel);
        return "cartorders/create";
    }
    
    @RequestMapping(value = "/{cartOrderId}", method = RequestMethod.GET)
    public String CartOrderController.show(@PathVariable("cartOrderId") Long cartOrderId, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("cartorder", CartOrder.findCartOrder(cartOrderId));
        uiModel.addAttribute("itemId", cartOrderId);
        return "cartorders/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String CartOrderController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("cartorders", CartOrder.findCartOrderEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) CartOrder.countCartOrders() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("cartorders", CartOrder.findAllCartOrders());
        }
        addDateTimeFormatPatterns(uiModel);
        return "cartorders/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String CartOrderController.update(@Valid CartOrder cartOrder, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("cartOrder", cartOrder);
            addDateTimeFormatPatterns(uiModel);
            return "cartorders/update";
        }
        uiModel.asMap().clear();
        cartOrder.merge();
        return "redirect:/cartorders/" + encodeUrlPathSegment(cartOrder.getCartOrderId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{cartOrderId}", params = "form", method = RequestMethod.GET)
    public String CartOrderController.updateForm(@PathVariable("cartOrderId") Long cartOrderId, Model uiModel) {
        uiModel.addAttribute("cartOrder", CartOrder.findCartOrder(cartOrderId));
        addDateTimeFormatPatterns(uiModel);
        return "cartorders/update";
    }
    
    @RequestMapping(value = "/{cartOrderId}", method = RequestMethod.DELETE)
    public String CartOrderController.delete(@PathVariable("cartOrderId") Long cartOrderId, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        CartOrder.findCartOrder(cartOrderId).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/cartorders";
    }
    
    @ModelAttribute("cartorders")
    public Collection<CartOrder> CartOrderController.populateCartOrders() {
        return CartOrder.findAllCartOrders();
    }
    
    @ModelAttribute("customers")
    public Collection<Customer> CartOrderController.populateCustomers() {
        return Customer.findAllCustomers();
    }
    
    @ModelAttribute("lineitems")
    public Collection<LineItem> CartOrderController.populateLineItems() {
        return LineItem.findAllLineItems();
    }
    
    void CartOrderController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("cartOrder_dateoforder_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    String CartOrderController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        }
        catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
