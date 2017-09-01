package com.remarkgroup.repository;

import java.io.Serializable;
import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.remarkgroup.model.User;

public interface UserRepository extends CrudRepository<User, Serializable> {
	
	List<User> findAllByFullName(String name);

}
