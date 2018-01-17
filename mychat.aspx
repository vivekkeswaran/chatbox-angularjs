<%@ Page Language="C#" AutoEventWireup="true" CodeFile="mychat.aspx.cs" Inherits="mychat" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
    <title>Share Point</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width">
    <!-- Google Web Font Embed -->
    <link href='http://fonts.googleapis.com/css?family=Raleway:400,600,500,300,700' rel='stylesheet'
        type='text/css'>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/templatemo_main.css">
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.7/angular.min.js"></script>
    <script type="text/javascript" src="Helper.js"></script>
    <script type="text/javascript" src="ChatCtrl.js"></script>
    <script type="text/javascript" src="UserCtrl.js"></script>
    <script type="text/javascript" src="PrivateChatCtrl.js"></script>
    <script type="text/javascript" src="FileCtrl.js"></script>
    <link href="ChatPage.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
    <style type="text/css">
        .Messages {
            overflow: auto;
            height: 200px;
            text-align: left;
            vertical-align: top;
            margin-left: 137px;
            width: 500px;
            display: inline-block;
            font-family: 'Raleway', sans-serif;
            color: #000;
            font-size: 16px;
        }

        .txtStyle {
            font-family: 'Raleway', sans-serif;
            color: #000;
            font-size: 16px;
        }

        .prtTxtBoxChat {
            font-size: 11px;
        }

        .prtChat {
            margin-left: 102px;
        }

        .PrivateMessages {
            overflow: auto;
            height: 200px;
            width: 668px;
            text-align: left;
            color: gray;
            vertical-align: top;
            margin: 0 auto;
            display: inline-block;
            float: left;
            border-right: 1px solid #CDCDCD;
        }

        .receiverText {
            font-size: 11px;
            font-style: italic;
            line-height: 5px;
        }

        .fileSection {
            display: inline-block;
            margin-left: 171px;
            margin-top: 50px;
        }

        .onlineUsers {
            display: inline-block;
            vertical-align: top;
        }

        .globalChatTextBox {
            margin-left: 80px;
            margin-top: 29px;
            font-size: 14px;
        }

        .privateConversation {
            padding-top: 5px;
        }

        #toggle {
            background: #ccc;
            display: none;
        }
    </style>
</head>
<body ng-app="">
    <form id="form1" runat="server">
        <div>
            <div id="main-wrapper">
                <!--[if lt IE 7]>
                <p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a rel="nofollow" href="http://browsehappy.com">upgrade your browser</a> or <a rel="nofollow" href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
            <![endif]-->
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 affix text-center" style="z-index: 1;">
                    <h1 class="templatemo-site-title">
                        <img src="images/btn-menu.png" alt="main menu" id="m-btn" class="pull-right visible-xs visible-sm">
                    </h1>
                    <ul id="responsive" style="display: none" class="hidden-lg hidden-md">
                    </ul>
                </div>
                <div class="menu visible-md visible-lg">
                    <ul id="menu-list">
                        <li class="active home-menu"><a href="#home">Home</a></li>
                        <li class="about-menu"><a href="#about">Private Chats</a></li>
                        <li class="services-menu"><a href="#services">Global File Share</a></li>
                        <li class="testimonial-menu"><a href="#testimonial">File Store</a></li>
<%--                        <li class="contact-menu"><a href="#contact">Contact</a></li>--%>

                    </ul>
                    <ul class="logOutBtn">
                        <li class="contact-menu  ">
                            <a href="#contact">
                                <asp:LinkButton runat="server" ID="lnkbtnLogOut" CssClass="logoutLink" Text="Log Out" OnClick="lnkbtnLogOut_OnClick"></asp:LinkButton>
                            </a></li>
                    </ul>
                </div>
                <!-- /.menu -->
                <div class="image-section">
                    <div class="image-container">
                        <img src="images/nature1.jpg" id="home-img" class="main-img inactive" alt="Home">
                        <img src="images/nature2.jpg" id="about-img" class="inactive" alt="About">
                        <img src="images/nature3.jpg" id="services-img" class="inactive" alt="Services">
                        <img src="images/nature4.jpg" id="testimonial-img" class="inactive" alt="Testimonial">
                        <img src="images/nature5.jpg" id="contact-img" class="inactive" alt="Contact">
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-7 col-md-6 col-sm-12 col-xs-12 col-lg-offset-6 col-md-offset-6 templatemo-content-wrapper">
                        <div class="templatemo-content">
                            <section id="home-text" class="active templatemo-content-section">
                            <div class="col-sm-12 col-md-12 col-lg-12">
                                <h2 class="text-center">Welcome to SharePoint Global Chat</h2>
                                <div class="chatPage-mainContainer">
        <div>
            
        </div>
      
        <div id="container">
            <div id="divMessages" ng-controller="ChatCtrl" class="Messages">
                <table width="100%">
                    <tr ng-repeat="msg in globalChat">
                        <td>
                            ({{msg.time}})&nbsp;{{msg.message}}
                        </td>
                    </tr>
                </table>
            </div>
            <div>
                <input id="txtMessage" size="65" class="globalChatTextBox" maxlength="90" placeholder="Enter your message" />
            </div>
        </div>
   
        
    </div>
                            </div>
                        </section>
                            <section id="about-text" class="inactive">
                            <h2 class="text-center">Private Chats</h2>
                              <div id="divPrivateChat" ng-controller="PrivateChatCtrl" class="PrivateMessages txtStyle">
                              <div class="onlineUsers">
                                <span class="chatPage-onlineUsersTitle">Online Users:</span>
            <div id="divOnlineUser"  ng-controller="UserCtrl">
                <div ng-repeat="user in onlineUsers">
                    <a id="{{$index}}" ng-click="sample({{user}})" onclick="pingme({{$index}});" class="chatPage-onlineUsers"
                        rel="userlist" data-para1="{{$index}}">{{user}}</a>
                    <div id="toggle" class="{{$index}}">
                         
                        <input id="txtPrivateChat{{$index}}" size="20" class="prtTxtBoxChat" onfocus="privateText(this,{{$index}});"
                            maxlength="50" placeholder="Enter your message" />
                    </div>
                </div>
            </div>
            </div>
              <div class="onlineUsers prtChat txtStyle">
            <label class="privateChatTitle">
                Private Chats
            </label>
            <div class="privateConversation" ng-repeat="chat in privateChats">
                {{chat.Time}}&nbsp;{{chat.Content}}
                <div class="receiverText">
                    {{chat.From}} <span>~ {{chat.To}} </span>
                </div>
            </div>
               
          
        </div>
        </div>
                        </section>
                            <section id="services-text" class="inactive">
                            <h2 class="text-center">Global File Share</h2>
        <iframe src="FileBrowser.aspx" class="chatPage-iframeFileShareWindow  chatPage-globalFileShare" id="iframe1">
        </iframe>
                        </section>
                            <section id="testimonial-text" class="inactive">
                            <div class="col-sm-12 col-md-12">
                                <h2 class="chatPage-fileStoreHeading">File Store</h2>
                                
                                <iframe src="FileStore.aspx" class="chatPage-iframeFileShareWindow" id="iframe2">
        </iframe>
                            </div>
                        </section>
                            <section id="contact-text" class="inactive">
                            <div class="col-sm-12 col-md-12">
                                <div class="row">
                                    <div class="col-sm-12 col-md-12"><h2>Contact</h2></div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="row">
                                    <div class="col-sm-6 col-md-6">
                                        <div id="map-canvas"></div>
                                        <p>120 Aenean quis semper. Maecenas adipiscing, facilisis tempor, mi quam feugiat 10450</p>
                                    </div>

                                    <div class="col-sm-6 col-md-6">
                                        <form action="#" method="post">

                                                <div class="form-group">
                                                    <input type="text" id="contact_name" class="form-control" placeholder="Name" />
                                                </div>
                                                <div class="form-group">
                                                    <input type="text" id="contact_email" class="form-control" placeholder="Email Address" />
                                                </div>
                                                <div class="form-group">
                                                    <textarea id="contact_message" class="form-control" rows="9" placeholder="Write a message"></textarea>
                                                </div>
                                                <button type="submit" class="btn btn-primary">Send</button>
                                        </form>
                                    </div>                                    
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </section>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 footer">
                        <p class="footer-text">
                            Copyright &copy; 2017 Share Point
                        </p>
                    </div>
                </div>
            </div>
            <div id="preloader">
                <div id="status">
                    &nbsp;
                </div>
            </div>
            <script src="js/jquery.min.js"></script>
            <script src="js/jquery.backstretch.min.js"></script>
            <script src="js/templatemo_script.js"></script>
        </div>
    </form>
    <script type="text/javascript">
        function download(index) {
            var id = "lblDownloadFile" + index;
            var fileName = document.getElementById(id).innerHTML;

            ContentLoaded();
        }

        function show() {
            alert();
        }

        function OnResult(result, userContext, method) {
            var resultMsg = "Result from Method [" + method + "] is: " + result;
            alert(resultMsg);
        }

        function OnError(error, userContext, method) {
            if (error != null) {
                var resultMsg = "Error from Method [" + method + "] is: '" + error.get_message() + "'";
                alert(resultMsg);
            }
        }

        function uploadfile() {

        }

        function AddFile(filename) {
            var chatUser = new ServiceCall("UploadFile", "{'message':'" + filename + "'}");
            chatUser.callService(UploadFile_Complete);
        }

        function UploadFile_Complete() {

        }

        function getGlobalUploadedFiles() {
            var fileShare = new ServiceCall("GetUploadFile", "{}");
            fileShare.callService(GetUploadFile_Complete);
        }

        function GetUploadFile_Complete(files) {
            var listOfFiles = files.d.length;
            var scope = angular.element("#divFileUpload").scope();
            scope.filearray = [];
            for (var i = 0; i < files.d.length; i++) {
                scope.filearray.push(files.d[i]);
            }
            scope.$apply();
        }

        function privateText(element, index) {
            var item = "#" + element.id;
            var rece = "#" + index;
            $(item).bind("keypress", function (e) {
                if (e.keyCode == 13) {
                    AddPrivateChatMsg(item, $(rece).text());
                    $(item).val("");
                    return false;
                }
            });
        }

        function groupBy(attribute) {
            alert(attribute);
        }

        function AddPrivateChatMsg(item, to) {
            var chatService = new ServiceCall("AddPrivateChat",
            "{'message':'" + $(item).val() + ":;" + to + "'}");
            chatService.callService(addPrivateChat_Complete);
        }

        function addPrivateChat_Complete() { }

        $('#txtMessage').bind("keypress", function (e) {
            if (e.keyCode == 13) {
                AddGlobalChatMsg();
                $('#txtMessage').val("");
                return false;
            }
        });

        function pingme(index) {

            var class1 = "." + index;
            $(class1).toggle("fold");
        }

        function AddGlobalChatMsg() {
            var chatService = new ServiceCall("AddGlobalChat",
            "{'message':'" + Helper.htmlEscape($('#txtMessage').val()) + "'}");
            chatService.callService(addGlobalChat_Complete);
        }

        function addGlobalChat_Complete() { }

        function ContentLoaded() {
            updateChatArea();
        }

        function updateChatArea() {
            getGlobalChat();
        }

        function getGlobalChat() {
            var chatService = new ServiceCall("GetGlobalChat", "{}");
            chatService.callService(getGlobalChat_Complete);
            var chatUser = new ServiceCall("GetChatUsers", "{}");
            chatUser.callService(getChatUser_Complete);
            var privateChat = new ServiceCall("GetPrivateChats", "{}");
            privateChat.callService(privateChat_Complete);

        }

        function privateChat_Complete(pchat) {
            var onlineUser = pchat.d.length;
            var scope = angular.element("#divPrivateChat").scope();
            scope.privateChats = [];
            for (var i = 0; i < pchat.d.length; i++) {
                scope.privateChats.push(pchat.d[i]);

            }
            scope.$apply();
        }

        function getChatUser_Complete(user) {
            var onlineUser = user.d.length;
            var scope = angular.element("#divOnlineUser").scope();
            scope.onlineUsers = [];
            for (var i = 0; i < user.d.length; i++) {
                scope.onlineUsers.push(user.d[i]);
            }
            scope.$apply();
        }

        function getGlobalChat_Complete(msg) {
            var scope = AngularScope();
            var scroll = scrollBarAtBottom();
            scope.globalChat = [];
            var i = 0;
            for (; i < msg.d.length; i++) {
                msg.d[i].message = Helper.htmlUnescape(msg.d[i].message);
                scope.globalChat.push(msg.d[i]);
            }
            scope.$apply();
            if (scroll === true) {
                setTimeout("scrollToBottom();", 50);
            }
            setTimeout("getGlobalChat(false);", 100);
        }

        function scrollToBottom() {
            $('#divMessages').scrollTop($('#divMessages')[0].scrollHeight);
        }

        function AngularScope() {
            return angular.element($("#divMessages")).scope();
        }

        function scrollBarAtBottom() {
            var divMessages = $("#divMessages");
            var scrollTop = divMessages.scrollTop();
            var height = divMessages.height();
            var scrollHeight = divMessages[0].scrollHeight;
            if (scrollTop >= scrollHeight - height) {
                return true;
            }
            else {
                return false;
            }
        }

        function goto_FileStore() {
            window.open("FileStore.aspx", "_self");
        }

        window.addEventListener("DOMContentLoaded", ContentLoaded, true);
    </script>
</body>
</html>
