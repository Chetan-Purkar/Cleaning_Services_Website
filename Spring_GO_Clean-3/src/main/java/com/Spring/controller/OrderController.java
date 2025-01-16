package com.Spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.Spring.model.Order;
import com.Spring.model.User;
import com.Spring.service.OrderService;

import jakarta.servlet.http.HttpSession;


@Controller
public class OrderController {
    @Autowired
    private OrderService orderService;
  

    @PostMapping("/book")
    public String bookOrder(@ModelAttribute Order order, @RequestParam int bsize, HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            model.addAttribute("errorMessage", "You need to log in to book an order.");
            return "login";
        }

        order.setUser(user); // Associate the order with the logged-in user
        orderService.saveOrder(order);
        return "redirect:/cart"; // Redirect to the cart page to view orders
    }

    @GetMapping("/cart")
    public String viewCart(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user != null) {
            List<Order> orders = orderService.findOrdersByUser(user);
            model.addAttribute("order", orders); // Ensure this matches the JSP
        } else {
            model.addAttribute("errorMessage", "You need to log in to view your orders.");
            return "login";
        }
        return "cart"; // JSP page to display the orders
    }
    
    @PostMapping("/removeOrder")
    public String removeOrder(@RequestParam Long orderId, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user != null) {
            orderService.deleteOrderByIdAndUser(orderId, user);
        }
        return "redirect:/cart"; // Redirect to the cart page to see updated list
    }

    
   

}
