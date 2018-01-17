<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FileStore.aspx.cs" Inherits="FileStore" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.7/angular.min.js"></script>
    <script type="text/javascript" src="Helper.js"></script>
    <script type="text/javascript" src="ChatCtrl.js"></script>

    <script type="text/javascript" src="PrivateChatCtrl.js"></script>
    <script type="text/javascript" src="UserCtrl.js"></script>
</head>
<body ng-app>
    <form id="form1" runat="server">
    <div>
       <%-- <a href="mychat.aspx">Go to Chat Page</a>--%>
        <div class="onlineUsers">
        <div class="displayInlineBkVrtTop" style="display:inline-block; vertical-align:top;">
            <span class="chatPage-onlineUsersTitle">Online Users:</span>
            <div id="divOnlineUser" ng-controller="UserCtrl">
                <div ng-repeat="user in onlineUsers">
                    <input type="checkbox" id="fileShareUser{{$index}}" name="chkOnlineUser" value="{{user}}" />
                    <label for="fileShareUser{{$index}}">
                        {{user}}</label>
                </div>
                <div class="fileStore-fileSection">
                    <asp:FileUpload ID="fileupload" runat="server" />
                    <%--<asp:Button ID="Button1" runat="server" value="upload" class="makeInivisible"
                Text="Upload" OnClick="btnUpload_OnClick" />--%>
                    <asp:Button ID="btnUpload" OnClientClick="getUsersList();" runat="server" Text="Send"
                        OnClick="btnUpload_OnClick" />
                    <asp:HiddenField runat="server" ID="HiddenField1" />
                   
                </div>
            </div>
            </div>
            <div class="displayInlineBkVrtTop" style="display:inline-block; vertical-align:top;"> 
                <iframe src="FileStoreFileSection.aspx" id="Iframe1"></iframe>
            </div>
        </div>
        <%-- <asp:Button ID="btnUpload" OnClientClick="getUsersList();" runat="server" OnClick="btnUpload_OnClick" />--%>
        <asp:HiddenField runat="server" ID="hdnUserList" />
    </div>
    </form>
    <script src="js/jquery.min.js"></script>
    <script src="js/jquery.backstretch.min.js"></script>
    <script src="js/templatemo_script.js"></script>
    <script type="text/javascript" language="javascript">

        function getUsersList() {
            var userList = "";
            $('input[name="chkOnlineUser"]:checked').each(function () {
                userList = userList + (this.value) + "|";
            });
            $("#<%=hdnUserList.ClientID%>").val(userList);
            __doPostBack('userList', '');
        }



        function ContentLoaded() {
            updateChatArea();
        }

        function updateChatArea() {
            getGlobalChat();
        }

        function getGlobalChat() {
            var chatUser = new ServiceCall("GetChatUsers", "{}");
            chatUser.callService(getChatUser_Complete);
        }


        function getChatUser_Complete(user) {
            var onlineUser = user.d.length;
            var scope = angular.element("#divOnlineUser").scope();
            scope.onlineUsers = [];
            for (var i = 0; i < user.d.length; i++) {
                scope.onlineUsers.push(user.d[i]);
            }
            scope.$apply();
            setTimeout("scrollToBottom();", 50);
            setTimeout("getGlobalChat(false);", 100);
        }

        function scrollToBottom() {
        }

        window.addEventListener("DOMContentLoaded", ContentLoaded, false); 
    </script>
</body>
</html>
