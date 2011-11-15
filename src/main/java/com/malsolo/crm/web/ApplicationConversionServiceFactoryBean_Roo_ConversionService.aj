// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.malsolo.crm.web;

import com.malsolo.crm.domain.CartOrder;
import com.malsolo.crm.domain.Company;
import com.malsolo.crm.domain.Customer;
import com.malsolo.crm.domain.LineItem;
import com.malsolo.crm.domain.Product;
import java.lang.String;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;

privileged aspect ApplicationConversionServiceFactoryBean_Roo_ConversionService {
    
    public void ApplicationConversionServiceFactoryBean.installLabelConverters(FormatterRegistry registry) {
        registry.addConverter(new CartOrderConverter());
        registry.addConverter(new CompanyConverter());
        registry.addConverter(new CustomerConverter());
        registry.addConverter(new LineItemConverter());
        registry.addConverter(new ProductConverter());
    }
    
    public void ApplicationConversionServiceFactoryBean.afterPropertiesSet() {
        super.afterPropertiesSet();
        installLabelConverters(getObject());
    }
    
    static class com.malsolo.crm.web.ApplicationConversionServiceFactoryBean.CartOrderConverter implements Converter<CartOrder, String> {
        public String convert(CartOrder cartOrder) {
            return new StringBuilder().append(cartOrder.getDateOfOrder()).toString();
        }
        
    }
    
    static class com.malsolo.crm.web.ApplicationConversionServiceFactoryBean.CompanyConverter implements Converter<Company, String> {
        public String convert(Company company) {
            return new StringBuilder().append(company.getCompany()).toString();
        }
        
    }
    
    static class com.malsolo.crm.web.ApplicationConversionServiceFactoryBean.CustomerConverter implements Converter<Customer, String> {
        public String convert(Customer customer) {
            return new StringBuilder().append(customer.getLastName()).append(" ").append(customer.getFirstName()).toString();
        }
        
    }
    
    static class com.malsolo.crm.web.ApplicationConversionServiceFactoryBean.LineItemConverter implements Converter<LineItem, String> {
        public String convert(LineItem lineItem) {
            return new StringBuilder().append(lineItem.getQuantity()).toString();
        }
        
    }
    
    static class com.malsolo.crm.web.ApplicationConversionServiceFactoryBean.ProductConverter implements Converter<Product, String> {
        public String convert(Product product) {
            return new StringBuilder().append(product.getName()).append(" ").append(product.getDescription()).append(" ").append(product.getPrice()).toString();
        }
        
    }
    
}