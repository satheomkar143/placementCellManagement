package com.sparkplacement.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sparkplacement.model.Admin;

public interface AdminRepository extends JpaRepository<Admin, Integer>{

	Admin findByEmail(String email);
}
