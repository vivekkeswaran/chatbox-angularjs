using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class mychat : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void lnkbtnLogOut_OnClick(object sender, EventArgs e)
    {
        String userId = Session.SessionID;
        ((Dictionary<String, String>)Application["UserList"]).Remove(userId);
        Response.Redirect("~/Default.aspx");
    }

    protected void lnkbtnPrivateStore_OnClick(object sender, EventArgs e)
    {

        Response.Redirect("/FileStore.aspx");
    }

    private void DownloadFile(string fileName)
    {
        //List<FileDetails> fileDetails = ((List<FileDetails>)Application["UploadedFileDetails"]);
        //try
        //{

        //    FileDetails file = (from f in fileDetails where f.fileName.Equals(fileName) select f).FirstOrDefault();
        //    Response.Clear();
        //    if (file != null)
        //    {
        //        MemoryStream ms = new MemoryStream(file.fileBytes);
        //        Response.ContentType = fileupload.PostedFile.ContentType;
        //        Response.AddHeader("content-disposition", "attachment;filename=" + file.fileName);
        //        Response.Buffer = true;
        //        ms.WriteTo(Response.OutputStream);
        //        Response.End();
        //        ScriptManager.RegisterStartupScript(this, this.GetType(), "onload", "javascript:location.reload(true);", true);
        //    }
        //}
        //catch (Exception e) { }
        //finally
        //{
        //    Page.ClientScript.RegisterStartupScript(Page.GetType(), "javascript", "show();", true);
        //}
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

    [WebMethod]
    public static string GetMessage()
    {

        return "Dummy Message";
    }

    [WebMethod]
    public static string downloadFile(string fileName)
    {
        //
        return "s";
    }


    protected void btnShare_OnClick(object sender, EventArgs e)
    {
        //FileDetails file = new FileDetails();
        //file.fileBytes = fileupload.FileBytes;
        //file.fileName = fileupload.FileName;
        //file.time = DateTime.Now.ToString("hh:mm");
        //file.extension = fileupload.FileName.Substring(fileupload.FileName.LastIndexOf(".") + 1);

        //((List<FileDetails>)Application["UploadedFileDetails"]).Add(file);
    }

    protected void btnBeforeOk_ServerClick(object sender, EventArgs e)
    {

    }
}