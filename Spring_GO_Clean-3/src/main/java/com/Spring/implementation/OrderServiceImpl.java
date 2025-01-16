package com.Spring.implementation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Spring.model.Order;
import com.Spring.model.User;
import com.Spring.repository.OrderRepository;
import com.Spring.service.OrderService;

import jakarta.transaction.Transactional;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderRepository orderRepository;

    @Override
    public List<Order> findOrdersByUser(User user) {
        return orderRepository.findByUser(user);
    }

    @Override
    public void saveOrder(Order order) {
        order.setOrderDateTime(LocalDateTime.now());
        orderRepository.save(order);
    }

    @Override
    public void deleteOrderByIdAndUser(Long orderId, User user) {
        Order order = orderRepository.findByIdAndUser(orderId, user);
        if (order != null) {
            orderRepository.delete(order);
        }
    }

    @Override
    public List<Order> findOrdersByUserId(Long userId) {
        return orderRepository.findByUserId(userId);
    }

    @Transactional
    @Override
    public void updateOrderStatus(Long orderId, String status) {
        Order order = orderRepository.findById(orderId)
            .orElseThrow(() -> new IllegalArgumentException("Invalid order ID"));
        order.setStatus(status);
        orderRepository.save(order);
    }

    @Override
    public List<Order> findOrdersByStatus(String status) {
        if (status != null && !status.isEmpty()) {
            return orderRepository.findByStatus(status);
        }
        return findAllOrders(); // Return all orders if no status is provided
    }

    @Override
    public List<Order> findAllOrders() {
        return orderRepository.findAll(); // Retrieves all orders
    }
    
    @Override
    public List<Order> findOrdersByUsername(String username) {
        return orderRepository.findByUserUsername(username);
    }
    
    @Override
    public List<Order> findOrdersWithUsers() {
        return orderRepository.findOrdersWithUsers(); // Delegate to the repository
    }
    
    // Get order count for a specific day
    public int getOrderCountByDay(int day, int month, int year) {
        return orderRepository.countOrdersByDay(day, month, year);
    }

    // Get order count for a specific month
    public int getOrderCountByMonth(int month, int year) {
        return orderRepository.countOrdersByMonth(month, year);
    }

    // Get order count for a specific year
    public int getOrderCountByYear(int year) {
        return orderRepository.countOrdersByYear(year);
    }

    // Get total order count
    public int getTotalOrderCount() {
        return orderRepository.countAllOrders();
    }

    
    
}
