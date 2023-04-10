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

public partial class PutAttendance : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!Page.IsPostBack)
        {
            gridview();
        }
    }
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
    protected void btnCheckin_Click(object sender, EventArgs e)
    {


        con.Open();
       
            SqlCommand cmd = new SqlCommand("insert into tbl_AttendanceTime (UserId,AttendanceDate,CheckInTime) values (@UserId,@AttendanceDate,@CheckInTime)", con);
            cmd.Parameters.AddWithValue("@UserId", Session["UserId"].ToString());
            cmd.Parameters.AddWithValue("@AttendanceDate", DateTime.Now);
            cmd.Parameters.AddWithValue("@CheckInTime", DateTime.Now);
            //cmd.Parameters.AddWithValue("@CheckOutTime", DateTime.Now);

            cmd.ExecuteNonQuery();
            con.Close();
            gridview();

    }

    private void gridview()
    {
        // con.Open();

        con.Open();
        SqlCommand cmd = new SqlCommand("select * from tbl_AttendanceTime where UserId=@UserId", con);
        cmd.Parameters.AddWithValue("@UserId", Session["UserId"].ToString());
        SqlDataAdapter ada = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        ada.Fill(ds, "tblStudent");
        GridView.DataSource = ds.Tables["tblStudent"];
        GridView.DataBind();
        con.Close();

    }
    protected void btnCheckOut_Click(object sender, EventArgs e)
    {
        con.Open();

        SqlCommand cmd = new SqlCommand("insert into tbl_AttendanceTime (UserId,AttendanceDate,CheckOutTime) values (@UserId,@AttendanceDate,@CheckOutTime)", con);
        cmd.Parameters.AddWithValue("@UserId", Session["UserId"].ToString());
        cmd.Parameters.AddWithValue("@AttendanceDate", DateTime.Now );
        
        cmd.Parameters.AddWithValue("@CheckOutTime", DateTime.Now);

        cmd.ExecuteNonQuery();
        con.Close();
        gridview();

    }
    protected void GridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView.PageIndex = e.NewPageIndex;
        gridview();
    }
}