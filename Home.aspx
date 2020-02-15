<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="ProjectTest.Home" %>

<!DOCTYPE html>
<html>
<head>  
    <title>Green Task Force</title>
    <link rel="shortcut icon" href="Images/logo_vrr_icon.ico" />
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBMTMkX170gFTuxAwLcvIx2rnV-ZM6zGoI"></script>
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
            height: 400vh auto;
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
            }

        .main {
            background-color: transparent;
            width: 65%;
            margin: 0 auto;
            height: 50%;
        }

        .nav-bar img {
            width: 85px;
            height: 85px;
        }

        #GarbageMap {
            height: 700px;
            margin-top: 80px;
        }
        .article img {
                float: left;
                padding-left: 20px;
            }
         .article img{
            width:85px;
            height:85px;
        }

        .n{
            height:40%;
            width:60%;
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
                <h1>Welcome to Sri lanka's public garbage optimisation division.</h1>
                <h2>Current Priority ;</h2>
                <div id="GarbageMap"></div>
        </div>

    </div>

    <script>
        var markers = [
            <asp:Repeater ID="rptMarkers" runat="server">
                <ItemTemplate>
                    {

                    "aprtattt": '<%# Eval("ApprovalStatus") %>',
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


                if (data.aprtattt == "Approved") {

                    var marker2 = new google.maps.Marker({
                        position: myLatlng,
                        map: map2,
                        title: data.loccc,
                        animation: google.maps.Animation.DROP,
                        icon: '/Images/Normal-Marker.png'
                    });
                }

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
</body>
</html>
