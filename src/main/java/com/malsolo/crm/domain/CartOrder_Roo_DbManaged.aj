// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.malsolo.crm.domain;

import com.malsolo.crm.domain.Customer;
import com.malsolo.crm.domain.LineItem;
import java.util.Date;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;

privileged aspect CartOrder_Roo_DbManaged {
    
    @OneToMany(mappedBy = "cartOrderId")
    private Set<LineItem> CartOrder.lineItems;
    
    @ManyToOne
    @JoinColumn(name = "CUSTOMER_ID", referencedColumnName = "CUSTOMER_ID")
    private Customer CartOrder.customerId;
    
    @Column(name = "DATE_OF_ORDER")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(style = "M-")
    private Date CartOrder.dateOfOrder;
    
    public Set<LineItem> CartOrder.getLineItems() {
        return this.lineItems;
    }
    
    public void CartOrder.setLineItems(Set<LineItem> lineItems) {
        this.lineItems = lineItems;
    }
    
    public Customer CartOrder.getCustomerId() {
        return this.customerId;
    }
    
    public void CartOrder.setCustomerId(Customer customerId) {
        this.customerId = customerId;
    }
    
    public Date CartOrder.getDateOfOrder() {
        return this.dateOfOrder;
    }
    
    public void CartOrder.setDateOfOrder(Date dateOfOrder) {
        this.dateOfOrder = dateOfOrder;
    }
    
}
