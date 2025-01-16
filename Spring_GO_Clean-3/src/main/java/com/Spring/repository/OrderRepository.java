package com.Spring.repository;

import com.Spring.model.Order;
import com.Spring.model.User;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
    List<Order> findByUser(User user);
    Order findByIdAndUser(Long id, User user);
    List<Order> findByUserId(Long userId); 
    List<Order> findByStatus(String status);
    List<Order> findByUserUsername(String username);
    
    @Query("SELECT o FROM Order o WHERE o.user IS NOT NULL")
    List<Order> findOrdersWithUsers();  // Custom query to find orders with users

    @Query("SELECT o FROM Order o WHERE FUNCTION('DATE', o.orderDateTime) = CURRENT_DATE")
    List<Order> findTodayOrders();

    @Query("SELECT o FROM Order o WHERE FUNCTION('MONTH', o.orderDateTime) = ?1 AND FUNCTION('YEAR', o.orderDateTime) = ?2")
    List<Order> findMonthOrders(int month, int year);

    @Query("SELECT o FROM Order o WHERE FUNCTION('YEAR', o.orderDateTime) = ?1")
    List<Order> findYearOrders(int year);
    
    @Query("SELECT o FROM Order o WHERE FUNCTION('DAY', o.orderDateTime) = ?1 AND FUNCTION('MONTH', o.orderDateTime) = ?2 AND FUNCTION('YEAR', o.orderDateTime) = ?3")
    List<Order> findOrdersByDate(int day, int month, int year);

    
 // Count orders for a specific day
    @Query("SELECT COUNT(o) FROM Order o WHERE DAY(o.orderDateTime) = :day AND MONTH(o.orderDateTime) = :month AND YEAR(o.orderDateTime) = :year")
    int countOrdersByDay(int day, int month, int year);

    // Count orders for a specific month and year
    @Query("SELECT COUNT(o) FROM Order o WHERE MONTH(o.orderDateTime) = :month AND YEAR(o.orderDateTime) = :year")
    int countOrdersByMonth(int month, int year);

    // Count orders for a specific year
    @Query("SELECT COUNT(o) FROM Order o WHERE YEAR(o.orderDateTime) = :year")
    int countOrdersByYear(int year);

    // Count all orders
    @Query("SELECT COUNT(o) FROM Order o")
    int countAllOrders();
}
