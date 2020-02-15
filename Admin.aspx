<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="ProjectTest.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin</title>
    <link rel="shortcut icon" href="Images/logo_vrr_icon.ico" />
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBMTMkX170gFTuxAwLcvIx2rnV-ZM6zGoI"></script>
    <style>
        body {
            margin: 0;
            padding: 0;
        }

        .Container {
            height: 180vh;
            width: 100%;
            background-image: url(Images/en.jpg);
            background-attachment: fixed;
            background-size: cover;
            background-position: center;
        }

        .nav-bar {
            width: 100%;
            background-color: #000000;
            overflow: auto;
            opacity: 0.7;
        }

            .nav-bar h1 {
                font-family: Arial, Helvetica, sans-serif;
                font-size: 40px;
                color: #73e600;
                text-align: center;
                float: right;
                padding-right: 800px;
            }

            .nav-bar img {
                float: left;
                padding-left: 20px;
                width: 85px;
                height: 85px;
            }

        .main {
            background-color: transparent;
            width: 85%;
            margin: 0 auto;
            height: 100%;
            padding-top: 60px;
        }

        #tabs {
            list-style-type: none;
            padding: 0;
            margin: 0;
            position: relative;
        }

            #tabs li {
                float: left;
            }

                #tabs li > input {
                    display: none;
                }

                #tabs li > label {
                    display: inline-block;
                    border: 1px solid #000;
                    border-right-width: 0;
                    border-bottom-width: 0;
                    height: 30px;
                    line-height: 30px;
                    padding: 5px 20px;
                    cursor: pointer;
                }

                #tabs li:last-child > label {
                    border-right-width: 1px;
                }

            #tabs .tab-content {
                display: none;
                position: absolute;
                left: 0;
                padding: 20px;
                border: 1px solid #000;
                width: 1220px;
                height: 700px;
                overflow-y: scroll;
            }

            #tabs li > input:checked + label {
                background-color: #ddd;
            }

            #tabs li > input:checked ~ .tab-content {
                display: block;
            }

            #tabs:after {
                content: "";
                clear: both;
                display: block;
                height: 200px;
            }

        #main {
            text-align: center;
            padding-left: 200px;
        }

        #Label_Welcome {
            font-size: 25px;
            color: White;
            font-family: Arial, sans-serif;
            font-weight: bold;
        }

        #btn {
            float: right;
            padding-top: 20px;
            padding-right: 10px;
        }

        #Logout {
            border-radius: 15px;
        }
    </style>
</head>
<body>

    <div class="Container">
        <form id="form2" method="POST" runat="server">
            <div class="nav-bar">
                <div id="btn">
                    <asp:Label ID="Label_Welcome" runat="server" Text="Welcome! "></asp:Label>
                    <br />
                    <asp:Button ID="Logout" runat="server" OnClick="Logout_Click" Text="Logout" />
                </div>
                <h1>Green Task Force</h1>
                <img src="Images/logo.png" />
            </div>
            <div class="main">

                <div id="main">
                    <div id="container">
                        <div id="tabsd">
                            <ul id="tabs">
                                <li>
                                    <input type="radio" name="tabs" id="tab-1" checked="checked" />
                                    <label for="tab-1">MEMBER/CAPTAIN</label>
                                    <div class="tab-content">
                                        <div id="Grid">
                                            <asp:GridView ID="GridView" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" ShowHeaderWhenEmpty="True"
                                                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" CssClass="auto-style1" HorizontalAlign="Center" OnRowCommand="GridView_RowCommand">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Member/Captain">
                                                        <ItemTemplate>
                                                            <div style="width: 190px; overflow: hidden; text-overflow: ellipsis">
                                                                <asp:Label ID="UserStat" Text='<%# Eval("UserStat") %>' runat="server" />
                                                            </div>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <div style="width: 190px; overflow: hidden; text-overflow: ellipsis">
                                                                <asp:TextBox ID="txtUserStatFooter" runat="server" />
                                                            </div>
                                                        </FooterTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="First Name">
                                                        <ItemTemplate>
                                                            <div style="width: 190px; overflow: hidden; text-overflow: ellipsis">
                                                                <asp:Label ID="FirstName" Text='<%# Eval("FirstName") %>' runat="server" />
                                                            </div>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <div style="width: 190px; overflow: hidden; text-overflow: ellipsis">
                                                                <asp:TextBox ID="txtFirstNameFooter" runat="server" />
                                                            </div>
                                                        </FooterTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Last Name">
                                                        <ItemTemplate>
                                                            <div style="width: 190px; overflow: hidden; text-overflow: ellipsis">
                                                                <asp:Label ID="LastName" Text='<%# Eval("LastName") %>' runat="server" />
                                                            </div>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <div style="width: 190px; overflow: hidden; text-overflow: ellipsis">
                                                                <asp:TextBox ID="txtLastNameFooter" runat="server" />
                                                            </div>
                                                        </FooterTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Email">
                                                        <ItemTemplate>
                                                            <div style="width: 190px; overflow: hidden; text-overflow: ellipsis">
                                                                <asp:Label ID="Email" Text='<%# Eval("Email") %>' runat="server" />
                                                            </div>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <div style="width: 190px; overflow: hidden; text-overflow: ellipsis">
                                                                <asp:TextBox ID="txtEmailFooter" runat="server" />
                                                            </div>
                                                        </FooterTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Gender">
                                                        <ItemTemplate>
                                                            <div style="width: 190px; overflow: hidden; text-overflow: ellipsis">
                                                                <asp:Label ID="Gender" Text='<%# Eval("Gender") %>' runat="server" />
                                                            </div>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <div style="width: 190px; overflow: hidden; text-overflow: ellipsis">
                                                                <asp:TextBox ID="txtGenderFooter" runat="server" />
                                                            </div>
                                                        </FooterTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="City">
                                                        <ItemTemplate>
                                                            <div style="width: 190px; overflow: hidden; text-overflow: ellipsis">
                                                                <asp:Label ID="City" Text='<%# Eval("City") %>' runat="server" />
                                                            </div>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <div style="width: 190px; overflow: hidden; text-overflow: ellipsis">
                                                                <asp:TextBox ID="txtCityFooter" runat="server" />
                                                            </div>
                                                        </FooterTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Mobile">
                                                        <ItemTemplate>
                                                            <div style="width: 190px; overflow: hidden; text-overflow: ellipsis">
                                                                <asp:Label ID="Mobile" Text='<%# Eval("Mobile") %>' runat="server" />
                                                            </div>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <div style="width: 190px; overflow: hidden; text-overflow: ellipsis">
                                                                <asp:TextBox ID="txtMobileFooter" runat="server" />
                                                            </div>
                                                        </FooterTemplate>
                                                    </asp:TemplateField>

                                                    <asp:ButtonField ButtonType="Image" HeaderText="Make Captain" ImageUrl="/Images/check-mark.png" Text="Make Captain" CommandName="make" />
                                                    <asp:ButtonField ButtonType="Image" HeaderText="Remove Captain" ImageUrl="/Images/cancel-mark.png" Text="Remove Captain" CommandName="remove" />

                                                </Columns>
                                                <FooterStyle BackColor="White" ForeColor="#000066" />
                                                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                                                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="NotSet" />
                                                <RowStyle ForeColor="#000066" />
                                                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                <SortedDescendingHeaderStyle BackColor="#00547E" />
                                            </asp:GridView>
                                            <br />
                                            <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label>
                                            <br />
                                            <asp:Label ID="SuccMes" Text="" runat="server" ForeColor="Green" />
                                            <br />
                                            <asp:Label ID="ErrorMes" Text="" runat="server" ForeColor="Red" />
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <input type="radio" name="tabs" id="tab-2" />
                                    <label for="tab-2">WRITE ARTICLES</label>
                                    <div class="tab-content">
                                        <br />
                                        <h3 id="arthead">Enter Artical Heading: </h3>
                                        <asp:TextBox ID="head" runat="server" multiline="true"></asp:TextBox>
                                        <br />
                                        <br />
                                        <h3 id="arttext">Write Your Article Here: </h3>
                                        <textarea id="textt" runat="server" cols="150" rows="15"></textarea>
                                        <br />
                                        <br />
                                        <h3 id="UploadImage">Upload Image: </h3>
                                        <asp:FileUpload ID="FileUpload" runat="server" />
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                        <asp:Button ID="Subart" runat="server" Text="Submit" OnClick="Subart_Click" />
                                        <br />
                                        <br />
                                        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Articles]"></asp:SqlDataSource>
</body>
</html>
