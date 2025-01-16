package com.Spring.controller;

import com.Spring.model.Admin;
import com.Spring.model.Category;
import com.Spring.model.Product;
import com.Spring.repository.CategoryRepository;
import com.Spring.repository.ProductRepository;
import com.Spring.service.CategoryService;
import com.Spring.service.ProductService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ProductController {
	
	@Autowired
	private ProductRepository productRepository;
	@Autowired
    private CategoryRepository categoryRepository;
    @Autowired
    private ProductService productService;
    @Autowired
    private CategoryService categoryService;
   
    @GetMapping("/index")
    public String viewProducts(Model model) {
        // Fetch all products and categories to display
        model.addAttribute("products", productService.getAllProducts());
        List<Category> categories = categoryService.getAllCategories();
        model.addAttribute("categories", categories);
        return "index"; // Return the view name for JSP
    }

    @GetMapping("/categories/{id}")
    @ResponseBody
    public List<Product> getProductsByCategory(@PathVariable Long id) {
        Category category = categoryService.getCategoryById(id);
        List<Product> products = productService.getProductsByCategory(category);
        return products; // This should return a List<Product>
    }

    
    @GetMapping("/booking")
    public String booking() {
        return "booking";
    }
    
    @GetMapping("/users")
    public String User() {
        return "users";
    }
    
    @GetMapping("/about")
    public String about() {
        return "about";
    }
    
    @GetMapping("/contact")
    public String contact() {
        return "contact";
    }  
    @GetMapping("/contactinfo")
    public String contactinfo() {
        return "contact";
    }  
    @GetMapping("/booking/{id}")
    public String viewProduct(@PathVariable Long id, Model model) {
        Product product = productService.getProductById(id);
        model.addAttribute("product", product);
        return "booking";
    } 
    
    @GetMapping("/manageservice")
    public String manageservice( HttpSession session, 
    								@RequestParam(required = false) String status,
    								Model model) {
    	 Admin admin = (Admin) session.getAttribute("admin");

    	    if (admin == null) {
    	        model.addAttribute("errorMessage", "You need to log in as an admin to access the dashboard.");
    	        return "redirect:/admin"; // Redirect to admin login if not logged in
    	    }

    	    model.addAttribute("products", productService.getAllProducts());

        return "/manageservice"; // JSP page
    }
    


    @PostMapping("/products/save")
    public String saveOrUpdateProduct(
            @RequestParam(required = false) Long id,  // Product ID (optional for new products)
            @RequestParam String name,
            @RequestParam String description,
            @RequestParam double price,
            @RequestParam int discount,
            @RequestParam Long categoryId,  // Category ID from form
            @RequestParam MultipartFile image,
            HttpServletRequest request) {

        Product product;

        // Check if we are updating an existing product or creating a new one
        if (id != null && productRepository.existsById(id)) {
            product = productRepository.findById(id).orElse(new Product());
        } else {
            product = new Product();  // Creating a new product
        }

        // Set the product fields
        product.setName(name);
        product.setDescription(description);
        product.setPrice(price);
        product.setDiscount(discount);

        // Set the category from the categoryId parameter
        Category category = categoryRepository.findById(categoryId)
            .orElseThrow(() -> new IllegalArgumentException("Invalid category ID"));
        product.setCategory(category);  // Set the category for the product

        try {
            // Save the product along with the uploaded image
            productService.saveProduct(product, image);
        } catch (IOException e) {
            e.printStackTrace();
            return "error";  // Return error view in case of failure
        }

        return "redirect:/manageservice";  // Redirect to the product management page
    }


    
    
    @GetMapping("/products/add")
    public String showAddProductForm(Model model) {
        model.addAttribute("product", new Product());
        List<Category> categories = categoryService.getAllCategories();
        model.addAttribute("categories", categories);
        return "editproduct"; // Ensure this matches your JSP/HTML template name
    }


    @GetMapping("/products/edit/{id}")
    public String showEditProductForm(@PathVariable Long id, Model model) {
        Product product = productService.getProductById(id);
        model.addAttribute("product", product);
        List<Category> categories = categoryService.getAllCategories();
        model.addAttribute("categories", categories);
        return "editproduct";
    }

    @GetMapping("/products/delete/{id}")
    public String deleteProduct(@PathVariable Long id) {
        productService.deleteProduct(id);
        return "redirect:/manageservice";
    }
    


    
}
