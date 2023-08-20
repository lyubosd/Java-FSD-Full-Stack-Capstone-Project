package com.medicare.services;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.medicare.entities.User;
import com.medicare.entities.UserRole;
import com.medicare.repo.RoleRepo;
import com.medicare.repo.ClientRepo;

@Service
public class ClientService {

	@Autowired
	private ClientRepo clientRepo;

	@Autowired
	private RoleRepo roleRepo;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	public User createUser(User user, Set<UserRole> userRole) {
		User newUser = this.clientRepo.findByUsername(user.getUsername());
		try {
			if (newUser != null) {
				throw new Exception("Username already exists!");
			} else {
				for (UserRole uR : userRole) {
					this.roleRepo.save(uR.getRole());
				}
				user.getUserRoles().addAll(userRole);

				user.setPassword(this.passwordEncoder.encode(user.getPassword()));

				newUser = this.clientRepo.save(user);

			}
		} catch (Exception e) {
			System.out.println("Client is already created!");
			System.out.println(e);
		}

		return newUser;
	}

	public User getByUsername(String username) {
		User user = this.clientRepo.findByUsername(username);
		return user;
	}

}
