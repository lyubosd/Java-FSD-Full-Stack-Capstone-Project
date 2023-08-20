package com.medicare.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.medicare.entities.User;
import com.medicare.repo.ClientRepo;

@Service
public class ClientDetailService implements UserDetailsService {

	@Autowired
	private ClientRepo clientRepo;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User user = this.clientRepo.findByUsername(username);
		if (user == null) {
			System.out.println("Client not found!");
			throw new UsernameNotFoundException("Client does not exist!");
		}
		return user;
	}

}
