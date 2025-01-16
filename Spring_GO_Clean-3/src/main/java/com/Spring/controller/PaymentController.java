package com.Spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.Spring.service.PayPalService;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payment;
import com.paypal.base.rest.PayPalRESTException;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class PaymentController {

    @Autowired
    private PayPalService payPalService;

    @PostMapping("/pay")
    public String payment(@RequestParam double price, HttpServletRequest request) {
        String cancelUrl = "http://localhost:8080/cancel";
        String successUrl = "http://localhost:8080/success";
        try {
            // Change the currency to INR
            Payment payment = payPalService.createPayment(price, "INR", "paypal", 
                                                          "sale", "Booking payment", 
                                                          cancelUrl, successUrl);
            for(Links link : payment.getLinks()) {
                if(link.getRel().equals("approval_url")) {
                    return "redirect:" + link.getHref();
                }
            }
        } catch (PayPalRESTException e) {
        	System.out.println("Error response: " + e.getDetails());
            e.printStackTrace();
        }
        return "redirect:/";
    }

    @GetMapping("/cancel")
    public String cancelPayment() {
        return "cancel";
    }

    @GetMapping("/success")
    public String successPayment(@RequestParam String paymentId, 
                                 @RequestParam("PayerID") String payerId, Model model) {
        try {
            Payment payment = payPalService.executePayment(paymentId, payerId);
            if(payment.getState().equals("approved")) {
                model.addAttribute("payment", payment);
                return "success";
            }
        } catch (PayPalRESTException e) {
            e.printStackTrace();
        }
        return "redirect:/";
    }
}
