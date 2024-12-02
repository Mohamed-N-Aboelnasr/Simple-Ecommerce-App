package com.ejada.springbootecommerce.dto;

import java.util.Set;

import com.ejada.springbootecommerce.entity.Address;
import com.ejada.springbootecommerce.entity.Customer;
import com.ejada.springbootecommerce.entity.Order;
import com.ejada.springbootecommerce.entity.OrderItem;

import lombok.Data;

@Data
public class Purchase {

    private Customer customer;
    private Address shippingAddress;
    private Address billingAddress;
    private Order order;
    private Set<OrderItem> orderItems;

}