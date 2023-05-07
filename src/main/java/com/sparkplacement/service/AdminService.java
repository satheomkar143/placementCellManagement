package com.sparkplacement.service;

import java.util.List;

import com.sparkplacement.model.Admin;

public interface AdminService {

//	get all admin
	List<Admin> getAllAdmin();

//	get admin by id
	Admin getAdmin(int id);
	
//	get admin by email
	Admin getAdminByEmail(String email);

//	save new admin
	Admin saveAdmin(Admin admin);

//	delete admin
	void deleteAdmin(int id);

//	update admin
	Admin updateAdmin(Admin admin);

}
