package com.Spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Spring.model.Order;
import com.Spring.repository.OrderRepository;

@Service
public class ReportService {

    @Autowired
    private OrderRepository orderRepository;

    public List<Order> getTodayOrders() {
        return orderRepository.findTodayOrders();
    }

    public List<Order> getMonthOrders(int month, int year) {
        return orderRepository.findMonthOrders(month, year);
    }

    public List<Order> getYearOrders(int year) {
        return orderRepository.findYearOrders(year);
    }
    
    public List<Order> getOrdersByDate(int day, int month, int year) {
        // Adjust the query according to your ORM tool
        return orderRepository.findOrdersByDate(day, month, year);
    }

}
