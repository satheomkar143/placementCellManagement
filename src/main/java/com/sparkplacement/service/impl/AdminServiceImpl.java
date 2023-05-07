package com.sparkplacement.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sparkplacement.model.Admin;
import com.sparkplacement.repository.AdminRepository;
import com.sparkplacement.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminRepository adminRepository;

	@Override
	public List<Admin> getAllAdmin() {
		return adminRepository.findAll();
	}

	@Override
	public Admin getAdmin(int id) {
		return adminRepository.findById(id).get();
	}

	@Override
	public Admin saveAdmin(Admin admin) {
		return adminRepository.save(admin);
	}

	@Override
	public void deleteAdmin(int id) {
		adminRepository.deleteById(id);
	}

	@Override
	public Admin updateAdmin(Admin admin) {
		return adminRepository.save(admin);
	}

	@Override
	public Admin getAdminByEmail(String email) {
		return adminRepository.findByEmail(email);
	}

}
