using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class FileStore : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string s = hdnUserList.Value;

    }
    protected void btnUpload_OnClick(object sender, EventArgs e)
    {
        String userId = Session.SessionID;
        string to = hdnUserList.Value;
        List<string> userList = new List<string>();
        string[] userArray = to.Split(',');
        foreach (string user in userArray)
        {
            if (!string.IsNullOrEmpty(user) && !user.Equals(""))
            {
                userList.Add(user);
                PrivateFileShare privateFileShare = new PrivateFileShare();
                privateFileShare.fileName = fileupload.FileName;
                privateFileShare.from = ((Dictionary<String, String>)Application["UserList"])[userId];
                privateFileShare.to = user;
                privateFileShare.time = DateTime.Now.ToString("hh:mm");
                // privateFileShare.fileBytes = fileupload.FileBytes;
                privateFileShare.extension = fileupload.FileName.Substring(fileupload.FileName.LastIndexOf(".") + 1);
                ((List<PrivateFileShare>)Application["PrivateFileShare"]).Add(privateFileShare);

                //For Bytes... Have change the below one.

                PrivateFileDetails privateFileDetails = new PrivateFileDetails();
                privateFileDetails.fileName = fileupload.FileName;
                privateFileDetails.from = ((Dictionary<String, String>)Application["UserList"])[userId];
                privateFileDetails.to = user;
                privateFileDetails.time = DateTime.Now.ToString("hh:mm");
                privateFileDetails.fileBytes = fileupload.FileBytes;
                privateFileDetails.ContentType = fileupload.PostedFile.ContentType;
                privateFileDetails.extension = fileupload.FileName.Substring(fileupload.FileName.LastIndexOf(".") + 1);
                ((List<PrivateFileDetails>)Application["PrivateFileDetails"]).Add(privateFileDetails);
            }
        }
    }

    protected void download_OnClick(object sender, EventArgs e)
    {
        //string fileName = hdnFileName.Value;

        //if (!string.IsNullOrEmpty(fileName))
        //{
        //    DownloadFile(fileName.Trim());
        //    hdnFileName.Value = "";
        //}
    }

    private void DownloadFile(string fileName)
    {
        List<PrivateFileDetails> fileDetails = ((List<PrivateFileDetails>)Application["PrivateFileDetails"]);
        try
        {

            PrivateFileDetails file = (from f in fileDetails where f.fileName.Equals(fileName) select f).FirstOrDefault();
            Response.Clear();
            if (file != null)
            {
                MemoryStream ms = new MemoryStream(file.fileBytes);
                Response.ContentType = fileupload.PostedFile.ContentType;
                Response.AddHeader("content-disposition", "attachment;filename=" + file.fileName);
                Response.Buffer = true;
                ms.WriteTo(Response.OutputStream);
                Response.End();

            }
        }
        catch (Exception e) { }
        finally
        {

        }
    }
}