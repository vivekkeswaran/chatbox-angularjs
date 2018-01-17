using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class FileStoreFileSection : System.Web.UI.Page
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
                Response.ContentType = file.ContentType;
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