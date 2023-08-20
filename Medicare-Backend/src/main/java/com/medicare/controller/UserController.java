package com.medicare.controller;

import java.net.URI;
import java.util.HashSet;
import java.util.Set;

import javax.annotation.PostConstruct;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.medicare.entities.Role;
import com.medicare.entities.User;
import com.medicare.entities.UserRole;
import com.medicare.services.ClientService;

@RestController
@CrossOrigin(origins = "*")
public class UserController {

	@Autowired
	private ClientService clientService;

	// init admin user
	@PostConstruct
	public void createAdmin() {
		User admin = new User();
		admin.setUsername("lyubo@medicare.com");
		admin.setPassword("parola123");
		admin.setFirstName("Lyubo");
		admin.setLastName("Simeonov Dimitrov");
		admin.setContactNumber("621234567");
		Role role = new Role();
		role.setRoleId(101L);
		role.setRoleName("Administrator");
		UserRole ur = new UserRole();
		ur.setUser(admin);
		ur.setRole(role);
		Set<UserRole> userRole = new HashSet<>();
		userRole.add(ur);
		this.clientService.createUser(admin, userRole);
	}

	// create new user
	@PostMapping("/user/signup")
	public ResponseEntity<?> createNewUser(@Valid @RequestBody User user) {
		Role role = new Role();
		role.setRoleId(102L);
		role.setRoleName("Client");
		UserRole ur = new UserRole();
		ur.setUser(user);
		ur.setRole(role);
		Set<UserRole> userRole = new HashSet<>();
		userRole.add(ur);
		if (this.clientService.getByUsername(user.getUsername()) != null) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
		} else {
			User newUser = this.clientService.createUser(user, userRole);
			URI location = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}")
					.buildAndExpand(newUser.getUserId()).toUri();
			return ResponseEntity.created(location).build();
		}
	}

}
