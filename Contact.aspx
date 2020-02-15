<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="ProjectTest.Contact" %>

<!DOCTYPE html>

<html>
<head lang="en">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Contact</title>
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
            height: 100vh;
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
                width: 85px;
                height: 85px;
            }

        .main {
            padding-top: 100px;
            background-color: transparent;
            width: 65%;
            margin: 0 auto;
            height: 100%;
            text-align: center;
        }

        #top {
            padding-bottom: 100px;
            padding-top:50px;
        }

        #bottom :hover {
            width: 200px;
            height: 200px;
        }
    </style>
</head>
<body>
    <div class="Container">
        <div class="nav-bar">
            <img src="Images/logo.png">
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
            <h1>We are willing to get any of your feedback, together lets make our district green.</h1>
            <div>
                <div id="top">
                    <img border="0" src="/Images/P.png" width="100" height="100">
                    <h1>+94 77 0186 150</h1>
                </div>
                <div id="bottom">
                    <a href="Contact.aspx">
                        <img border="0" src="Images/F.png" width="100" height="100">
                    </a>
                    <a href="Contact.aspx">
                        <img border="0" src="/Images/YT.png" width="100" height="100">
                    </a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
