package com.ejada.springbootecommerce.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ejada.springbootecommerce.entity.Role;


public interface RoleRepository extends JpaRepository<Role, String>{

}
