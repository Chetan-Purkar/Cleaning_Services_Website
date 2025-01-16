package com.Spring.service;

import java.util.List;

import com.Spring.exception.EmailAlreadyExistsException;
import com.Spring.exception.UsernameAlreadyExistsException;
import com.Spring.model.User;

public interface UserService {
    void register(User user) throws EmailAlreadyExistsException, UsernameAlreadyExistsException;
    User validateUser(String username, String password);
    User findByUsername(String username);
    List<User> findAllUsersWithOrders();
    User findUserById(Long id);
    List<User> findOrdersByStatus(String status);
    List<User> findAllUsers(); // Add this method declaration
    List<User> findAllUsersSortedByUsername();
	List<User> findAllUsersWithOrderCount();
	int getTotalOrderCount();
}
