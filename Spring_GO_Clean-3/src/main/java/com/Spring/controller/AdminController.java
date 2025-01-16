package com.Spring.controller;

import com.Spring.model.Admin;
import com.Spring.service.AdminService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AdminController {

    @Autowired
    private AdminService adminService;
 


    @GetMapping("/adminregister")
	public String showRegisterForm(Model model) {
		model.addAttribute("admin", new Admin());
		return "adminregister";
	}
    
    @PostMapping("/adminregister")
    public String registerAdmin(Admin admin, Model model) {
        Admin existingAdmin = adminService.registerAdmin(admin);
        if (existingAdmin != null) {
            model.addAttribute("email_error", "Email already in use");
            return "adminregister"; // return the JSP page for registration
        }
        return "admin"; // redirect to the login page after successful registration
    }
    
    @GetMapping("/admin")
	public String showLoginForm(Model model) {
		model.addAttribute("admin", new Admin());
		return "admin";
	}
    @GetMapping("/aaa")
   	public String aaa(Model model) {
   		return "aaa";
   	}
    
    @PostMapping("/admin")
	public String login(@RequestParam String username, 
	                    @RequestParam String password,
	                    HttpServletRequest request, 
	                    HttpServletResponse response, // Response is passed here
	                    Model model) {
	    Admin admin = adminService.validateAdmin(username, password);
	    if (admin != null) {
	        // Set session attribute
	        HttpSession session = request.getSession();
	        session.setAttribute("admin", admin);
	        return "redirect:/dashboard"; // Redirect to the index page or product list page
	    } else {
	        model.addAttribute("error", "Invalid username or password !!");
	        return "admin";
	    }
	}
    
    
    @GetMapping("/adminlogout")
   	public String logout(HttpServletRequest request) {
   		// Invalidate the session
   		HttpSession session = request.getSession(false);
   		if (session != null) {
   			session.invalidate();
   		}
   		return "redirect:/admin";
   	}
    


    
    
}
