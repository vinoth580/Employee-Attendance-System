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


public partial class Report : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
    private void gridviewGvAttendnace()
    {
        // con.Open();

        con.Open();
        SqlCommand cmd = new SqlCommand("select * from (select R.FirstName,A.AttendanceDate,A.CheckInTime,A.CheckOutTime,month(AttendanceDate) as lMonth from tbl_AttendanceTime A left join tblRegister R on A.UserId=R.Id )a where lMonth  =@lMonth", con);
        cmd.Parameters.AddWithValue("@lMonth", cboLeaveType.SelectedValue);
        SqlDataAdapter ada = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        ada.Fill(ds, "Attendance");
        GvAttendance.DataSource = ds.Tables["Attendance"];
        GvAttendance.DataBind();
        con.Close();

    }
    private void gridviewGvLeave()
    {
        // con.Open();

        con.Open();
        SqlCommand cmd = new SqlCommand("select * from (select R.FirstName,A.LeaveType,A.FromDate,A.ToDate,A.Description,month(AppliedDate) as lMonth from tbl_ApplyLeave A left join tblRegister R on A.UserId=R.Id)a where lMonth  =@lMonth", con);
        cmd.Parameters.AddWithValue("@lMonth", cboLeaveType.SelectedValue);
        SqlDataAdapter ada = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        ada.Fill(ds, "Leave");
        GvLeave.DataSource = ds.Tables["Leave"];
        GvLeave.DataBind();
        con.Close();

    }
    private void gridviewGvPermission()
    {
        // con.Open();

        con.Open();
        SqlCommand cmd = new SqlCommand(" select * from (select R.FirstName,A.PermissionDate,A.PermissionHour,A.Reason,month(PermissionDate) as lMonth from tbl_Permission A left join tblRegister R on A.UserId=R.Id)a where lMonth  =@lMonth", con);
        cmd.Parameters.AddWithValue("@lMonth", cboLeaveType.SelectedValue);
        SqlDataAdapter ada = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        ada.Fill(ds, "Permission");
        GvPermission.DataSource = ds.Tables["Permission"];
        GvPermission.DataBind();
        con.Close();

    }
    private void ExportExcel()
    {
        //DataTable dt = new DataTable("GridView_Data");
        //foreach (TableCell cell in GvSuggestionList.HeaderRow.Cells)
        //{
        //    dt.Columns.Add(cell.Text);
        //}
        //string FileName = "EmployeeWise" + DateTime.Now.ToString("dd_MM_yyyy") + ".xlsx";
        //foreach (GridViewRow row in GvSuggestionList.Rows)
        //{
        //    dt.Rows.Add();
        //    for (int i = 0; i < row.Cells.Count; i++)
        //    {

        //        dt.Rows[dt.Rows.Count - 1][i] = row.Cells[i].Text.Replace("&nbsp;", "").Replace("amp;", "").Trim();
        //    }
        //}
        ////foreach(DataRow row in  ds.Tables[0].Rows)
        ////{
        ////    dt.Rows.Add();
        ////    for (int i = 0; i < ds.Tables[0].Columns.Count; i++)
        ////    {
        ////        dt.Rows[dt.Rows.Count - 1][i] = row[i].ToString().Trim();
        ////    }
        ////}
        //using (XLWorkbook wb = new XLWorkbook())
        //{
        //    wb.Worksheets.Add(dt);

        //    Response.Clear();
        //    Response.Buffer = true;
        //    Response.Charset = "";
        //    Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
        //    Response.AddHeader("content-disposition", "attachment;filename=" + FileName);
        //    using (MemoryStream MyMemoryStream = new MemoryStream())
        //    {
        //        wb.SaveAs(MyMemoryStream);
        //        MyMemoryStream.WriteTo(Response.OutputStream);
        //        Response.Flush();
        //        Response.End();
        //    }
        //}
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        gridviewGvAttendnace();
        gridviewGvLeave();
        gridviewGvPermission();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        ExportGridToExcelGvAttendance();
        
    }
    public override void VerifyRenderingInServerForm(Control control)
    {
        //required to avoid the run time error "  
        //Control 'GridView1' of type 'Grid View' must be placed inside a form tag with runat=server."  
    }
    private void ExportGridToExcelGvAttendance()
    {
        Response.Clear();
        Response.Buffer = true;
        Response.ClearContent();
        Response.ClearHeaders();
        Response.Charset = "";
        string FileName = "Attendance" + DateTime.Now + ".xls";
        StringWriter strwritter = new StringWriter();
        HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.ContentType = "application/vnd.ms-excel";
        Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
        GvAttendance.GridLines = GridLines.Both;
        GvAttendance.HeaderStyle.Font.Bold = true;
        GvAttendance.RenderControl(htmltextwrtter);
        Response.Write(strwritter.ToString());
        Response.End();

    }

    private void ExportGridToExcelGvLeave()
    {
        Response.Clear();
        Response.Buffer = true;
        Response.ClearContent();
        Response.ClearHeaders();
        Response.Charset = "";
        string FileName = "Leave" + DateTime.Now + ".xls";
        StringWriter strwritter = new StringWriter();
        HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.ContentType = "application/vnd.ms-excel";
        Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
        GvLeave.GridLines = GridLines.Both;
        GvLeave.HeaderStyle.Font.Bold = true;
        GvLeave.RenderControl(htmltextwrtter);
        Response.Write(strwritter.ToString());
        Response.End();

    }

    private void ExportGridToExcelGvPermission()
    {
        Response.Clear();
        Response.Buffer = true;
        Response.ClearContent();
        Response.ClearHeaders();
        Response.Charset = "";
        string FileName = "Permission" + DateTime.Now + ".xls";
        StringWriter strwritter = new StringWriter();
        HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.ContentType = "application/vnd.ms-excel";
        Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
        GvPermission.GridLines = GridLines.Both;
        GvPermission.HeaderStyle.Font.Bold = true;
        GvPermission.RenderControl(htmltextwrtter);
        Response.Write(strwritter.ToString());
        Response.End();

    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        ExportGridToExcelGvLeave();
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        ExportGridToExcelGvPermission();
    }
}