<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
      crossorigin="anonymous"
    />

    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
      integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />

    <style>
      html {
        font-size: 10px;
      }
      body {
        background-color: aqua;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        background-image: linear-gradient(
            to right,
            rgba(0, 0, 0, 0.5),
            rgba(0, 0, 0, 0.5)
          ),
          url("/public/images/errorBody.jpg");
        background-size: cover;
        font-family: "Ubuntu", sans-serif;
      }
      * {
        padding: 0;
        margin: 0;
        box-sizing: border-box;
      }
      .errorDiv {
        width: 80%;
        min-height: 90vh;
        background-position: right;
        border-radius: 15px;
        background-repeat: no-repeat;
        /* border: 1px solid white; */
        color: white;
        text-align: center;
      }
      .errorH1 {
        font-size: 10rem;
        font-weight: bolder;
      }
      .somethingWrong {
        font-size: 5rem;
        margin-bottom: 20px;
      }
      .expMsg {
        font-size: 3rem;
        margin-bottom: 20px;
      }
      button {
        font-size: 2.5rem;
        padding: 5px 20px;
				border-radius: 10px;
				font-weight: bolder;
				background-color: rgb(89, 219, 241);				
      }
			button:hover{
				background-color: rgb(19, 224, 173);	
				font-size: 2.7rem;			
			}
      .animate-color {
        animation: color-animation 3s linear infinite;
      }

      @keyframes color-animation {
        0% {
          color: rgb(234, 243, 200);
        }
        30% {
          color: rgb(164, 239, 245);
        }
        70% {
          color: rgb(141, 240, 157);
        }
      }
    </style>

    <title>Something Went Wrong</title>
  </head>
  <body>
    <div class="errorDiv">
      <h1 class="errorH1 animate-color">Error 500</h1>
      <hr />
      <hr />
      <h1 class="somethingWrong">something went wrong</h1>
      <!-- <h2 class="expMsg">${exception.getMessage()}</h2> -->
      <h2 class="expMsg">${msg}</h2>
      <hr><hr>
      <button onclick="goBack()">Go Back</button>
    </div>

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
      crossorigin="anonymous"
    ></script>

		<script>
			function goBack() {
					window.history.back();
			}
			</script>	
  </body>
</html>

