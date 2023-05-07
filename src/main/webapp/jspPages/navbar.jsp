<nav class="navbar">
  <div class="container-fluid">
    <div>
      <a><img src="/public/images/sparkLogo.png" alt="" id="sparkLogo" /></a>
      <!-- <button type="button" class="searchBtn ms-5" data-bs-toggle="modal" data-bs-target="#jobSearchModal">Search Job</button> -->
    </div>
    <div class="d-flex  text-center">
      <div
        class="menuItem"
        data-bs-toggle="modal"
        data-bs-target="#jobSearchModal"
      >
        <p><i class="fa-solid fa-magnifying-glass"></i></p>
        <p class="menuItemName">Search</p>
      </div>
      <div class="menuItem">
        <a href="/student/home/${loginStudent.getId() }">
          <p><i class="fa-solid fa-house"></i></p>
          <p class="menuItemName">Home</p>
        </a>
      </div>
      <div class="menuItem">
        <a href="/jobdetail">
          <p><i class="fa-solid fa-briefcase"></i></p>
          <p class="menuItemName">Jobs</p>
        </a>
      </div>
      <div
        class="menuItem"
        data-bs-toggle="modal"
        data-bs-target="#studentLoginModal"
      >
        <p><i class="fa-solid fa-user-tie"></i></p>
        <p class="menuItemName">Omkar</p>
      </div>
    </div>
  </div>
</nav>
<div style="height: 60px"></div>

<!-- Modal -->
<div
  class="modal fade"
  id="jobSearchModal"
  tabindex="-1"
  aria-labelledby="exampleModalLabel"
  aria-hidden="true"
>
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Search Job</h1>
        <button
          type="button"
          class="btn-close"
          data-bs-dismiss="modal"
          aria-label="Close"
        ></button>
      </div>
      <div class="modal-body">
        <div class="inputDiv" >
          <form action="/jobdetail/fields" method="post" id="searchForm">
          <input placeholder="Technology" type="text" class="modalInput" name="technology"/>
          <input placeholder="Location" type="text" class="modalInput" name="location"/>
          <input placeholder="Experience" type="text" class="modalInput" name="experience"/>
        </form>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" onclick="submitSearchForm()">Search</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal -->
<div
  class="modal fade"
  id="studentLoginModal"
  tabindex="-1"
  aria-labelledby="exampleModalLabel"
  aria-hidden="true"
>
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">
          ${loginStudent.getStudentData().getFirstName()} ${loginStudent.getStudentData().getLastName()}
        </h1>
        <button
          type="button"
          class="btn-close"
          data-bs-dismiss="modal"
          aria-label="Close"
        ></button>
      </div>
      <div class="modal-body d-flex justify-content-around">
        <h4 class="userProfileI"><i class="fa-solid fa-user-tie "></i><a href="/student/profile/${loginStudent.getId() }">view profile</a></h4>
        <h4 class="userProfileI"><i class="fa-solid fa-right-from-bracket "></i><a href="/student/logout">log out</a></h4>
      </div>
    </div>
  </div>
</div>

<% 
  String notificationMsg = (String) request.getAttribute("notificationMsg");

	if(notificationMsg != null){
%>

	<div class="notification">
	  <p><%= notificationMsg %></p>
	  <span class="notification_progress"></span>
	</div>

<%}; %>

<script>
  // submit search form
  submitSearchForm = ()=>{
    document.getElementById("searchForm").submit();
  }
</script>


