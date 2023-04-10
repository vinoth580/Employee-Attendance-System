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

public partial class ApplyLeave : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            gridview();
       //     loadcboShopName();
        }
    }
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
        
    protected void btnSave_Click(object sender, EventArgs e)
    {
     
       
        con.Open();
        if (hf.Value == "")
        {
           // con.Open();

            SqlCommand cmd = new SqlCommand("insert into tbl_ApplyLeave (UserId,LeaveType,FromDate,ToDate,Description,AppliedDate" +
                ") values (@UserId,@LeaveType,@FromDate,@ToDate,@Description,@AppliedDate)", con);
            cmd.Parameters.AddWithValue("@UserId", Session["UserId"].ToString());
            cmd.Parameters.AddWithValue("@LeaveType", cboLeaveType.Text);
            cmd.Parameters.AddWithValue("@FromDate", txtFromDate.Text);
            cmd.Parameters.AddWithValue("@ToDate", txtToDate.Text);
            cmd.Parameters.AddWithValue("@Description", txtDescription.Text);
            cmd.Parameters.AddWithValue("@AppliedDate",DateTime.Now);
            //cmd.Parameters.AddWithValue("@ShopId", cboShopName.SelectedValue);
            
                cmd.ExecuteNonQuery();
                con.Close();
                gridview();
    
        }
        else
        {
            //con.Open();
    
                SqlCommand cmd = new SqlCommand("update tbl_ApplyLeave set  LeaveType=@LeaveType,FromDate=@FromDate,ToDate=@ToDate,Description=@Description where id=" + hf.Value, con);

            cmd.Parameters.AddWithValue("@LeaveType", cboLeaveType.Text);
            cmd.Parameters.AddWithValue("@FromDate", txtFromDate.Text);
            cmd.Parameters.AddWithValue("@ToDate", txtToDate.Text);
            cmd.Parameters.AddWithValue("@Description", txtDescription.Text);
            cmd.Parameters.AddWithValue("@AppliedDate", DateTime.Now);
            //cmd.Parameters.AddWithValue("@ShopId", cboShopName.SelectedValue);

            cmd.ExecuteNonQuery();
                con.Close();
                gridview();
        }
        txtToDate.Text = "";
        txtFromDate.Text = "";
        txtDescription.Text = "";
        
    }
    private void gridview()
    {
       // con.Open();

        con.Open();
        SqlCommand cmd = new SqlCommand("select * from tbl_ApplyLeave where UserId=@UserId", con);
        cmd.Parameters.AddWithValue("@UserId", Session["UserId"].ToString());
        SqlDataAdapter ada = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        ada.Fill(ds, "dbo.tbl_ApplyLeave");
        GridView.DataSource = ds.Tables["dbo.tbl_ApplyLeave"];
        GridView.DataBind();
        con.Close();

    }


    protected void lnkbtnEdit_Command(object sender, CommandEventArgs e)
    {
        hf.Value = e.CommandArgument.ToString();
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from dbo.tbl_ApplyLeave where Id=" + hf.Value.ToString(), con);

        SqlDataAdapter ada = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        ada.Fill(ds, "dbo.tbl_ApplyLeave");
        if (ds.Tables[0].Rows.Count > 0)
        {
           // fuImage. = ds.Tables["dbo.tbl_Product"].Rows[0]["ImagePath"].ToString();
            txtFromDate.Text = ds.Tables["dbo.tbl_ApplyLeave"].Rows[0]["FromDate"].ToString();
            txtDescription.Text = ds.Tables["dbo.tbl_ApplyLeave"].Rows[0]["Description"].ToString();
            txtToDate.Text = ds.Tables["dbo.tbl_ApplyLeave"].Rows[0]["ToDate"].ToString();
            cboLeaveType.Text = ds.Tables["dbo.tbl_ApplyLeave"].Rows[0]["LeaveType"].ToString();
        }
        else
        {
            txtFromDate.Text = "";
            txtDescription.Text = "";
        }
    }
    protected void lnkbtnDelete_Command(object sender, CommandEventArgs e)
    {
        hf.Value = e.CommandArgument.ToString();
        con.Open();
        SqlCommand cmd = new SqlCommand("delete  from tbl_ApplyLeave where Id=" + hf.Value, con);
        cmd.ExecuteNonQuery();
     
        con.Close();
        gridview();
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        txtFromDate.Text = "";
        txtDescription.Text = "";
    }
    protected void GridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView.PageIndex = e.NewPageIndex;
        gridview();
    }
}
