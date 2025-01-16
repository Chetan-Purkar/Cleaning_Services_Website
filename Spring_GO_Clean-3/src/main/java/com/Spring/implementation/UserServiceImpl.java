package com.Spring.implementation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Spring.exception.EmailAlreadyExistsException;
import com.Spring.exception.UsernameAlreadyExistsException;
import com.Spring.model.Order;
import com.Spring.model.User;
import com.Spring.repository.OrderRepository;
import com.Spring.repository.UserRepository;
import com.Spring.service.UserService;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private OrderRepository orderRepository;


    @Override
    public void register(User user) throws EmailAlreadyExistsException, UsernameAlreadyExistsException {
        if (userRepository.existsByEmail(user.getEmail())) {
            throw new EmailAlreadyExistsException("Email already exists.");
        }
        if (userRepository.existsByUsername(user.getUsername())) {
            throw new UsernameAlreadyExistsException("Username already exists.");
        }
        userRepository.save(user);
    }

    @Override
    public User validateUser(String username, String password) {
        User user = userRepository.findByUsername(username);
        if (user != null && user.getPassword().equals(password)) {
            return user;
        }
        return null;
    }

    @Override
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }
    @Override
    public User findUserById(Long id) {
        return userRepository.findById(id).orElse(null);
    }
    
    @Override
    public List<User> findAllUsers() {
        return userRepository.findAll(); // Retrieve all users
    }
    

    @Override
    public List<User> findOrdersByStatus(String status) {
        // Fetch all orders with the specified status
        List<Order> orders = orderRepository.findByStatus(status);

        // Extract unique users from those orders
        Set<User> usersWithOrders = orders.stream()
                                          .map(Order::getUser)
                                          .collect(Collectors.toSet());

        // Convert set to list and return
        return new ArrayList<>(usersWithOrders);
    }

    @Override
    public List<User> findAllUsersWithOrders() {
        return userRepository.findUsersWithOrders();
    }

    // Fetch all users with their order counts
    public List<User> findAllUsersWithOrderCount() {
        return userRepository.findAllByOrderByUsernameAsc();
    }

    // Get total order count across all users
    public int getTotalOrderCount() {
        List<User> users = userRepository.findAll();
        return users.stream().mapToInt(user -> user.getOrders().size()).sum();
    }

	@Override
	public List<User> findAllUsersSortedByUsername() {
		// TODO Auto-generated method stub
		return null;
	}
    
    
	
}
