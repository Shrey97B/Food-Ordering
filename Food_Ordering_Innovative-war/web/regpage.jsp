
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/bootstrap.css" />
        <link rel="stylesheet" type="text/css" href="css/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css/css/font-awesome.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <style>
            body{
                background-image: url('loginback.jpg');
            }
            .regf{
                background-color: rgba(255,255,255,0.9);
                width: 350px;
                margin-top: 50px;
                margin-bottom: 20px;
                margin-left: 37%;
                padding: 50px;
                border-radius: 20px;
                box-shadow: 5px 5px 20px 15px black;
            }
            
            #head1{
                margin: auto;
                font-size: 1.4em;
                font-weight: bolder;
            }
            
            form{
                
                border: 2px solid grey;
                border-radius: 12px;
                padding: 20px;
                
                
            }
            
            form input{
                margin-top: 10px;
                
            }
            label{
                font-size: 1.2em;
            }
            input[type = "text"], input[type="email"], input[type="password"]{
                border-radius: 10px;
                height: 20px;
                width: 80%;
                border: 2px solid grey;
                border-bottom: 2px solid black;
            }
            #subbt{
                border-radius: 10px;
                border-width: 0px 0px 2px;
                border-color: black;
                border-style: solid;
                height: 40px;
                margin-left: 30%;
                background-color: rgb(38, 0, 255);
            }
            
            #subbt:hover{
                background-color: rgb(110, 0, 255);
                height: 43px;
                width: 120px;
                box-shadow: 1px 1px 2px 2px black;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Page</title>
    </head>
    <body>
    <div class="regf">
        <center><p id="head1">Create your Account</p></center>
            <br>
            <form action="handlereg">
                <label>Enter your name: </label>
                <br>
                <input type="text" name="uname" pattern="^[a-zA-Z]+\s?[a-zA-Z]+$" required="required">
                <br>
                <br>
                <label>Enter your email: </label>
                <br>
                <input type="email" name="uemail" required="required">
                <br>
                <br>
                <label>Enter the username:</label>
                <br>
                <input type="text" name="usename" pattern="^[a-zA-Z\d@$]+$" required="required">
                <br>
                <br>
                <label>Enter the password:</label>
                <br>
                <input type="password" name="usepass" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required="required">
                <br>
                <br>
                <input type="submit" value="Create Account" class="btn btn-primary" id="subbt">
                <br>
                <br>
            </form>
        </div>
    </body>
</html>
