package com.ejada.springbootecommerce.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ejada.springbootecommerce.entity.User;


public interface UserRepository extends JpaRepository<User, String>{

}
