package com.sparkplacement.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sparkplacement.model.JobDetails;

public interface JobDetailsRepository extends JpaRepository<JobDetails, Long>{

    List<JobDetails> findByPositionContainingOrLocationContainingOrJobTypeContaining(String position, String location, String jobType);
    
    List<JobDetails> findByPositionContaining(String position);

    List<JobDetails> findByLocationContaining(String location);

}
