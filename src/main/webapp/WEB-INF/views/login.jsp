<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
  <head>
    <title>Login Page</title>
    <style>
      .error {
        padding: 15px;
        margin-bottom: 20px;
        border: 1px solid transparent;
        border-radius: 4px;
        color: #a94442;
        background-color: #f2dede;
        border-color: #ebccd1;
      }
      
      .msg {
        padding: 15px;
        margin-bottom: 20px;
        border: 1px solid transparent;
        border-radius: 4px;
        color: #31708f;
        background-color: #d9edf7;
        border-color: #bce8f1;
      }
      
      #login-box {
        width: 300px;
        padding: 20px;
        margin: 100px auto;
        margin-top: 10px;
        background: #fff;
        -webkit-border-radius: 2px;
        -moz-border-radius: 2px;
        border: 1px solid #000;
      }
    </style>
  </head>
  <body onload='document.loginForm.username.focus();'>
    
    <jsp:include page="menu.jsp" />
      
    <div id="login-box"> 
      <c:if test="${not empty hasError}">
        <div class="error">${hasError}</div>
      </c:if>
      <c:if test="${not empty errorMessage}">
        <div class="msg">${errorMessage}</div>
      </c:if>
      
      <form name='loginForm'
            action="./login" method='POST'>
        <input type="hidden" name="${_csrf.parameterName}"
               value="${_csrf.token}" />
        <table>
          <tr>
            <td>Username</td>
            <td><input type='text' name='username' value=''></td>
          </tr>
          <tr>
            <td>Password:</td>
            <td><input type='password' name='password' /></td>
          </tr>
          <tr>
            <td colspan='2'>
              <input name="submit" type="submit" value="submit" /></td>
          </tr>
        </table>
        
        
      </form>
    </div>
      
  </body>
</html>