package com.ejada.springbootecommerce.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ejada.springbootecommerce.dao.RoleRepository;
import com.ejada.springbootecommerce.entity.Role;

@Service
public class RoleService {

	@Autowired
    private RoleRepository roleDao;

    public Role createNewRole(Role role) {
        return roleDao.save(role);
    }
}
