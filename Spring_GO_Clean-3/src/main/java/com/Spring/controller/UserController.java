package com.Spring.controller;

import com.Spring.exception.EmailAlreadyExistsException;
import com.Spring.exception.UsernameAlreadyExistsException;
import com.Spring.exception.ValidationUtils;
import com.Spring.model.User;
import com.Spring.service.UserService;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	

	@GetMapping("/register")
	public String showRegisterForm(Model model) {
		model.addAttribute("user", new User());
		return "register";
	}

	@PostMapping("/register")
	public String registerUser(@ModelAttribute User user, Model model) {
	    // Validate email and contact number
	    if (!ValidationUtils.isValidEmail(user.getEmail())) {
	        model.addAttribute("errorMessage", "Invalid email format.");
	        return "register"; // Return to the registration page with an error message
	    }

	    if (!ValidationUtils.isValidContactNumber(user.getNumber())) {
	        model.addAttribute("errorMessage", "Invalid contact number. It must be a 10-digit number.");
	        return "register"; // Return to the registration page with an error message
	    }

	    try {
	        userService.register(user); // Attempt to register the user
	        return "redirect:/login"; // Redirect to login page on successful registration
	    } catch (EmailAlreadyExistsException e) {
	        model.addAttribute("email_error", e.getMessage());
	        return "register"; // Return to the registration page with an error message
	    } catch (UsernameAlreadyExistsException e) {
	        model.addAttribute("username_error", e.getMessage());
	        return "register"; // Return to the registration page with an error message
	    }
	}


	@GetMapping("/login")
	public String showLoginForm(Model model) {
		model.addAttribute("user", new User());
		return "login";
	}

	@PostMapping("/login")
	public String login(@RequestParam String username, 
	                    @RequestParam String password,
	                    HttpServletRequest request, 
	                    HttpServletResponse response, // Response is passed here
	                    Model model) {
	    User user = userService.validateUser(username, password);
	    if (user != null) {
	        // Set session attribute
	        HttpSession session = request.getSession();
	        session.setAttribute("user", user);

	        // Create a cookie to remember the user for 1 day (24 hours)
	        Cookie userCookie = new Cookie("userSession", user.getId().toString());
	        userCookie.setMaxAge(60 * 60 * 24); // 24 hours in seconds
	        userCookie.setHttpOnly(true); // Secure the cookie from client-side scripts
	        userCookie.setPath("/"); // Available throughout the application
	        response.addCookie(userCookie);

	        return "redirect:/index"; // Redirect to the index page or product list page
	    } else {
	        model.addAttribute("error", "Invalid username or password !!");
	        return "login";
	    }
	}


	

	@GetMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
	    HttpSession session = request.getSession(false);
	    if (session != null) {
	        session.invalidate();
	    }

	    // Clear the 'userSession' cookie
	    Cookie userCookie = new Cookie("userSession", null);
	    userCookie.setMaxAge(0); // Delete the cookie
	    userCookie.setPath("/"); // Match the cookie path
	    response.addCookie(userCookie);

	    return "redirect:/login"; // Redirect to login page after logout
	}

	
	    
}
