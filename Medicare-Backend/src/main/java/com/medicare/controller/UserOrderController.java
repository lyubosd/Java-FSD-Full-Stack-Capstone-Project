package com.medicare.controller;

import java.text.DateFormat;
import java.util.Calendar;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.medicare.entities.CartItem;
import com.medicare.entities.CartOrder;
import com.medicare.entities.Product;
import com.medicare.entities.ProductQuantity;
import com.medicare.entities.UserOrder;
import com.medicare.services.ProductService;
import com.medicare.services.ClientOrderService;

@RestController
@CrossOrigin(origins = "*")
public class UserOrderController {

	@Autowired
	private ClientOrderService clientOrderService;

	@Autowired
	private ProductService productService;

	@PreAuthorize("hasAuthority('Client')")
	@PostMapping("/user/create/order")
	public ResponseEntity<?> createOrder(@Valid @RequestBody CartOrder cartOrder) {

		UserOrder userOrder = new UserOrder();
		userOrder.setUsername(cartOrder.getUsername());
		userOrder.setFirstName(cartOrder.getFirstName());
		userOrder.setLastName(cartOrder.getLastName());
		userOrder.setAddress(cartOrder.getAddress());
		userOrder.setDistrict(cartOrder.getDistrict());
		userOrder.setState(cartOrder.getState());
		userOrder.setContact(cartOrder.getContact());
		userOrder.setPinCode(cartOrder.getPinCode());

		DateFormat df = DateFormat.getDateInstance();
		Calendar cl = Calendar.getInstance();
		String orderDate = df.format(cl.getTime());
		userOrder.setDate(orderDate);
		userOrder.setStatus("PLACED");
		userOrder.setPaidAmount(cartOrder.getPaidAmount());
		userOrder.setPaymentMode(cartOrder.getPaymentMode());
		Set<CartItem> cartItems = cartOrder.getCartItem();
		Set<ProductQuantity> pq = new HashSet<>();
		for (CartItem item : cartItems) {
			Product product = this.productService.findProduct(item.getPid());
			int quantity = item.getQuantity();
			ProductQuantity productQuantity = new ProductQuantity();
			productQuantity.setProduct(product);
			productQuantity.setQuantity(quantity);
			this.clientOrderService.saveProductQuantity(productQuantity);
			pq.add(productQuantity);
		}

		userOrder.setProducts(pq);
		UserOrder orderCreated = this.clientOrderService.saveOrder(userOrder);
		return ResponseEntity.ok(orderCreated);
	}

	@PreAuthorize("hasAuthority('Administrator')")
	@GetMapping("/get/all/orders")
	public ResponseEntity<?> getAllOrders() {
		List<UserOrder> orders = this.clientOrderService.getAll();
		return ResponseEntity.ok(orders);
	}

	@PreAuthorize("hasAuthority('Client')")
	@GetMapping("/get/orders/{username}")
	public ResponseEntity<?> userOrders(@PathVariable("username") String username) {
		List<UserOrder> orders = this.clientOrderService.getUserOrders(username);
		if (orders.isEmpty()) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
		} else {
			return ResponseEntity.ok(orders);
		}
	}

	@PreAuthorize("hasAuthority('Client') or hasAuthority('Administrator')")
	@GetMapping("/get/order-invoice/{oid}")
	public ResponseEntity<?> getUserOrderById(@PathVariable("oid") Long oid) {
		UserOrder order = this.clientOrderService.getOrderById(oid);
		Set<ProductQuantity> products = order.getProducts();
		order.setProducts(products);
		return ResponseEntity.ok(order);
	}

	@PreAuthorize("hasAuthority('Administrator')")
	@DeleteMapping("/delete/order/{oid}")
	public ResponseEntity<?> deleteOrderById(@PathVariable("oid") Long oid) {
		this.clientOrderService.deleteOrder(oid);
		return ResponseEntity.status(HttpStatus.OK).build();
	}

}
