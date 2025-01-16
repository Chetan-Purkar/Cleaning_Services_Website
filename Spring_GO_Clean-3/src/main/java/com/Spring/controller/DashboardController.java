package com.Spring.controller;

import com.Spring.model.Order;
import com.Spring.model.User;
import com.Spring.service.OrderService;
import com.Spring.service.ProductService;
import com.Spring.service.ReportService;
import com.Spring.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;



@Controller
@RequestMapping("/dashboard")
public class DashboardController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private UserService userService;

    @Autowired
    private ProductService productService;

    @Autowired
    private ReportService reportService;
    

    @GetMapping
    public String showDashboard(HttpServletRequest request,
                                @RequestParam(required = false) String status,
                                @RequestParam(required = false) Integer day,
                                @RequestParam(required = false) Integer month,
                                @RequestParam(required = false) Integer year,
                                @RequestParam(required = false) Long orderId,
                                @RequestParam(required = false) String action,
                                @RequestParam(required = false) String newStatus,
                                Model model) {
        // Retrieve session, but do not create a new one if it doesn't exist
        HttpSession session = request.getSession(false);

        // Check if admin is logged in
        if (session == null || session.getAttribute("admin") == null) {
            // If not logged in as admin, redirect to admin login page
            model.addAttribute("errorMessage", "You need to log in as an admin to access the dashboard.");
            return "redirect:/admin"; // Redirect to admin login page
        }

        // Handle Update Booking Status
        if ("updateBookingStatus".equals(action) && orderId != null && newStatus != null) {
            orderService.updateOrderStatus(orderId, newStatus);
        }

        // Retrieve Orders based on status
        List<Order> orders = (status != null && !status.isEmpty()) 
                             ? orderService.findOrdersByStatus(status) 
                             : orderService.findAllOrders();

        // Retrieve Users

        // Handle Show Orders by Date (Filter by day, month, year)
        if (day != null && month != null && year != null) {
            List<Order> filteredOrders = reportService.getOrdersByDate(day, month, year);
            model.addAttribute("orders", filteredOrders);
        } else {
            model.addAttribute("orders", orders); // Add the default orders
        }

        
        // Fetch all users with their order counts
        List<User> users = userService.findAllUsersWithOrderCount();
        // Get total order count for all users
        int totalOrderCountUser = userService.getTotalOrderCount();

        // Add to the model
        model.addAttribute("users", users);
        model.addAttribute("totalOrderCount", totalOrderCountUser);
        
        
        
        // Additional attributes for the dashboard page
        model.addAttribute("products", productService.getAllProducts());
        model.addAttribute("status", status); // To highlight current filter in the UI
     

        return "dashboard"; // Return the dashboard view
    }
    
    @GetMapping("/reports")
    public String getOrderCounts(@RequestParam(required = false) Integer day,
                                  @RequestParam(required = false) Integer month,
                                  @RequestParam(required = false) Integer year,
                                  Model model) {
        // If month or year is null, provide defaults
        if (month == null) {
            month = 1;  // Default to January if month is missing
        }
        if (year == null) {
            year = 2024;  // Default to current year if missing
        }

        // Initialize counts
        int dayCount = 0, monthCount = 0, yearCount = 0, totalOrderCount = 0;

        if (day != null) {
            // Count for the specific day
            dayCount = orderService.getOrderCountByDay(day, month, year);
        }

        // Count for the specific month and year
        monthCount = orderService.getOrderCountByMonth(month, year);

        // Count for the specific year
        yearCount = orderService.getOrderCountByYear(year);

        // Total orders count
        totalOrderCount = orderService.getTotalOrderCount();

        // Add data to model
        model.addAttribute("dayCount", dayCount);
        model.addAttribute("monthCount", monthCount);
        model.addAttribute("yearCount", yearCount);
        model.addAttribute("totalOrderCount", totalOrderCount);
        model.addAttribute("selectedDay", day);
        model.addAttribute("selectedMonth", month);
        model.addAttribute("selectedYear", year);

        return "dashboard"; // Return the name of your JSP page
    }
}


