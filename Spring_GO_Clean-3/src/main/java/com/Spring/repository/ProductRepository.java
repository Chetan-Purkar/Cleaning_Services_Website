package com.Spring.repository;

import com.Spring.model.Category;
import com.Spring.model.Product;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductRepository extends JpaRepository<Product, Long> {
	 List<Product> findByCategory(Category category);
}
