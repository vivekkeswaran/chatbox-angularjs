using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ChatBox
/// </summary>
public class ChatBox
{
	public ChatBox()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    private string _currentUser;

    public string CurrentUser
    {
        //set the person name
        set { this._currentUser = value; }
        //get the person name 
        get { return this._currentUser; }
    }
    public List<PrivateChat> prtChat = new List<PrivateChat>();
    public List<string> onlineUsers = new List<string>();

}