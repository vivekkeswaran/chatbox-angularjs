using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class FileBrowser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void download_OnClick(object sender, EventArgs e)
    {
        string fileName = hdnFileName.Value;

        if (!string.IsNullOrEmpty(fileName))
        {
            DownloadFile(fileName.Trim());
            hdnFileName.Value = "";
        }
    }

    protected void btnShare_OnClick(object sender, EventArgs e)
    {
        FileDetails file = new FileDetails();
        file.fileBytes = fileupload.FileBytes;
        file.fileName = fileupload.FileName;
        file.time = DateTime.Now.ToString("hh:mm");
        file.extension = fileupload.FileName.Substring(fileupload.FileName.LastIndexOf(".") + 1);

        ((List<FileDetails>)Application["UploadedFileDetails"]).Add(file);
    }

    private void DownloadFile(string fileName)
    {
        List<FileDetails> fileDetails = ((List<FileDetails>)Application["UploadedFileDetails"]);
        try
        {
            fileName = Server.HtmlDecode(fileName);
            FileDetails file = (from f in fileDetails where f.fileName.Equals(fileName) select f).FirstOrDefault();
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