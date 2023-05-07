package com.sparkplacement.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sparkplacement.model.JobDetails;
import com.sparkplacement.repository.JobDetailsRepository;
import com.sparkplacement.service.JobDetailsService;

@Service
public class JobDetailsServiceImpl implements JobDetailsService{

	@Autowired
	private JobDetailsRepository jobDetailsRepository;
	
	@Override
	public List<JobDetails> getAllJobDetails() {
		return jobDetailsRepository.findAll();
	}

	@Override
	public JobDetails saveJobDetails(JobDetails jobDetails) {
		return jobDetailsRepository.save(jobDetails);
	}

	@Override
	public JobDetails getJobDetailsById(long id) {
		return jobDetailsRepository.findById(id).get();
	}

	@Override
	public void deleteJobDetailsById(long id) {
		jobDetailsRepository.deleteById(id);
	}

	@Override
	public JobDetails updateJobDetails(JobDetails jobDetails) {
		return jobDetailsRepository.save(jobDetails);
	}

	@Override
	public List<JobDetails> findJobByFields(String position, String location, String jobType) {
		
		return jobDetailsRepository.findByPositionContainingOrLocationContainingOrJobTypeContaining(position, location, jobType);
		
	}
	
	@Override
	public List<JobDetails> findJobByTechnology(String tech) {
		return jobDetailsRepository.findByPositionContaining(tech);
	}

	@Override
	public List<JobDetails> findJobByLocation(String location) {
		return jobDetailsRepository.findByLocationContaining(location);
	}
	
	

}
