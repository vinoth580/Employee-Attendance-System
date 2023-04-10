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
public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (txtUserName.Text == "admin" && txtPassword.Text == "admin")
        {
            Response.Redirect("EmployeeRegistration.aspx");
        }
        else
        {

            SqlCommand cmd = new SqlCommand("select * from tblRegister where UserName=@UserName and Password=@Password", con);
            cmd.Parameters.AddWithValue("UserName", txtUserName.Text);
            cmd.Parameters.AddWithValue("Password", txtPassword.Text);
            SqlDataAdapter ada = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            ada.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Session["UserId"] = dt.Rows[0]["Id"].ToString();
                Response.Redirect("PutAttendance.aspx");
            }
        }
        
    }
}
