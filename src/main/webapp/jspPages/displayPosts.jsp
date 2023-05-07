<%@page import="java.util.Collections"%>
<%@page import="com.sparkplacement.model.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.sparkplacement.model.StudentLoginInfo"%>
<link rel="stylesheet" href="/public/css/displayPosts.css">

<div id="displayPostsDiv" >
  <div id="createPost">
    <div class="loader"></div>
    <input type="text" placeholder="create new post" data-bs-toggle="modal" data-bs-target="#newPostModal">
  </div>
  
  <% List<Post> allPost = (List<Post>) request.getAttribute("allPost");   
  	Collections.reverse(allPost);
  %>
  
<%--   <%= "post: "+ allPost %> --%>
  <% for(Post post : allPost){ %>
  
  <div class="endividualPost">
    <div class="postHeader">
      <div>	
      
   	   <%	if(post.getStudentInfo().getStudentData() != null && post.getStudentInfo().getStudentData().getPhoto() != null){  %>
			
  	  	  <img src="<%= post.getStudentInfo().getStudentData().getPhoto()%>" alt="id image" class="postProfileImg">
			
		<%	}else{ %>
			
    	  <img src="/public/images/userProfile.png" alt="id image" class="postProfileImg">
			
		<% }; %>	
      
      </div>
      <div class="userInfo">
        <h6><%= post.getStudentInfo().getStudentData().getFirstName() %> <%= post.getStudentInfo().getStudentData().getLastName() %></h6>
        <p><%= post.getStudentInfo().getStudentData().getCourse()%></p>
        <p><%= post.getDate()%></p>
      </div>
    </div>
    <hr>
    <h3><%= post.getTitle()%></h3>
    <hr>
    <div> <%= post.getDescription() %> </div>
    <hr>
    <div class="postImageDiv">
      <img src="<%= post.getImage() %>" alt="" class="postImg">
    </div>
  </div>
  
  <% }; %>

</div>



  

<!-- Modal -->
<div class="modal fade" id="newPostModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">New Post</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      <form action="/post/new/${loginStudent.getId()}" method="post" id="newPostForm" enctype="multipart/form-data">
      	<h3>Title</h3>
      	<div class="mb-3">
          <input class="form-control" type="text" name="title">
        </div>
        <h3>content</h3>
        <div class="form-floating">
          <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 100px" name="description"></textarea>
        </div>
        <div class="mb-3">
          <label for="formFile" class="form-label">select image</label>
          <input class="form-control" type="file" id="formFile" name="postImage">
        </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" onclick="submitNewPost()">Add Post</button>
      </div>
    </div>
  </div>
</div>



<script type="text/javascript">
//submit form

submitNewPost = ()=>{
  document.getElementById("newPostForm").submit();
}
</script>


