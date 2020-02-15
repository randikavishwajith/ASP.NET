<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="ProjectTest.LogIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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

        .auto-style1 {
            font-size: xx-large;
            text-align: center;
            position: absolute;
	        left: 43%;
            top: 20%;
        }
        .auto-style2 {
            width: 100%;
            height: 215px;
            position: absolute;
	        left: 28%;
            top: 30%;
        }
        .auto-style3 {
            width: 267px;
            height: 39px;
        }
        .auto-style5 {
            width: 231px;
        }
        .auto-style6 {
            color: #660066;
            background-color: #FFCC00;
        }
        .auto-style7 {
            width: 267px;
            text-align: right;
            color: #660066;
        }
        .auto-style8 {
            font-weight: bold;
            font-size: x-large;
            font-family: "Times New Roman", Times, serif;
            font-style: italic;
            margin-left: 0px;
        }
        .auto-style10 {
            width: 267px;
            text-align: right;
            color: #660066;
            font-size: large;
            font-family: Arial, Helvetica, sans-serif;
        }
        .auto-style11 {
            font-size: large;
        }
        .auto-style12 {
            font-weight: normal;
        }
        .auto-style13 {
            width: 231px;
            height: 22px;
            font-size: large;
        }
        .auto-style14 {
            height: 39px;
        }

        .auto-style18 {
            font-size: x-large;
        }
        .auto-style19 {
            width: 231px;
            height: 39px;
            text-align: left;
        }
        .auto-style20 {
            width: 267px;
            height: 22px;
        }
        .auto-style21 {
            height: 22px;
        }
        .auto-style22 {
            text-align: right;
            font-family: Arial, Helvetica, sans-serif;
        }
        .auto-style23 {
            width: 231px;
            text-align: left;
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

        #cont{
            height: 100vh;
            width: 100%;
            background-image: url(Images/en.jpg);
        }

    </style>
</head>
<body >
        <div class="nav-bar">
            <img src="Images\logo.png"/>
            <ul>
                <li><a href="Home.aspx">Home</a></li>
                <li><a href="About.aspx">About Us</a></li>
                <li><a href="Contact.aspx">Contact Us</a></li>
                <li><a href="Login.aspx">Login</a></li>
                <li><a href="SignUp.aspx">SignUp</a></li>
            </ul>
            <h1>Green Task Force</h1>
        </div>
    <div id="cont">
    <form id="form1" runat="server">
        <div class="auto-style1">
            &nbsp;<strong><span class="auto-style6">Login Page</span></strong></div>
        <table class="auto-style2">
            <tr>
                <td class="auto-style10"><strong>User Name</strong><strong class="auto-style12"><strong>:</strong></strong></td>
                <td class="auto-style23">
                    <asp:TextBox ID="TextBoxUN" runat="server" Width="180px" OnTextChanged="TextBoxUN_TextChanged"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxUN" ErrorMessage="Please enter Email" ForeColor="Red" CssClass="auto-style11"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style7"></td>
                <td class="auto-style5">
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td class="auto-style10"><strong class="auto-style12"><strong>Password:</strong></strong></td>
                <td class="auto-style23">
                    <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password" Width="180px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxPassword" ErrorMessage="Please enter Password" ForeColor="Red" CssClass="auto-style11"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style22">
                    <strong>Remember Me:

                </strong>

                </td>
                <td>
                    <asp:CheckBox ID="ChkMe" runat="server" />

                </td>
            </tr>
            <tr>
                <td class="auto-style3"></td>
                <td class="auto-style19">
                    <asp:Button ID="Button_Login" runat="server" OnClick="Button_Login_Click" Text="Login" Width="106px" Height="35px" CssClass="auto-style8" />
                </td>
            </tr>
            <tr>
                <td class="auto-style20"></td>
                <td class="auto-style13">
                    <strong>If you aren&#39;t signed in to the GTF, please sign up </strong>
                </td>
                <td class="auto-style21"></td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style19">
                    &nbsp;</td>
                <td class="auto-style14">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <br />
                </td>
                <td class="auto-style14"></td>
            </tr>
        </table>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </form>
    </div>
</body>
</html>
