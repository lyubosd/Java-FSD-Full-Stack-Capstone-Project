package com.medicare.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "products")
public class Product {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long pid;

	@NotBlank(message = "name cannot be blank")
	private String name;

	@NotBlank(message = "brand cannot be blank")
	private String brand;

	@NotBlank(message = "category cannot be blank")
	private String category;

	@NotBlank(message = "description cannot be blank")
	private String description;

	@NotNull(message = "available cannot be null")
	private int totalAvailable;

	@NotNull(message = "price cannot be null")
	private Double price;

	@NotNull(message = "isAvailable cannot be null")
	private boolean isAvailable;

	public Product() {
		super();
	}

	public Product(Long pid, String name, String brand, String category, String description, String salt,
			int totalAvailable, Double price, boolean isAvailable) {
		super();
		this.pid = pid;
		this.name = name;
		this.brand = brand;
		this.category = category;
		this.description = description;
		this.totalAvailable = totalAvailable;
		this.price = price;
		this.isAvailable = isAvailable;
	}

	public Long getPid() {
		return pid;
	}

	public void setPid(Long pid) {
		this.pid = pid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getTotalAvailable() {
		return totalAvailable;
	}

	public void setTotalAvailable(int totalAvailable) {
		this.totalAvailable = totalAvailable;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public boolean isAvailable() {
		return isAvailable;
	}

	public void setAvailable(boolean isAvailable) {
		this.isAvailable = isAvailable;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
