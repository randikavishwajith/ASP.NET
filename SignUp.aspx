<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="ProjectTest.SignUp" %>

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
            width: 40%;
            left: 31%;
            top: 30%;
            position:absolute;
        }

        .auto-style5 {
            width: 80px;
            font-size: large;
            font-weight: bold;
        }

        .auto-style6 {
            text-align: center;
            color: #660066;
            font-size: xx-large;
        }

        .auto-style9 {
            background-color: #FFCC00;
            top: 21%;
            left: 45%;
        }

        .auto-style10 {
            width: 260px;
            height: 26px;
        }

        .auto-style14 {
            width: 203px;
            height: 26px;
        }

        .auto-style15 {
            height: 26px;
        }

        .auto-style22 {
            width: 260px;
            text-align: right;
            height: 28px;
            font-family: Arial, Helvetica, sans-serif;
        }

        .auto-style23 {
            width: 203px;
            height: 28px;
            text-align: center;
        }

        .auto-style24 {
            height: 28px;
        }

        .auto-style26 {
            width: 203px;
            height: 29px;
            text-align: center;
        }

        .auto-style27 {
            height: 29px;
        }

        .auto-style28 {
            width: 260px;
            text-align: right;
            color: #660066;
            height: 26px;
            font-size: large;
            font-family: Arial, Helvetica, sans-serif;
        }

        .auto-style29 {
            color: #660066;
            font-size: large;
            font-family: Arial, Helvetica, sans-serif;
        }

        .auto-style30 {
            font-size: large;
        }

        .auto-style31 {
            font-size: large;
            font-weight: bold;
        }

        .auto-style32 {
            font-size: large;
            font-family: Arial, Helvetica, sans-serif;
        }

        .auto-style33 {
            font-weight: normal;
        }

        .auto-style34 {
            width: 260px;
            height: 29px;
            text-align: right;
            font-family: Arial, Helvetica, sans-serif;
            color: #660066;
            font-size: large;
        }

        .auto-style35 {
            width: 203px;
            height: 26px;
            text-align: center;
        }

        .auto-style36 {
            width: 203px;
            height: 29px;
        }

        .auto-style37 {
            margin-left: 0px;
        }

        .auto-style38 {
            font-size: large;
            color: #FF0000;
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

        #cont{
            height: 100vh;
            width: 100%;
            background-image: url(Images/en.jpg);
            
        }

    </style>
</head>
<body>
    <div class="nav-bar">
        <img src="Images\logo.png" />
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
            <p class="auto-style6">
                <strong><span class="auto-style9">Sign up</span></strong>
            </p>
            <div>
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style28"><strong class="auto-style33"><strong>First Name:</strong></strong></td>
                        <td class="auto-style35">
                            <asp:TextBox ID="TextBox1FN" runat="server" Width="180px"></asp:TextBox>
                        </td>
                        <td class="auto-style15">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1FN" ErrorMessage="First Name is required" ForeColor="Red" CssClass="auto-style30"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style28"><strong class="auto-style33"><strong>Last Name:</strong></strong></td>
                        <td class="auto-style35">
                            <asp:TextBox ID="TextBox6LN" runat="server" Width="180px"></asp:TextBox>
                        </td>
                        <td class="auto-style15">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox6LN" ErrorMessage="Last Name is required" ForeColor="Red" CssClass="auto-style30"></asp:RequiredFieldValidator>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style22"><span class="auto-style29"><strong class="auto-style33"><strong>E-mail</strong></strong></span><span class="auto-style32"><strong>l:</strong></span></td>
                        <td class="auto-style23">
                            <asp:TextBox ID="TextBox2EMAIL" runat="server" Width="180px"></asp:TextBox>
                        </td>
                        <td class="auto-style24">
                            <asp:Label ID="Label1" runat="server" Text="Label" ForeColor="Red"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2EMAIL" ErrorMessage="E-mail is required" ForeColor="Red" CssClass="auto-style30"></asp:RequiredFieldValidator>
                            <br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox2EMAIL" ErrorMessage="You must enter the valid Email Id" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="auto-style30"></asp:RegularExpressionValidator>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style34"><strong>User Name:</strong></td>
                        <td class="auto-style26">
                            <asp:TextBox ID="TextBox7UN" runat="server" CssClass="auto-style37" Width="180px"></asp:TextBox>
                        </td>
                        <td class="auto-style27">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBox7UN" CssClass="auto-style38" ErrorMessage="User Name is required" ForeColor="Red"></asp:RequiredFieldValidator>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style28"><span class="auto-style29"><strong>Password</strong></span><span class="auto-style32"><strong>:</strong></span></td>
                        <td class="auto-style35">
                            <asp:TextBox ID="TextBox3PASS" runat="server" TextMode="Password" Width="180px"></asp:TextBox>
                        </td>
                        <td class="auto-style15">
                            <asp:Label ID="Label3" runat="server" Text="Label" ForeColor="Red"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3PASS" ErrorMessage="Password is required" ForeColor="Red" CssClass="auto-style30"></asp:RequiredFieldValidator>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style28"><strong class="auto-style33"><strong>Confirm Password:</strong></strong></td>
                        <td class="auto-style35">
                            <asp:TextBox ID="TextBox4RPASS" runat="server" TextMode="Password" Width="180px"></asp:TextBox>
                        </td>
                        <td class="auto-style15">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4RPASS" ErrorMessage="Confirm Password is required" ForeColor="Red" CssClass="auto-style30"></asp:RequiredFieldValidator>
                            <br />
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox3PASS" ControlToValidate="TextBox4RPASS" ErrorMessage="Both password must be same" ForeColor="Red" CssClass="auto-style30"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style34"><strong class="auto-style33"><strong>Gender:</strong></strong></td>
                        <td class="auto-style36">
                            <asp:RadioButtonList ID="RadioButtonList1Gend" runat="server" Width="180px">
                                <asp:ListItem>Male</asp:ListItem>
                                <asp:ListItem>Female</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td class="auto-style27">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="RadioButtonList1Gend" ErrorMessage="Select a Gender name" ForeColor="Red" InitialValue="Select Gender" CssClass="auto-style30"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style34"><strong class="auto-style33"><strong>Member/Staff:</strong></strong></td>
                        <td class="auto-style36">
                            <asp:RadioButtonList ID="RadioButtonList2US" runat="server" Width="180px">
                                <asp:ListItem>Member</asp:ListItem>
                                <asp:ListItem>Staff</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td class="auto-style27">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="RadioButtonList2US" ErrorMessage="Select Member/Staff" ForeColor="Red" InitialValue="Select Member/Staff" CssClass="auto-style30"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style28"><strong class="auto-style33"><strong>City:</strong></strong></td>
                        <td class="auto-style35">
                            <asp:TextBox ID="TextBox5City" runat="server" Width="180px"></asp:TextBox>
                        </td>
                        <td class="auto-style15">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox5City" ErrorMessage="City is required" ForeColor="Red" CssClass="auto-style30"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style28"><strong class="auto-style33"><strong>Mobile:</strong></strong></td>
                        <td class="auto-style35">
                            <asp:TextBox ID="TextBox6phone" runat="server" Width="180px"></asp:TextBox>
                        </td>
                        <td class="auto-style15">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TextBox6phone" ErrorMessage="Phone number is required" ForeColor="Red" CssClass="auto-style30"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style10"></td>
                        <td class="auto-style14">
                            <strong>
                                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" Width="80px" CssClass="auto-style31" />
                                <input id="Reset1" class="auto-style5" type="reset" value="reset" /></strong></td>
                        <td class="auto-style15"></td>
                    </tr>
                    <tr>
                        <td class="auto-style10"></td>
                        <td class="auto-style14"></td>
                        <td class="auto-style15"></td>
                    </tr>
                </table>
            </div>
            <p>
                &nbsp;
            </p>
            <asp:Label ID="Label2" runat="server" Text="Label" ForeColor="Green"></asp:Label>
        </form>
    </div>
</body>
</html>
