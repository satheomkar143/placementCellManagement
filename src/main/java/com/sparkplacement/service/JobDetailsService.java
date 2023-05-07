package com.sparkplacement.service;

import java.util.List;

import com.sparkplacement.model.JobDetails;

public interface JobDetailsService {
	
//	get all job description
	List<JobDetails> getAllJobDetails();
	
//	save new job details
	JobDetails saveJobDetails(JobDetails jobDetails);
	
//	get job info by id
	JobDetails getJobDetailsById(long id);
	
//	delete job details by id
	void deleteJobDetailsById(long id);
	
//	update job details
	JobDetails updateJobDetails(JobDetails jobDetails);
	
//  search job by fields	
	List<JobDetails> findJobByFields(String keyword1, String keyword2, String keyword3);
	
//	search job by technology
	List<JobDetails> findJobByTechnology(String tech);
	
//	search job by location
	List<JobDetails> findJobByLocation(String location);
}
