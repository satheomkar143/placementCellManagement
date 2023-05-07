package com.sparkplacement.service;

import java.util.List;

import com.sparkplacement.model.Post;

public interface PostService {
	
//	save post
	Post savePost(Post post);

//	get post with image name
	Post findByImageName(String image);
	
//	get all post
	List<Post> getAllPost();

}
