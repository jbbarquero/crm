// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.malsolo.crm.domain;

import com.malsolo.crm.domain.CartOrderDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CartOrderIntegrationTest_Roo_IntegrationTest {
    
    declare @type: CartOrderIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: CartOrderIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    declare @type: CartOrderIntegrationTest: @Transactional;
    
    @Autowired
    private CartOrderDataOnDemand CartOrderIntegrationTest.dod;
    
    @Test
    public void CartOrderIntegrationTest.testCountCartOrders() {
        org.junit.Assert.assertNotNull("Data on demand for 'CartOrder' failed to initialize correctly", dod.getRandomCartOrder());
        long count = com.malsolo.crm.domain.CartOrder.countCartOrders();
        org.junit.Assert.assertTrue("Counter for 'CartOrder' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void CartOrderIntegrationTest.testFindCartOrder() {
        com.malsolo.crm.domain.CartOrder obj = dod.getRandomCartOrder();
        org.junit.Assert.assertNotNull("Data on demand for 'CartOrder' failed to initialize correctly", obj);
        java.lang.Long id = obj.getCartOrderId();
        org.junit.Assert.assertNotNull("Data on demand for 'CartOrder' failed to provide an identifier", id);
        obj = com.malsolo.crm.domain.CartOrder.findCartOrder(id);
        org.junit.Assert.assertNotNull("Find method for 'CartOrder' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'CartOrder' returned the incorrect identifier", id, obj.getCartOrderId());
    }
    
    @Test
    public void CartOrderIntegrationTest.testFindAllCartOrders() {
        org.junit.Assert.assertNotNull("Data on demand for 'CartOrder' failed to initialize correctly", dod.getRandomCartOrder());
        long count = com.malsolo.crm.domain.CartOrder.countCartOrders();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'CartOrder', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<com.malsolo.crm.domain.CartOrder> result = com.malsolo.crm.domain.CartOrder.findAllCartOrders();
        org.junit.Assert.assertNotNull("Find all method for 'CartOrder' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'CartOrder' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void CartOrderIntegrationTest.testFindCartOrderEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'CartOrder' failed to initialize correctly", dod.getRandomCartOrder());
        long count = com.malsolo.crm.domain.CartOrder.countCartOrders();
        if (count > 20) count = 20;
        java.util.List<com.malsolo.crm.domain.CartOrder> result = com.malsolo.crm.domain.CartOrder.findCartOrderEntries(0, (int) count);
        org.junit.Assert.assertNotNull("Find entries method for 'CartOrder' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'CartOrder' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void CartOrderIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'CartOrder' failed to initialize correctly", dod.getRandomCartOrder());
        com.malsolo.crm.domain.CartOrder obj = dod.getNewTransientCartOrder(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'CartOrder' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'CartOrder' identifier to be null", obj.getCartOrderId());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'CartOrder' identifier to no longer be null", obj.getCartOrderId());
    }
    
    @Test
    public void CartOrderIntegrationTest.testRemove() {
        com.malsolo.crm.domain.CartOrder obj = dod.getRandomCartOrder();
        org.junit.Assert.assertNotNull("Data on demand for 'CartOrder' failed to initialize correctly", obj);
        java.lang.Long id = obj.getCartOrderId();
        org.junit.Assert.assertNotNull("Data on demand for 'CartOrder' failed to provide an identifier", id);
        obj = com.malsolo.crm.domain.CartOrder.findCartOrder(id);
        obj.remove();
        obj.flush();
        org.junit.Assert.assertNull("Failed to remove 'CartOrder' with identifier '" + id + "'", com.malsolo.crm.domain.CartOrder.findCartOrder(id));
    }
    
}