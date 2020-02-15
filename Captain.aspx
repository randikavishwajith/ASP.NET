<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Captain.aspx.cs" Inherits="ProjectTest.Captain" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Captain</title>
     <link rel="shortcut icon" href="Images/logo_vrr_icon.ico" />
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBMTMkX170gFTuxAwLcvIx2rnV-ZM6zGoI"></script>
    <style>
        body {
            margin: 0;
            padding: 0;
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

            .nav-bar h1 {
                font-family: Arial, Helvetica, sans-serif;
                font-size: 40px;
                color: #73e600;
                text-align: center;
                float: right;
                padding-right: 600px;
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
            height: 100%
        }

        #GarbageMap {
            height: 700px;
            margin-top: 80px;
        }

        #Grid {
            overflow-y: scroll;
            height: 700px;
            margin: 70px auto;
        }

        .auto-style1 {
            margin-bottom: 0px;
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

        #Logout{
            border-radius: 15px;
        }
    </style>
</head>
<body>

    <div class="Container">
        <form id="form1" runat="server">
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
                    <div id="GarbageMap"></div>
                    <div id="Grid">
                        <asp:GridView ID="GridView" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" ShowHeaderWhenEmpty="True"
                            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" CssClass="auto-style1" HorizontalAlign="Center" OnRowCommand="GridView_RowCommand">
                            <Columns>
                                <asp:TemplateField HeaderText="Approval Status">
                                    <ItemTemplate>
                                        <div style="width: 190px; overflow: hidden; text-overflow: ellipsis">
                                            <asp:Label ID="approvlable" Text='<%# Eval("ApprovalStatus") %>' runat="server" />
                                        </div>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <div style="width: 190px; overflow: hidden; text-overflow: ellipsis">
                                            <asp:TextBox ID="txtApprovalStatus" runat="server" Text='<%# Eval("ApprovalStatus") %>' />
                                        </div>
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <div style="width: 190px; overflow: hidden; text-overflow: ellipsis">
                                            <asp:TextBox ID="txtApprovalStatusFooter" runat="server" />
                                        </div>
                                    </FooterTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Flag Status">
                                    <ItemTemplate>
                                        <div style="width: 190px; overflow: hidden; text-overflow: ellipsis">
                                            <asp:Label ID="flaglable" Text='<%# Eval("FlagStat") %>' runat="server" />
                                        </div>
                                    </ItemTemplate>

                                    <FooterTemplate>
                                        <div style="width: 190px; overflow: hidden; text-overflow: ellipsis">
                                            <asp:TextBox ID="txtFlagStatusFooter" runat="server" />
                                        </div>
                                    </FooterTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Location">
                                    <ItemTemplate>
                                        <div style="width: 190px; overflow: hidden; text-overflow: ellipsis">
                                            <asp:Label Text='<%# Eval("Location") %>' runat="server" />
                                        </div>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <div style="width: 190px; overflow: hidden; text-overflow: ellipsis">
                                            <asp:TextBox ID="txtLocationFooter" runat="server" />
                                        </div>
                                    </FooterTemplate>
                                </asp:TemplateField>


                                <asp:TemplateField HeaderText="Latitude">
                                    <ItemTemplate>
                                        <div style="width: 190px; overflow: hidden; text-overflow: ellipsis">
                                            <asp:Label Text='<%# Eval("Latitude") %>' runat="server" />
                                        </div>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <div style="width: 190px; overflow: hidden; text-overflow: ellipsis">
                                            <asp:TextBox ID="txtLatitudeFooter" runat="server" />
                                        </div>
                                    </FooterTemplate>
                                </asp:TemplateField>


                                <asp:TemplateField HeaderText="Longitude">
                                    <ItemTemplate>
                                        <div style="width: 190px; overflow: hidden; text-overflow: ellipsis">
                                            <asp:Label Text='<%# Eval("Longitude") %>' runat="server" />
                                        </div>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <div style="width: 190px; overflow: hidden; text-overflow: ellipsis">
                                            <asp:TextBox ID="txtLongitudeFooter" runat="server" />
                                        </div>
                                    </FooterTemplate>
                                </asp:TemplateField>


                                <asp:TemplateField HeaderText="Description">
                                    <ItemTemplate>
                                        <div style="width: 190px; overflow: hidden; text-overflow: ellipsis">
                                            <asp:Label Text='<%# Eval("Description") %>' runat="server" />
                                        </div>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <div style="width: 190px; overflow: hidden; text-overflow: ellipsis">
                                            <asp:TextBox ID="txtDescriptionFooter" runat="server" />
                                        </div>
                                    </FooterTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Image">
                                    <ItemTemplate>
                                        <div style="width: 190px; overflow: hidden; text-overflow: ellipsis">
                                            <img alt="" src='<%# Eval("Image") %>' runat="server" height="60" width="100" />
                                        </div>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <div style="width: 190px; overflow: hidden; text-overflow: ellipsis">
                                            <asp:TextBox ID="txtImageFooter" runat="server" />
                                        </div>
                                    </FooterTemplate>
                                </asp:TemplateField>

                                <asp:ButtonField AccessibleHeaderText="RED" ButtonType="Image" Text="RED" ImageUrl="/Images/red-icon.png" CommandName="Redmark">
                                    <ItemStyle Wrap="True" />
                                </asp:ButtonField>
                                <asp:ButtonField AccessibleHeaderText="GREEN" ButtonType="Image" Text="GREEN" ImageUrl="/Images/green-icon.png" CommandName="Greenmark"></asp:ButtonField>
                                <asp:ButtonField AccessibleHeaderText="APPROVE" ButtonType="Image" Text="APPROVE" ImageUrl="/Images/check-mark.png" CommandName="Apprv"></asp:ButtonField>
                                <asp:ButtonField AccessibleHeaderText="DISAPPROVE" ButtonType="Image" Text="DISAPPROVE" ImageUrl="/Images/cancel-mark.png" CommandName="Disapprov"></asp:ButtonField>
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
                        <asp:Label ID="Label2" runat="server" Text="Label" Visible="false"></asp:Label>
                        <br />
                        <asp:Label ID="SuccMes" Text="" runat="server" ForeColor="Green" />
                        <br />
                        <asp:Label ID="ErrorMes" Text="" runat="server" ForeColor="Red" />
                    </div>
                </div>
                <script>
                    var markers = [
                        <asp:Repeater ID="rptMarkers" runat="server">
                            <ItemTemplate>
                                {

                    "aprtattt": '<%# Eval("ApprovalStatus") %>',
                    "flagstatt": '<%# Eval("FlagStat") %>',
                    "loccc": '<%# Eval("Location") %>',
                    "lattt": '<%# Eval("Latitude") %>',
                    "lnggg": '<%# Eval("Longitude") %>',
                    "desss": '<%# Eval("Description") %>',
                    "imggg": '<%# Eval("Image") %>'
                                                            }
               </ItemTemplate>
                            <SeparatorTemplate>
                                ,
                </SeparatorTemplate>
                        </asp:Repeater >
    ];
                </script>
                <script type="text/javascript">

                    //Garbage Map
                    window.onload = function () {
                        var mapOps = {
                            center: new google.maps.LatLng(7.8731, 80.7718),
                            zoom: 8,
                            mapTypeId: google.maps.MapTypeId.ROADMAP
                        };
                        var infoWindow = new google.maps.InfoWindow();
                        var map2 = new google.maps.Map(document.getElementById("GarbageMap"), mapOps);
                        for (var i = 0; i < markers.length; i++) {
                            var data = markers[i]
                            var myLatlng = new google.maps.LatLng(data.lattt, data.lnggg);

                            if (data.flagstatt == "Red") {

                                var k = '/Images/red-icon.png'

                            }
                            else if (data.flagstatt == "Green") {
                                var k = '/Images/green-icon.png'
                            }

                            var marker2 = new google.maps.Marker({
                                position: myLatlng,
                                map: map2,
                                title: data.loccc,
                                animation: google.maps.Animation.DROP,
                                icon: k
                            });

                            (function (marker3, data) {

                                google.maps.event.addListener(marker3, "click", function (e) {
                                    infoWindow.setContent("<img src=" + data.imggg + " Height='200' Width='300'><br><br><textarea cols='40' rows='4' style='border:none;resize: none' readonly>" + data.desss + "</textarea>");
                                    infoWindow.open(map2, marker3);
                                });
                            })
                                (marker2, data);
                        }
                    }
                </script>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [EmployeeIdorName]"></asp:SqlDataSource>
        </div>
        </form>
    </div>
</body>
</html>
