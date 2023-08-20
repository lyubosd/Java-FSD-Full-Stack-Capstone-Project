package com.medicare.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.medicare.entities.Product;
import com.medicare.repo.ProductRepo;

@Service
public class ProductService {

	@Autowired
	private ProductRepo productRepo;

	public Product addProduct(Product product) {
		return this.productRepo.save(product);
	}

	public Product findProduct(Long pid) {
		return this.productRepo.findById(pid).get();
	}

	public List<Product> findAllProducts() {
		return this.productRepo.findAll();
	}

	public List<Product> findByName(String name) {
		List<Product> products = this.productRepo.findByNameContainingIgnoreCase(name);
		return products;
	}

	public List<Product> findProductByCategory(String category) {
		List<Product> products = this.productRepo.findByCategory(category);
		return products;
	}

	public void deleteProductById(Long pid) {
		this.productRepo.deleteById(pid);
	}

	public List<Product> findTrueProduct(String name) {
		List<Product> products = this.productRepo.findByNameAndIsAvailableTrue(name);
		return products;
	}
}
