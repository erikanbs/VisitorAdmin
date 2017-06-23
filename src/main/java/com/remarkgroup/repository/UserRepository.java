package com.remarkgroup.repository;

import java.io.Serializable;

import org.springframework.data.repository.CrudRepository;

import com.remarkgroup.model.User;

public interface UserRepository extends CrudRepository<User, Serializable> {

}
