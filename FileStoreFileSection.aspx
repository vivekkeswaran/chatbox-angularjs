<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FileStoreFileSection.aspx.cs"
    Inherits="FileStoreFileSection" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.7/angular.min.js"></script>
    <link href="css/Common.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="Helper.js"></script>
    <script type="text/javascript" src="ChatCtrl.js"></script>
    <script type="text/javascript" src="PrivateChatCtrl.js"></script>
    <script type="text/javascript" src="UserCtrl.js"></script>
    <script src="PrivateFileShareCtrl.js" type="text/javascript"></script>
</head>
<body ng-app>
    <form id="form1" runat="server">
    <div>
        <div class="fileStore-fileSection">
            <div id="divFileUpload" ng-controller="FileShareCtrl">
               My Inbox:
                <div ng-repeat="file in sharedFiles">
                    <span id="lbl{{$index}}">( {{file.time}} ) </span><span id="lblDownloadFile{{$index}}">
                        {{file.fileName}}</span>
                    <input type="button" id="btndownload{{$index}}" value="Download" onclick="download({{$index}});" />
                    <div>
                        <label id="lblUploderName{{$index}}" title="uploded by:  ">
                            From :
                        </label>
                        {{file.from}}</div>
                </div>
            </div>
            <asp:HiddenField runat="server" ID="hdnFileName" />
            <asp:Button ID="btnHidden" class="makeInivisible" runat="server" OnClick="download_OnClick" />
        </div>
    </div>
    </form>
    <script type="text/javascript" language="javascript">

        function getUsersList() {


        }

        function download(index) {
            var id = "lblDownloadFile" + index;
            var fileName = document.getElementById(id).innerHTML;
            $("#<%=hdnFileName.ClientID%>").val(fileName);
            document.getElementById('<%=btnHidden.ClientID%>').click();


        }

        function ContentLoaded1() {
            updateFileSection();
        }

        function updateFileSection() {
            getFiles();
        }

        function getFiles() {
            var getPrivateFiles = new ServiceCall("GetPrivateFiles", "{}");
            getPrivateFiles.callService(getPrivateFiles_Complete);
        }

        function getPrivateFiles_Complete(files) {
            var listOfFiles = files.d.length;
            var scope = angular.element("#divFileUpload").scope();
            scope.sharedFiles = [];
            for (var i = 0; i < files.d.length; i++) {
                scope.sharedFiles.push(files.d[i]);
            }
            scope.$apply();
            setTimeout("getFiles(false);", 100);
        }

        function GetUploadFile_Complete(files) {
            var listOfFiles = files.d.length;
            var scope = angular.element("#divFileUpload").scope();
            scope.filearray = [];
            for (var i = 0; i < files.d.length; i++) {
                scope.filearray.push(files.d[i]);
            }
            scope.$apply();
            setTimeout("getFiles(false);", 100);
        }
        window.addEventListener("DOMContentLoaded", ContentLoaded1, false); 
    </script>
</body>
</html>
