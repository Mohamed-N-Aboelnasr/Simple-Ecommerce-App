package com.ejada.springbootecommerce.service;

import com.ejada.springbootecommerce.dto.Purchase;
import com.ejada.springbootecommerce.dto.PurchaseResponse;

public interface CheckoutService {

    PurchaseResponse placeOrder(Purchase purchase);
}
