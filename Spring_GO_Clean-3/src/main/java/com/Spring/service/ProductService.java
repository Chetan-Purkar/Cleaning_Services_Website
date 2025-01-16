package com.Spring.service;

import com.Spring.model.Category;
import com.Spring.model.Product;
import com.Spring.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@Service
public class ProductService {
    @Autowired
    private ProductRepository productRepository;

    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }
    
    public Product getProductById(Long id) {
        return productRepository.findById(id).orElse(null);
    }

    public List<Product> getProductsByCategory(Category category) {
        return productRepository.findByCategory(category);
    }
    
    
    @Value("${upload.path}")
    private String UPLOAD_DIR;

    public Product saveProduct(Product product, MultipartFile file) throws IOException {
        if (!file.isEmpty()) {
            // Create directory if it doesn't exist
            Path uploadPath = Paths.get(UPLOAD_DIR);
            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
            }

            // Save the file on the server
            String fileName = file.getOriginalFilename();
            Path filePath = uploadPath.resolve(fileName);
            Files.copy(file.getInputStream(), filePath);
            System.out.println(filePath);

            // Set the image URL (relative path for front-end usage)
            product.setImageUrl(fileName);
        }

        // Save product in the database
        return productRepository.save(product);
    }
    
    public void deleteProduct(Long id) {
        // Find the product by ID
        Product product = productRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Product not found"));

        // Get the image URL (relative path) and delete the image file from the server
        String imageUrl = product.getImageUrl();
        if (imageUrl != null && !imageUrl.isEmpty()) {
            Path imagePath = Paths.get(UPLOAD_DIR).resolve(imageUrl);
            try {
                Files.deleteIfExists(imagePath); // Delete the file
            } catch (IOException e) {
                e.printStackTrace();
                // Handle the exception (optional: log or notify)
            }
        }

        // Delete the product from the database
        productRepository.deleteById(id);
    }
    
}

