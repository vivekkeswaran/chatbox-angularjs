<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FileBrowser.aspx.cs" Inherits="FileBrowser" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.7/angular.min.js"></script>
    <script type="text/javascript" src="Helper.js"></script>
    <script type="text/javascript" src="ChatCtrl.js"></script>
    <script type="text/javascript" src="UserCtrl.js"></script>
    <script type="text/javascript" src="PrivateChatCtrl.js"></script>
    <script type="text/javascript" src="FileCtrl.js"></script>
    <link href="ChatPage.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
</head>
<body ng-app>
    <form id="form1" runat="server">
    <div>
        <div class="fileSection">
            <asp:FileUpload ID="fileupload" runat="server" />
            <asp:Button ID="btnUpdload" runat="server" value="upload" Text="Upload" OnClick="btnShare_OnClick"
                OnClientClick="uploadfile();" />
            <div id="divFileUpload" ng-controller="FileCtrl">
                Available Files:
                <div ng-repeat="file in filearray">
                    <span id="lbl{{$index}}">( {{file.time}} ) </span><span id="lblDownloadFile{{$index}}">
                        {{file.fileName}}</span>
                    <input type="button" id="btndownload{{$index}}" value="Download" onserverclick="download_OnClick"
                        onclick="download({{$index}});" />
                    <div>
                        <label id="lblUploderName{{$index}}" title="uploded by:  ">
                            uploded by:
                        </label>
                        {{file.uploadedBy}}</div>
                </div>
            </div>
            <asp:HiddenField runat="server" ID="hdnFileName" />
            <asp:Button ID="btnHidden" class="chatPage-hdnDownloadButton" runat="server" OnClick="download_OnClick" />
        </div>
    </div>
    </form>
    <script type="text/javascript">
        function ContentLoaded1() {
            updateChatArea();
        }

        function updateChatArea() {
            getGlobalFileShare();
        }

        function getGlobalFileShare() {
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
            setTimeout("getGlobalFileShare(false);", 100);
        }

        function download(index) {
            var id = "lblDownloadFile" + index;
            var fileName = document.getElementById(id).innerHTML;
            $("#<%=hdnFileName.ClientID%>").val(fileName);
            document.getElementById('<%=btnHidden.ClientID%>').click();


        }

        function uploadfile() {
            $("#<%=hdnFileName.ClientID%>").val("");
            var filename = document.getElementById("fileupload").value.replace("\\", ";").replace("\\", ";").substr(document.getElementById("fileupload").value.replace("\\", ";").replace("\\", ";").lastIndexOf(";") + 1);
            AddFile(filename);
            __doPostBack('fileupload', '');

        }

        function AddFile(filename) {

            var chatUser = new ServiceCall("UploadFile", "{'message':'" + filename + "'}");
            chatUser.callService(UploadFile_Complete);
        }

        function UploadFile_Complete() {
            setTimeout("getGlobalFileShare(false);", 100);
        }

        window.addEventListener("DOMContentLoaded", ContentLoaded1, false); 
    </script>
</body>
</html>
