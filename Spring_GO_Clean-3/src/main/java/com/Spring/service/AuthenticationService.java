package com.Spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Spring.model.Order;
import com.Spring.model.User;

@Service
public class AuthenticationService {
	
    @Autowired
    private UserService userService;
    @Autowired
    private OrderService orderService;

    public User authenticateUser(String username, String password) {
        return userService.validateUser(username, password);
    }

    public List<Order> getOrdersForUser(User user) {
        return orderService.findOrdersByUser(user);
    }
}
