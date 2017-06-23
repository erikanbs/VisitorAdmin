package com.remarkgroup.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.remarkgroup.model.User;
import com.remarkgroup.repository.UserRepository;

@Service
@Transactional
public class UserService {
	
	private final UserRepository userRepository;

	public UserService(UserRepository userRepository) {
		this.userRepository = userRepository;
	}
	
	public List<User> findAll() {
		List<User> emps = new ArrayList<>();
		for(User emp : userRepository.findAll()){
			emps.add(emp);
		}
		return emps;
	}

}