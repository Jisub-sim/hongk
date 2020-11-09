<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<style>
    /* @import url("https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"); */
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }
    body {
    
      font-family: "Noto Sans KR", sans-serif;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      background: url(resources/img/building.jpg) no-repeat center;
      background-size: cover;
    }

    body::before {
      content: "";
      position: absolute;
      z-index: 1;
      top: 0;
      right: 0;
      bottom: 0;
      left: 0;
      background-color: rgba(0, 0, 0, 0.5);
    }
    .login-form {
      position: relative;
      z-index: 2;
    }
    .login-form h1 {
      font-size: 62px;
      color: white;
      text-align: center;
      margin-bottom: 60px;
    }
    .int-area {
      width: 400px;
      position: relative;
      margin-top: 20px;
    }

    .int-area:first-child {
      margin-top: 0;
    }
    .int-area input {
      width: 100%;
      padding: 20px 10px 10px;
      background-color: transparent;
      border: none;
      border-bottom: 1px solid white;
      font-size: 18px;
      color: #fff;
      outline: none;
    }

    .int-area label {
      position: absolute;
      left: 10px;
      top: 15px;
      font-size: 18px;
      color: white;
      transition: all 0.5 ease;
    }
    .int-area label.warning {
      color: red !important;
      animation: warning 0.3s ease;
      animation-iteration-count: 3;
    }
    @keyframes warning {
      0% {
        transform: translateX(-8px);
      }
      25% {
        transform: translateX(8px);
      }
      50% {
        transform: translateX(-8px);
      }
      75% {
        transform: translateX(8px);
      }
    }
    .int-area input:focus + label,
    .int-area input:valid + label {
      top: -2px;
      font-size: 13px;
      color: yellow;
    }

    .btn-area {
      margin-top: 30px;
    }
    .btn-area button {
      width: 100%;
      height: 50px;
      background: blue;
      color: #fff;
      font-size: 20px;
      border: none;
      border-radius: 25px;
      cursor: pointer;
    }

    .caption {
      margin-top: 20px;
      text-align: center;
    }

    .caption a {
      font-size: 15px;
      color: white;
      text-decoration: none;
    }
  </style>
  <body>
    <section class="login-form">
      <h1>HONGK</h1>
       <c:if test="${ empty sessionScope.loginUser }">
     	<form action="login.do" method="post">
        <div class="int-area">
          <input type="text" name="mId" id="id" autocomplete="off" required />
          <label for="id">USER ID</label>
        </div>
        <div class="int-area">
          <input
            type="password"
            name="mPwd"
            id="pw"
            autocomplete="off"
            required
          />
          <label for="pw">PASSWORD</label>
        </div>
        <div class="btn-area">
          <button id="btn"  onclick="document.forms[0].submit();return false;">LOGIN</button>
          	 <!-- <button href=""id="login_btn">LOGIN</button> -->
        </div>
       </form>
        </c:if>
      <div class="caption">
        <a href="">Forgot password?</a>
      </div>
    </section>

     <script>
    

      $(btn).on("click", function () {
    	  var id = $("#id");
    	  var pw = $("#pw");
    	  var btn = $("#btn");
        if ($(id).val() == "") {
          $(id).next("label").addClass("warning");
          setTimeout(function () {
            $("label").removeClass("warning");
          }, 1500);
        } else if ($(pw).val() == "") {
          $(pw).next("label").addClass("warning");
          setTimeout(function () {
            $("label").removeClass("warning");
          }, 1500);
        }
      });
    </script>
</body>
</html>