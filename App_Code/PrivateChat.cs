using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for PrivateChat
/// </summary>
public class PrivateChat
{
	public PrivateChat()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    private string _from;
    private string _to;
    private string _msg;
    private string _time;
    private string _content;
    private string _currentUser;

    public string CurrentUser
    {
        //set the person name
        set { this._currentUser = value; }
        //get the person name 
        get { return this._currentUser; }
    }

    public string Content
    {
        //set the person name
        set { this._content = value; }
        //get the person name 
        get { return this._content; }
    }

    public string Time
    {
        //set the person name
        set { this._time = value; }
        //get the person name 
        get { return this._time; }
    }

    public string From
    {
        //set the person name
        set { this._from = value; }
        //get the person name 
        get { return this._from; }
    }

    public string Msg
    {
        //set the person name
        set { this._msg = value; }
        //get the person name 
        get { return this._msg; }
    }
    

    public string To
    {
        //set the person name
        set { this._to = value; }
        //get the person name 
        get { return this._to; }
    }

}