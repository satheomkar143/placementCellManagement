package com.sparkplacement.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sparkplacement.model.Post;

public interface PostRepository extends JpaRepository<Post, Integer>{

	Post findByImageContaining(String image);
	
}
