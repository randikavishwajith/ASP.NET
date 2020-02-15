<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="ProjectTest.About" %>

<!DOCTYPE html>
<html>
<head lang="en">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>About</title>
    <link rel="shortcut icon" href="Images/logo_vrr_icon.ico" />
    <style type="text/css">
        body {
            margin: 0;
            padding: 0;
        }

        .Header {
            width: 30%;
            margin: 0 auto;
            background-color: green;
        }

        .Container {
            height: 100vh auto;
            width: 100%;
            background-image: url(Images/en.jpg);
            background-attachment: fixed;
            background-size: cover;
            background-position: center center;
        }

        .nav-bar {
            width: 100%;
            background-color: #000000;
            overflow: auto;
            opacity: 0.7;
        }

            .nav-bar ul {
                list-style: none;
                float: right;
                padding-right: 50px;
            }

                .nav-bar ul li {
                    display: inline-block;
                    padding: 10px 15px;
                }

                    .nav-bar ul li a {
                        text-decoration: none;
                        color: #fff;
                        font-family: poppins;
                        text-transform: uppercase;
                        line-height: 50px;
                        padding: 0;
                    }

                        .nav-bar ul li a:hover {
                            background-color: transparent;
                            font-weight: bold;
                            border: 2px solid #bfff80;
                            border-radius: 100px;
                            padding: 10px 30px 10px 30px;
                        }

            .nav-bar h1 {
                font-family: Arial, Helvetica, sans-serif;
                font-size: 40px;
                color: #73e600;
                text-align: center;
                float: right;
                padding-right: 400px;
            }

            .nav-bar img {
                float: left;
                padding-left: 20px;
                width:85px;
                height:85px;
            }

        .main {
            padding-top:50px;
            background-color: transparent;
            width: 65%;
            margin: 0 auto;
            height: 100%;
            text-align: center;
        }

        .n{
            height:40%;
            width:60%;
        }

        .main h2{
            color:black;
            font-weight: bold;
            font-family: Arial, sans-serif;
        }
    </style>
</head>
<body>
    <div class="Container">
        <div class="nav-bar">
            <img src="Images\logo.png">
            <ul>
                <li><a href="Home.aspx">Home</a></li>
                <li><a href="About.aspx">About Us</a></li>
                <li><a href="Contact.aspx">Contact Us</a></li>
                <li><a href="Login.aspx">Login</a></li>
                <li><a href="SignUp.aspx">SignUp</a></li>
            </ul>
            <h1>Green Task Force</h1>
        </div>

        <div class="main">

            <img class="n" src="Images\123.jpg">
            <h2>We are a public division run by the Colombo Municipal Council.</h2>
            <img class="n" src="Images\1234x.jpg">
            <h2>The Public themselves can join us and keep the city green. You will be paid for been a staff member.</h2>
            <img class="n" src="Images\12345.jpg">
            <h2>While you all come together we will be giving eqiupment.</h2>
            <h2>Join us as a volunteer to tell us where the garbage are and become a staff member.</h2>

        </div>


    </div>

</body>
</html>
