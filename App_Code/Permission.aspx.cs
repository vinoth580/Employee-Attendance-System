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

public partial class Permission : System.Web.UI.Page 
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

            SqlCommand cmd = new SqlCommand("insert into tbl_Permission (UserId,PermissionDate,PermissionHour,Reason" +
                ") values (@UserId,@PermissionDate,@PermissionHour,@Reason)", con);
            cmd.Parameters.AddWithValue("@UserId", Session["UserId"].ToString());
            cmd.Parameters.AddWithValue("@PermissionDate", txtPermissionDate.Text);
            cmd.Parameters.AddWithValue("@PermissionHour", txtPermissionHour.Text);
            cmd.Parameters.AddWithValue("@Reason", txtReason.Text);
            
                cmd.ExecuteNonQuery();
                con.Close();
                gridview();
    
        }
        else
        {
            //con.Open();
    
                SqlCommand cmd = new SqlCommand("update tbl_Permission set  PermissionDate=@PermissionDate,PermissionHour=@PermissionHour,Reason=@Reason  where id=" + hf.Value, con);

            cmd.Parameters.AddWithValue("@UserId", Session["UserId"].ToString());
            cmd.Parameters.AddWithValue("@PermissionDate", txtPermissionDate.Text);
            cmd.Parameters.AddWithValue("@PermissionHour", txtPermissionHour.Text);
            cmd.Parameters.AddWithValue("@Reason", txtReason.Text);

            cmd.ExecuteNonQuery();
                con.Close();
                gridview();
        }
        txtPermissionHour.Text = "";
        txtPermissionDate.Text = "";
        txtReason.Text = "";
        
    }
    private void gridview()
    {
       // con.Open();

        con.Open();
        SqlCommand cmd = new SqlCommand("select * from tbl_Permission where UserId=@UserId", con);
        cmd.Parameters.AddWithValue("@UserId", Session["UserId"].ToString());
        SqlDataAdapter ada = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        ada.Fill(ds, "dbo.tbl_Permission");
        GridView.DataSource = ds.Tables["dbo.tbl_Permission"];
        GridView.DataBind();
        con.Close();

    }


    protected void lnkbtnEdit_Command(object sender, CommandEventArgs e)
    {
        hf.Value = e.CommandArgument.ToString();
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from dbo.tbl_Permission where Id=" + hf.Value.ToString(), con);

        SqlDataAdapter ada = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        ada.Fill(ds, "dbo.tbl_Permission");
        if (ds.Tables[0].Rows.Count > 0)
        {
           // fuImage. = ds.Tables["dbo.tbl_Product"].Rows[0]["ImagePath"].ToString();
            txtPermissionDate.Text = ds.Tables["dbo.tbl_Permission"].Rows[0]["PermissionDate"].ToString();
            txtReason.Text = ds.Tables["dbo.tbl_Permission"].Rows[0]["Reason"].ToString();
            txtPermissionHour.Text = ds.Tables["dbo.tbl_Permission"].Rows[0]["PermissionHour"].ToString();
            
        }
        else
        {
            txtPermissionDate.Text = "";
            txtReason.Text = "";
        }
    }
    protected void lnkbtnDelete_Command(object sender, CommandEventArgs e)
    {
        hf.Value = e.CommandArgument.ToString();
        con.Open();
        SqlCommand cmd = new SqlCommand("delete  from tbl_Permission where Id=" + hf.Value, con);
        cmd.ExecuteNonQuery();
     
        con.Close();
        gridview();
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        txtPermissionDate.Text = "";
        txtReason.Text = "";
    }
    protected void GridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView.PageIndex = e.NewPageIndex;
        gridview();
    }
}
