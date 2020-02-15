<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Member.aspx.cs" Inherits="ProjectTest.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Member</title>
    <link rel="shortcut icon" href="Images/logo_vrr_icon.ico" />
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBMTMkX170gFTuxAwLcvIx2rnV-ZM6zGoI"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
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

        #map {
            height: 400px;
            width: 1200px;
        }

        #location-input {
            width: 500px;
            padding: 5px;
        }

        #submit {
            padding: 8px;
        }

        #Geolocate {
            padding: 8px;
            width: 515px;
        }

        #or {
            align-content: center;
        }

        #Save {
            width: 80px;
            height: 50px;
        }

        #main {
            text-align: center;
            padding-left: 200px;
        }

        #other {
            padding-top: 1000px;
        }

        #GarbageMap {
            height: 700px;
            width: 1200px;
            padding-left: 50px;
        }

        #Hidden1 {
            visibility: hidden;
        }

        #Hidden2 {
            visibility: hidden;
        }

        #Hidden3 {
            visibility: hidden;
        }

        #tabsd {
            padding-top: 50px;
        }
         #Label_Welcome{
            font-size:30px;
            color:black;
            font-style:oblique;
            float:right;
            font-weight: bold;
        }

        #Label_Welcome{
            font-size:25px;
            color:White;
            font-family: Arial, sans-serif;
            font-weight: bold;
        }

        #btn {
            float:right;
            padding-top:20px;
            padding-right:10px;
        }
        
        #Logout{
            border-radius: 15px;
        }
    </style>
</head>
<body>
    <div class="Container">
        <form id="form1" method="POST" runat="server">
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
                <div>
                    <div id="main">
                        <div id="container">
                            <div id="GarbageMap"></div>
                            <div id="tabsd">
                                <ul id="tabs">
                                    <li>
                                        <input type="radio" name="tabs" id="tab-1" checked="checked" />
                                        <label for="tab-1">ADD NEW LOCATION</label>
                                        <div class="tab-content">
                                            <div id="map"></div>
                                            <h3 id="EnterLocation">Enter Location: </h3>
                                            <input type="text" id="location-input" />
                                            <input type="button" id="Search" value="submit" />
                                            <br />
                                            <h5 id="or">Or</h5>
                                            <input type="button" id="Geolocate" value="Get Location" />
                                            <br />
                                            <br />

                                            <h3 id="EnterDescription">Enter Description: </h3>
                                            <textarea name="Comment" id="Comment" cols="50" rows="10" runat="server"></textarea>
                                            <br />
                                            <br />

                                            <h3 id="UploadImage">Upload Image: </h3>
                                            <asp:FileUpload ID="FileUpload" runat="server" />
                                            <br />
                                            <br />
                                            <br />

                                            <asp:Button type="button" ID="Save" runat="server" Text="Save" OnClick="Save_Click" />

                                            <br />
                                            <br />
                                            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                                            <br />
                                            <br />
                                        </div>
                                    </li>
                                    <li>
                                        <input type="radio" name="tabs" id="tab-2" />
                                        <label for="tab-2">UPDATE/DELETE</label>
                                        <div class="tab-content">
                                            <div id="Grid">
                                                <asp:GridView ID="GridView" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" ShowHeaderWhenEmpty="True"
                                                    OnRowEditing="GridView_RowEditing" OnRowCancelingEdit="GridView_RowCancelingEdit" OnRowUpdating="GridView_RowUpdating"
                                                    OnRowDeleting="GridView_RowDeleting" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Approval Status">
                                                            <ItemTemplate>
                                                                <div style="width: 190px; overflow: hidden; text-overflow: ellipsis">
                                                                    <asp:Label Text='<%# Eval("ApprovalStatus") %>' runat="server" />
                                                                </div>
                                                            </ItemTemplate>
                                                            <EditItemTemplate>
                                                                <div style="width: 190px; overflow: hidden; text-overflow: ellipsis">
                                                                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("ApprovalStatus") %>'></asp:Label>
                                                                </div>
                                                            </EditItemTemplate>
                                                            <FooterTemplate>
                                                                <div style="width: 190px; overflow: hidden; text-overflow: ellipsis">
                                                                    <asp:TextBox ID="txtApprovalStatusFooter" runat="server" />
                                                                </div>
                                                            </FooterTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Location">
                                                            <ItemTemplate>
                                                                <div style="width: 190px; overflow: hidden; text-overflow: ellipsis">
                                                                    <asp:Label Text='<%# Eval("Location") %>' runat="server" />
                                                                </div>
                                                            </ItemTemplate>
                                                            <EditItemTemplate>
                                                                <div style="width: 190px; overflow: hidden; text-overflow: ellipsis">
                                                                    <asp:TextBox ID="txtLocation" runat="server" Text='<%# Eval("Location") %>' />
                                                                </div>
                                                            </EditItemTemplate>
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
                                                            <EditItemTemplate>
                                                                <div style="width: 190px; overflow: hidden; text-overflow: ellipsis">
                                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Latitude") %>'></asp:Label>
                                                                </div>
                                                            </EditItemTemplate>
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
                                                            <EditItemTemplate>
                                                                <div style="width: 190px; overflow: hidden; text-overflow: ellipsis">
                                                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("Longitude") %>'></asp:Label>
                                                                </div>
                                                            </EditItemTemplate>
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
                                                            <EditItemTemplate>
                                                                <div style="width: 190px; overflow: hidden; text-overflow: ellipsis">
                                                                    <asp:TextBox ID="txtDescription" runat="server" Text='<%# Eval("Description") %>' />
                                                                </div>
                                                            </EditItemTemplate>
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
                                                            <EditItemTemplate>
                                                                <div style="width: 190px; overflow: hidden; text-overflow: ellipsis">
                                                                    <asp:TextBox ID="txtImage" runat="server" Text='<%# Eval("Image") %>' Visible="false" />
                                                                    <asp:FileUpload ID="FileUpload2" runat="server" />
                                                                    <asp:Label ID="Label3" runat="server" Text="Label" Visible="false"></asp:Label>
                                                                </div>
                                                            </EditItemTemplate>
                                                            <FooterTemplate>
                                                                <div style="width: 190px; overflow: hidden; text-overflow: ellipsis">
                                                                    <asp:TextBox ID="txtImageFooter" runat="server" />
                                                                </div>
                                                            </FooterTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="imgg" ImageUrl="~/Images/edit.png" runat="server" CommandName="Edit" ToolTip="Edit" Width="25px" Height="25px" />
                                                                <asp:ImageButton ImageUrl="~/Images/delete.png" runat="server" CommandName="Delete" ToolTip="Delete" Width="25px" Height="25px" />
                                                            </ItemTemplate>
                                                            <EditItemTemplate>
                                                                <asp:ImageButton ImageUrl="~/Images/save.png" runat="server" CommandName="Update" ToolTip="Update" Width="25px" Height="25px" />
                                                                <asp:ImageButton ImageUrl="~/Images/cancel.png" runat="server" CommandName="Cancel" ToolTip="Cancel" Width="25px" Height="25px" />
                                                            </EditItemTemplate>
                                                        </asp:TemplateField>
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
                                                <asp:Label ID="SuccMes" Text="" runat="server" ForeColor="Green" />
                                                <br />
                                                <asp:Label ID="ErrorMes" Text="" runat="server" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <input id="Hidden1" runat="server" />
                    <input id="Hidden2" runat="server" />
                    <input id="Hidden3" runat="server" />
                </div>
            </div>
        </form>
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

        //New Location 
        //Map
        var marker;
        var map;

        function initialize() {
            var mapProp = {
                enableHighAccuracy: true,
                center: new google.maps.LatLng(7.8731, 80.7718),
                zoom: 7,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            map = new google.maps.Map(document.getElementById("map"), mapProp);

            marker = new google.maps.Marker({
                position: new google.maps.LatLng(),
                draggable: true,
                animation: google.maps.Animation.DROP
            });

            marker.setMap(map);

            google.maps.event.addListener(marker, 'dragend', function (evt) {
                document.getElementById('Hidden1').value = evt.latLng.lat().toFixed(8);
                document.getElementById('Hidden2').value = evt.latLng.lng().toFixed(8);
                Location();
            });

        }
        google.maps.event.addDomListener(window, 'load', initialize);

        //Manual Search
        document.getElementById("Search").onclick = geocode;

        function geocode(e) {

            e.preventDefault();

            var location = document.getElementById('location-input').value;

            axios.get('https://maps.googleapis.com/maps/api/geocode/json',
                {
                    params: {
                        address: location,
                        key: 'AIzaSyBMTMkX170gFTuxAwLcvIx2rnV-ZM6zGoI'
                    }
                })
                .then(function (response) {
                    console.log(response)

                    var lat = response.data.results[0].geometry.location.lat;
                    var lng = response.data.results[0].geometry.location.lng;

                    myLatLng = new google.maps.LatLng(lat, lng);
                    marker.setPosition(myLatLng);
                    map.panTo(myLatLng);
                    map.setZoom(14);

                    document.getElementById('Hidden1').value = lat;
                    document.getElementById('Hidden2').value = lng;
                    Location();

                })

                .catch(function (error) {
                    console.log(error)
                })

        }

        //Geo Locate
        document.getElementById("Geolocate").onclick = Geolocatee;

        function Geolocatee() {
            if (navigator.geolocation) {

                var geocoder = new google.maps.Geocoder;

                navigator.geolocation.getCurrentPosition(

                    function (position) {
                        var pos = {
                            lat: position.coords.latitude,
                            lng: position.coords.longitude
                        };

                        myLatLng = new google.maps.LatLng(pos);
                        marker.setPosition(myLatLng);
                        map.panTo(myLatLng);
                        map.setZoom(14);
                        map.setCenter(pos);
                        map.panTo(pos);
                        map.setZoom(15);

                        document.getElementById('Hidden1').value = myLatLng.lat().toFixed(8);
                        document.getElementById('Hidden2').value = myLatLng.lng().toFixed(8);
                        Location();

                    },

                    function () {
                        handleLocationError(true, infoWindow, map.getCenter());
                    });
            }
            else {
                handleLocationError(false, infoWindow, map.getCenter());
            }
        }

        function handleLocationError(browserHasGeolocation, infoWindow, pos) {
            infoWindow.setPosition(pos);
            infoWindow.setContent(browserHasGeolocation ?
                'Error: The Geolocation service failed.' :
                'Error: Your browser doesn\'t support geolocation.');
            infoWindow.open(map);
        }

        //Get Location Name
        function Location() {
            var geocoder = new google.maps.Geocoder;
            var latlng = { lat: marker.getPosition().lat(), lng: marker.getPosition().lng() };
            geocoder.geocode({ 'location': latlng },
                function (results, status) {
                    var value = results[0].formatted_address;
                    document.getElementById('Hidden3').value = value;

                });
        }
    </script>
    <asp:SqlDataSource ID="MyDB" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [SAVEE]"></asp:SqlDataSource>
</body>
</html>
