package com.sparkplacement.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sparkplacement.model.Enquiry;
import com.sparkplacement.repository.EnquiryRepository;
import com.sparkplacement.service.EnquiryService;

@Service
public class EnquiryServiceImpl implements EnquiryService{

	@Autowired
	private EnquiryRepository enquiryRepository;
	
	@Override
	public List<Enquiry> getAllEnquiry() {
		return enquiryRepository.findAll();
	}

	@Override
	public Enquiry saveEnquiry(Enquiry enquiry) {
		return enquiryRepository.save(enquiry);
	}

	@Override
	public Enquiry getEnquiry(long id) {
		return enquiryRepository.findById(id).get();
	}

	@Override
	public void deleteEnquiry(long id) {
		enquiryRepository.deleteById(id);
	}

}
