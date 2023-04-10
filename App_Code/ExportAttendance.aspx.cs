using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.IO;
using System.Drawing;

public partial class ExportAttendance : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand(" select S.Regno,S.FirstName as Name,a.* from (select * from  (   select " +
            "StudentId, PresentApsent, Subject from tblAttendance ) src pivot (  count(PresentApsent) for Subject " +
            "in ([11O - 7305],[11O - 7308],[11O - 7306],[11O - 7307],[11O - 7310],[11O - 7401A],[11O - 7311]) )" +
            " piv)a left join tblStudent S on a.StudentId=S.Id", con);
        SqlDataAdapter ada = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        ada.Fill(ds, "tblattendance");
        GridView1.DataSource = ds.Tables["tblattendance"];
        GridView1.DataBind();
        con.Close();
    }
    protected void btnExport_Click(object sender, EventArgs e)
    {
        ExportGridToExcel();
    }
    public override void VerifyRenderingInServerForm(Control control)
    {
        //required to avoid the run time error "  
        //Control 'GridView1' of type 'Grid View' must be placed inside a form tag with runat=server."  
    }
    private void ExportGridToExcel()
    {
        Response.Clear();
        Response.Buffer = true;
        Response.ClearContent();
        Response.ClearHeaders();
        Response.Charset = "";
        string FileName = "Vithal" + DateTime.Now + ".xls";
        StringWriter strwritter = new StringWriter();
        HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.ContentType = "application/vnd.ms-excel";
        Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
        GridView1.GridLines = GridLines.Both;
        GridView1.HeaderStyle.Font.Bold = true;
        GridView1.RenderControl(htmltextwrtter);
        Response.Write(strwritter.ToString());
        Response.End();

    }  
}
