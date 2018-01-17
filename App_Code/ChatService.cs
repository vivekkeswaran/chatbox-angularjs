using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Net;
using System.Web.Services;

/// <summary>
/// Summary description for ChatService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
[System.Web.Script.Services.ScriptService]
public class ChatService : System.Web.Services.WebService {

    public ChatService () { 
         
        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod(EnableSession = true)]
    public bool CheckIsUserActive(String userName)
    {
        String newId = Session.SessionID;
        if (!((Dictionary<String, String>)Application["UserList"]).Keys.Contains(newId))
            return true;
        else
            return false; 
    }

    [WebMethod(EnableSession = true)]
    public String AddUser(String userName)
    {
        //add our new user to the application object
        String newId = Session.SessionID;
        if (!((Dictionary<String, String>)Application["UserList"]).Keys.Contains(newId))
            ((Dictionary<String, String>)Application["UserList"]).Add(newId, userName);
         
        return "Success";
    }

    /// <summary>
    /// Adds a new chat message.
    /// </summary>
    /// <param name="message"></param>
    /// <returns></returns>
    [WebMethod(EnableSession = true)]
    public String AddGlobalChat(String message)
    {
        String userId = Session.SessionID;
        ((List<Object>)Application["GlobalChat"]).Add(
            new
            {
                time = DateTime.Now.ToString("hh:mm"),
                message = ((Dictionary<String, String>)Application
                ["UserList"])[userId] + ": " + message
            });

        return "Success";
    }

    /// <summary>
    /// Returns the global chat data.
    /// </summary>
    /// <returns>Object containing the global chat data</returns>
    [WebMethod(EnableSession = true)]
    public Object GetGlobalChat()
    {
        List<Object> messages = (List<Object>)Application["GlobalChat"];
        return messages;
    }

    [WebMethod(EnableSession = true)]
    public List<PrivateChat> GetPrivateChats()
    {
        List<PrivateChat> prvtMsgs = (List<PrivateChat>)Application["PrivateMsg"];
        Dictionary<String, String> userList = (Dictionary<String, String>)Application["UserList"];
        List<PrivateChat> rtrnList = new List<PrivateChat>();
        string currentUser = null;
        if (userList.ContainsKey(Session.SessionID) == true)
            currentUser = userList[Session.SessionID];
        ChatBox chatBox = new ChatBox();
        chatBox.CurrentUser = currentUser;
        
        foreach (PrivateChat pc in prvtMsgs)
        {
            if (!string.IsNullOrEmpty(pc.Content))
            {
                if (pc.To.Equals(currentUser) || pc.From.Equals(currentUser))
                {
                    rtrnList.Add(pc);
                    chatBox.prtChat.Add(pc);
                }
            }
        }  
        return rtrnList;

       // List<ChatBox> rtnChatBox = new List<ChatBox>();

      
       // var users = userList.SelectMany(x => x.Value).ToList();
       // List<string> onlineUser = new List<string>();
       // foreach (var user in userList)
       // {
       //     onlineUser.Add(user.Value.ToString());
       // }
       // if (currentUser != null)
       //     onlineUser.Remove(currentUser);
       // foreach (string user in onlineUser)
       // { 
       //     ChatBox c1 = new ChatBox();
       //     c1.CurrentUser = user.ToString();
       //     foreach (PrivateChat pc in prvtMsgs)
       //     {
       //         if (!string.IsNullOrEmpty(pc.Content))
       //         {
       //             if (pc.To.Equals(user.ToString()) || pc.From.Equals(user.ToString()))
       //             {
       //                 c1.prtChat.Add(pc); 
       //             }
       //         }
       //     }
       //     if (currentUser != null && !currentUser.Equals(c1.CurrentUser))
       //         rtnChatBox.Add(c1);
       //     chatBox.onlineUsers.Add(user.ToString());
       // }
       // if (currentUser != null)
       //     chatBox.onlineUsers.Remove(currentUser);
         
       //// return chatBox; 
       // return rtnChatBox;
    }

    [WebMethod(EnableSession = true)]
    public Object GetChatUsers()
    { 
        Dictionary<String, String> userList = (Dictionary<String, String>)Application["UserList"];
        //userList.Remove(Session.SessionID);
        string currentUser=null;
        if(userList.ContainsKey(Session.SessionID)==true)
            currentUser = userList[Session.SessionID];
        var users = userList.SelectMany(x => x.Value).ToList();

        List<string> onlineUser = new List<string>();
        foreach (var user in userList)
        {
            onlineUser.Add(user.Value.ToString());
        }

        if (currentUser != null)
            onlineUser.Remove(currentUser);

        return onlineUser;
    }

    [WebMethod(EnableSession = true)]
    public String AddPrivateChat(String message)                 
    {  
        String userId = Session.SessionID;
        PrivateChat prtChat = new PrivateChat();  
        prtChat.Time = "(" + DateTime.Now.ToString("hh:mm") + ")";
        prtChat.Msg = ((Dictionary<String, String>)Application
                ["UserList"])[userId] + ": " + message.Substring(0, message.LastIndexOf(":;"));
        prtChat.From = ((Dictionary<String, String>)Application
                ["UserList"])[userId];
        prtChat.To = message.Substring(message.LastIndexOf(":;") + 2);
        prtChat.CurrentUser = ((Dictionary<String, String>)Application
                ["UserList"])[userId];
        prtChat.Content = message.Substring(0, message.LastIndexOf(":;"));
        ((List<PrivateChat>)Application["PrivateMsg"]).Add(prtChat);
        ((List<Object>)Application["PrivateChat"]).Add(
            new
            {
                time = DateTime.Now.ToString("hh:mm"),
                message = ((Dictionary<String, String>)Application
                ["UserList"])[userId] + ": " + message.Substring(0,message.LastIndexOf(":;")),
                sender = ((Dictionary<String, String>)Application
                ["UserList"])[userId],
                to= message.Substring(message.LastIndexOf(":;")+2)
            });
         
        return "Success";
    }

    public void download()
    {
        string url = @"http://www.thereforesystems.com/wp-content/uploads/2008/08/image35.png";
        // Create an instance of WebClient
        WebClient client = new WebClient();
        // Hookup DownloadFileCompleted Event
        client.DownloadFileCompleted += new AsyncCompletedEventHandler(client_DownloadFileCompleted);

        // Start the download and copy the file to c:\temp
        client.DownloadFileAsync(new Uri(url), @"c:\temp\image35.png");
    }

    void client_DownloadFileCompleted(object sender, AsyncCompletedEventArgs e)
    { 
       
    }

    [WebMethod(EnableSession = true)]
    public String UploadFile(String message)
    {
        ((List<string>)Application["UploadedFileNames"]).Add(message);
        String userId = Session.SessionID;
        UploaderDetails uploaderDetails = new UploaderDetails();
        uploaderDetails.fileName = message;
        uploaderDetails.time = DateTime.Now.ToString("hh:mm");
        uploaderDetails.uploadedBy = ((Dictionary<String, String>)Application
                ["UserList"])[userId];

        ((List<UploaderDetails>)Application["FileUploaderDetails"]).Add(uploaderDetails);

        return "success"; 
    }

    [WebMethod(EnableSession = true)] 
    public List<UploaderDetails> GetUploadFile() 
    {
        List<string> fileList = (List<string>)Application["UploadedFileNames"];
        List<UploaderDetails> uploderDetials = ((List<UploaderDetails>)Application["FileUploaderDetails"]);
        return uploderDetials;
    }

    [WebMethod(EnableSession = true)]
    public List<PrivateFileShare> GetPrivateFiles()
    { 
        List<PrivateFileShare> lstOfPrivateFiles = ((List<PrivateFileShare>)Application["PrivateFileShare"]);
        List<PrivateFileShare> rtnList = new List<PrivateFileShare>();
        String userId = Session.SessionID;
        String userName = ((Dictionary<String, String>)Application["UserList"])[userId];
        rtnList = (from file in lstOfPrivateFiles where file.to.Trim().Replace("|","").Trim().Equals(userName) select file).ToList<PrivateFileShare>();
        return rtnList;
    }
}
