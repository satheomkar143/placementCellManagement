package com.sparkplacement.service;

import java.util.List;

import com.sparkplacement.model.Enquiry;

public interface EnquiryService {

//	get all enquiries
	List<Enquiry> getAllEnquiry();

//	save new Enquiry
	Enquiry saveEnquiry(Enquiry enquiry);

//	get Enquiry by id
	Enquiry getEnquiry(long id);

//	delete Enquiry y id
	void deleteEnquiry(long id);
}
