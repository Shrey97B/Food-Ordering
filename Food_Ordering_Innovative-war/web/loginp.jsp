

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Form</title>
	<link rel="stylesheet" type="text/css" href="css/custom1.css">
	<link rel="stylesheet" type="text/css" href="css/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css/css/font-awesome.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <style>
        .container {
    display: block;
    position: relative;
    padding-left: 35px;
    margin-bottom: 12px;
    cursor: pointer;
    font-size: 22px;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
}

/* Hide the browser's default checkbox */
.container input {
    position: absolute;
    opacity: 0;
    cursor: pointer;
}

/* Create a custom checkbox */
.checkmark {
    position: absolute;
    top: 0;
    left: 0;
    height: 25px;
    width: 25px;
    background-color: #555;
}

/* On mouse-over, add a grey background color */
.container:hover input ~ .checkmark {
    background-color: #ccc;
}

/* When the checkbox is checked, add a blue background */
.container input:checked ~ .checkmark {
    background-color: #2196F3;
}

/* Create the checkmark/indicator (hidden when not checked) */
.checkmark:after {
    content: "";
    position: absolute;
    display: none;
}

/* Show the checkmark when checked */
.container input:checked ~ .checkmark:after {
    display: block;
}

/* Style the checkmark/indicator */
.container .checkmark:after {
    left: 9px;
    top: 5px;
    width: 5px;
    height: 10px;
    border: solid white;
    border-width: 0 3px 3px 0;
    -webkit-transform: rotate(45deg);
    -ms-transform: rotate(45deg);
    transform: rotate(45deg);
}
</style>
    </head>
    <body style="background-image: url('loginback.jpg');">
        <%
       if ((session.getAttribute("name") == null) || session.getAttribute("name") == ""){
      %>
         <div class="box">
     <div class="logo">
         <h3>LOGIN TO YOUR ACCOUNT</h3>
     </div>
         <form action="validLogin" method="post" name="lgf" class="form-horizontal">
             <div class="form-group" style="text-align: center;">
             <i class="fa fa-user" style="display: inline-block; font-size: 1.5em; margin-right: 10px; margin-left: 4px;"></i>
         
         <input type="text" name="usern" placeholder="Enter your username here..." class="form-control" style="border: 2px solid grey; border-radius: 10px; border-bottom: 2px solid purple; width: 80%; display: inline-block;">
         </div>
             
         <div class="form-group" style="text-align: center;">
         <i class="fa fa-lock" style="display: inline-block; font-size: 1.5em; margin-right: 5px; margin-left: 5px; margin-top: 0px;"></i>
         <input type="Password" name="passt" placeholder="Enter your password here..." class="form-control" style="border: 2px solid grey; border-radius: 10px; border-bottom: 2px solid purple; width: 80%; display: inline-block; margin-left: 30px;">
         </div>
             <div class="dropdown" style="text-align: center;">
                 <div class="bg-info" style="padding: 0px; display:inline-block;">User Type :</div>
                 <select name='usetype' class="btn btn-primary dropdown-toggle">
                      <option value="c">Customer</option>
                      <option value="s">Store Owner</option>
                  </select>
             </div>    
         <div class="butd">
         	<button class="btn btn-primary">LOGIN</button>
         </div>
               
           <br>
           <div >
           <label class="container" style="font-size: 1.2em; font-style: 'Helvetica';">Remember Username
            <input type="checkbox" name="rus">
            <span class="checkmark"></span>
           </label></div>
           
           
         <a href="regpage.jsp">Not Registered yet? Click here</a>    

                  </form>
             <script>
                <% 
                 Cookie[] ck = request.getCookies();
                 Cookie co;
                 String str="";
                 
                 if(ck!=null){
                     for (int i = 0; i < ck.length; i++) {
                        co = ck[i];
                        System.out.println(co.getName() + co.getValue());
                        if(co.getName().equals("userid")){
                            str = co.getValue();
                        }
                    }
                 }
                 
                 if(!str.equals("")){
                     System.out.println(str);
                 %>
                 
                    document.lgf.usern.value = '<%=str %>';
                 
                 <%
                 }
                
                  %>
             </script>
       
     </div>
         <%}
            else{
                if(session.getAttribute("type").equals("c")){
                    out.println("<script>window.location.href='dashbpage.jsp';</script>");
                }
                else{
                    out.println("<script>window.location.href='restdashpage.jsp';</script>");
                }
            }
         %>
    </body>
</html>
