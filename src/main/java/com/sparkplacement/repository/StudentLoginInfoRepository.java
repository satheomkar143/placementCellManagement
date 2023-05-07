package com.sparkplacement.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sparkplacement.model.StudentLoginInfo;

public interface StudentLoginInfoRepository extends JpaRepository<StudentLoginInfo, Integer> {

}
