package com.sparkplacement.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sparkplacement.model.Post;
import com.sparkplacement.repository.PostRepository;
import com.sparkplacement.service.PostService;

@Service
public class PostServiceImpl implements PostService{
	
	@Autowired
	private PostRepository postRepository;

	@Override
	public Post findByImageName(String image) {
		return postRepository.findByImageContaining(image);
	}

	@Override
	public Post savePost(Post post) {
		return postRepository.save(post);
	}

	@Override
	public List<Post> getAllPost() {
		return postRepository.findAll();
	}

}
