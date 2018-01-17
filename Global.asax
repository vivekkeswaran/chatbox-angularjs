<%@ Application Language="C#" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        // Code that runs on application startup
        Dictionary<String, String> userList = new Dictionary<String, String>();
        Application.Add("UserList", userList);

        //this is the place where we put all the global chat data.
        List<Object> globalChat = new List<Object>();
        Application.Add("GlobalChat", globalChat);

        List<PrivateChat> privateMsg = new List<PrivateChat>();
        Application.Add("PrivateMsg", privateMsg);
        
        //this is the place where we put all the private chat data.
        List<Object> privateChat = new List<Object>();
        Application.Add("PrivateChat", privateChat);

        List<string> uploadedFileNames = new List<string>();
        Application.Add("UploadedFileNames", uploadedFileNames);

        List<FileDetails> uploadedFileDetails = new List<FileDetails>();
        Application.Add("UploadedFileDetails", uploadedFileDetails);

        List<UploaderDetails> fileUploaderDetails = new List<UploaderDetails>();
        Application.Add("FileUploaderDetails", fileUploaderDetails);

        List<PrivateFileShare> privateFileShare = new List<PrivateFileShare>();
        Application.Add("PrivateFileShare", privateFileShare);

        List<FileDetails> privateFileDetails = new List<FileDetails>();
        Application.Add("UploadedFileDetails", privateFileDetails);

        List<PrivateFileDetails> privateFileDetails1 = new List<PrivateFileDetails>();
        Application.Add("PrivateFileDetails", privateFileDetails1);
    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }
       
</script>
