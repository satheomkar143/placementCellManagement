package com.sparkplacement.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sparkplacement.model.Enquiry;

public interface EnquiryRepository extends JpaRepository<Enquiry, Long>{

}
