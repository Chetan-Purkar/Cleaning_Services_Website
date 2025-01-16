package com.Spring.service;

import com.Spring.model.Admin;
import com.Spring.repository.AdminRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class AdminService {

    @Autowired
    private AdminRepository adminRepository;

    public Admin registerAdmin(Admin admin) {
        // Here, you can add logic to check if the username or email already exists, etc.
        return adminRepository.save(admin);
    }

    public Admin loginAdmin(String username, String password) {
        Admin admin = adminRepository.findByUsername(username);
        if (admin != null && admin.getPassword().equals(password)) {
            return admin;
        }
        return null; // or throw an exception if you prefer
    }
    
    public Admin validateAdmin(String username, String password) {
    	Admin admin = adminRepository.findByUsername(username);
        if (admin != null && admin.getPassword().equals(password)) {
            return admin;
        }
        return null;
    }

    public Optional<Admin> findAdminById(Long id) {
        return adminRepository.findById(id);
    }
}
