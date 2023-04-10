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


public partial class EmployeeRegistration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            MultiView1.ActiveViewIndex = 1;
            gridview();
        }
    }
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);

    protected void btnSave_Click(object sender, EventArgs e)
    {
        String path = Server.MapPath(".//images");
        if (!Directory.Exists(path))
        {
            Directory.CreateDirectory(path);
        }
        String Imagefilename = fuImage.FileName;
        if (fuImage.HasFile)
        {
            fuImage.PostedFile.SaveAs
                (path + "/" + Imagefilename);
        }
        string imagefullpath = "~/images/" + Imagefilename;

       
        con.Open();
        if (hf.Value == "")
        {
            string lpass = Guid.NewGuid().ToString().Substring(0, 4);

            SqlCommand cmd = new SqlCommand("insert into dbo.tblRegister (FirstName,Initial,Gender,EmailId," +
                        "Address,ImagePath,Mobileno,UserName,Password,DOB,BloodGroup,YearOfJoining,FathersName,Address1,Address2,Address3) values (@FirstName,@Initial,@Gender," +
                        "@EmailId,@Address,@ImagePath,@Mobileno,@UserName,@Password,@DOB,@BloodGroup,@YearOfJoining,@FathersName,@Address1,@Address2,@Address3)", con);
            cmd.Parameters.AddWithValue("@FirstName", txtName.Text);
            cmd.Parameters.AddWithValue("@Initial", cboInitial.Text);
            cmd.Parameters.AddWithValue("@Gender", rbtnMale.Checked?"Male":"Female");
            cmd.Parameters.AddWithValue("@EmailId", txtEmialId.Text);
            cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
            cmd.Parameters.AddWithValue("@ImagePath", imagefullpath);
            cmd.Parameters.AddWithValue("@Mobileno", txtMobileNo.Text);
            cmd.Parameters.AddWithValue("@UserName", txtUserName.Text);
            cmd.Parameters.AddWithValue("@Password", lpass);
            
            
            cmd.Parameters.AddWithValue("@DOB", txtDOB.Text);
            cmd.Parameters.AddWithValue("@BloodGroup", txtBloodGroup.Text);
            cmd.Parameters.AddWithValue("@YearOfJoining", txtYearOfJoining.Text);
            cmd.Parameters.AddWithValue("@FathersName", txtFathersName.Text);
            cmd.Parameters.AddWithValue("@Address1", txtAddress1.Text);
            cmd.Parameters.AddWithValue("@Address2", txtAddress2.Text);
            cmd.Parameters.AddWithValue("@Address3", txtAddress3.Text);

            cmd.ExecuteNonQuery();
            con.Close();
            gridview();

        }
        else
        {
            //con.Open();
            if (fuImage.HasFile)
            {
                SqlCommand cmd = new SqlCommand("update tblRegister set FirstName=@FirstName,Initial=@Initial" +
                    ",Gender=@Gender,EmailId=@EmailId,Address=@Address,ImagePath=@ImagePath," +
                    "Mobileno=@Mobileno,UserName=@UserName, " +
                    "DOB=@DOB,BloodGroup=@BloodGroup,YearOfJoining=@YearOfJoining,FathersName=@FathersName,Address1=@Address1,Address2=@Address2,Address3=@Address3 where id=" + hf.Value, con);
                cmd.Parameters.AddWithValue("@FirstName", txtName.Text);
                cmd.Parameters.AddWithValue("@Initial", cboInitial.Text);
                cmd.Parameters.AddWithValue("@Gender", rbtnMale.Checked ? "Male" : "Female");
                cmd.Parameters.AddWithValue("@EmailId", txtEmialId.Text);
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                cmd.Parameters.AddWithValue("@ImagePath", imagefullpath);
                cmd.Parameters.AddWithValue("@Mobileno", txtMobileNo.Text);
                cmd.Parameters.AddWithValue("@UserName", txtUserName.Text);
                cmd.Parameters.AddWithValue("@DOB", txtDOB.Text);
                cmd.Parameters.AddWithValue("@BloodGroup", txtBloodGroup.Text);
                cmd.Parameters.AddWithValue("@YearOfJoining", txtYearOfJoining.Text);
                cmd.Parameters.AddWithValue("@FathersName", txtFathersName.Text);
                cmd.Parameters.AddWithValue("@Address1", txtAddress1.Text);
                cmd.Parameters.AddWithValue("@Address2", txtAddress2.Text);
                cmd.Parameters.AddWithValue("@Address3", txtAddress3.Text);


                cmd.ExecuteNonQuery();
                con.Close();
                gridview();
            }
            else
            {

                SqlCommand cmd = new SqlCommand("update tblRegister set FirstName=@FirstName,Initial=@Initial" +
                    ",Gender=@Gender,EmailId=@EmailId,Address=@Address," +
                    "Mobileno=@Mobileno,UserName=@UserName " +
                    ",DOB=@DOB,BloodGroup=@BloodGroup,YearOfJoining=@YearOfJoining,FathersName=@FathersName,Address1=@Address1,Address2=@Address2,Address3=@Address3 where id=" + hf.Value, con);
                cmd.Parameters.AddWithValue("@FirstName", txtName.Text);
                cmd.Parameters.AddWithValue("@Initial", cboInitial.Text);
                cmd.Parameters.AddWithValue("@Gender", rbtnMale.Checked ? "Male" : "Female");
                cmd.Parameters.AddWithValue("@EmailId", txtEmialId.Text);
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                cmd.Parameters.AddWithValue("@Mobileno", txtMobileNo.Text);
                cmd.Parameters.AddWithValue("@UserName", txtUserName.Text);
                
                cmd.Parameters.AddWithValue("@DOB", txtDOB.Text);
                cmd.Parameters.AddWithValue("@BloodGroup", txtBloodGroup.Text);
                cmd.Parameters.AddWithValue("@YearOfJoining", txtYearOfJoining.Text);
                cmd.Parameters.AddWithValue("@FathersName", txtFathersName.Text);
                cmd.Parameters.AddWithValue("@Address1", txtAddress1.Text);
                cmd.Parameters.AddWithValue("@Address2", txtAddress2.Text);
                cmd.Parameters.AddWithValue("@Address3", txtAddress3.Text);
                cmd.ExecuteNonQuery();
                con.Close();
                gridview();
                
            }
            
        }
        txtAddress.Text = "";
        txtEmialId.Text = "";
        txtName.Text = "";
        txtBloodGroup.Text = "";
        txtMobileNo.Text = "";
        
        txtDOB.Text = "";
        txtUserName.Text = "";
        
        txtYearOfJoining.Text = "";
        txtFathersName.Text = "";
        txtAddress1.Text = "";
        txtAddress2.Text = "";
        txtAddress3.Text = "";
    }
    private void gridview()
    {
        // con.Open();

        con.Open();
        SqlCommand cmd = new SqlCommand("select * from tblRegister", con);
        SqlDataAdapter ada = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        ada.Fill(ds, "tblRegister");
        GridView.DataSource = ds.Tables["tblRegister"];
        GridView.DataBind();
        con.Close();

    }


    protected void lnkbtnEdit_Command(object sender, CommandEventArgs e)
    {
        hf.Value = e.CommandArgument.ToString();
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from tblRegister where Id=" + hf.Value.ToString(), con);

        SqlDataAdapter ada = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        ada.Fill(ds, "tblRegister");
        if (ds.Tables[0].Rows.Count > 0)
        {
            // fuImage. = ds.Tables["tblRegister"].Rows[0]["ImagePath"].ToString();
            txtName.Text = ds.Tables["tblRegister"].Rows[0]["FirstName"].ToString();
            cboInitial.Text = ds.Tables["tblRegister"].Rows[0]["Initial"].ToString();
            txtEmialId.Text = ds.Tables["tblRegister"].Rows[0]["EmailId"].ToString();
            txtAddress.Text = ds.Tables["tblRegister"].Rows[0]["Address"].ToString();
            txtMobileNo.Text = ds.Tables["tblRegister"].Rows[0]["Mobileno"].ToString();
            txtUserName.Text = ds.Tables["tblRegister"].Rows[0]["UserName"].ToString();
        
            txtDOB.Text = ds.Tables["tblRegister"].Rows[0]["DOB"].ToString();
            txtBloodGroup.Text = ds.Tables["tblRegister"].Rows[0]["BloodGroup"].ToString();
            txtYearOfJoining.Text = ds.Tables["tblRegister"].Rows[0]["YearOfJoining"].ToString();
            txtFathersName.Text = ds.Tables["tblStaff"].Rows[0]["FathersName"].ToString();
            txtAddress1.Text = ds.Tables["tblStaff"].Rows[0]["Address1"].ToString();
            txtAddress2.Text = ds.Tables["tblStaff"].Rows[0]["Address2"].ToString();
            txtAddress3.Text = ds.Tables["tblStaff"].Rows[0]["Address3"].ToString();

        }
    }
    protected void lnkbtnDelete_Command(object sender, CommandEventArgs e)
    {
        hf.Value = e.CommandArgument.ToString();
        con.Open();
        SqlCommand cmd = new SqlCommand("delete  from tblRegister where Id=" + hf.Value, con);
        cmd.ExecuteNonQuery();

        con.Close();
        gridview();
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        
    }
    protected void GridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView.PageIndex = e.NewPageIndex;
        SqlCommand cmd = new SqlCommand("select * from tblRegister", con);

        SqlDataAdapter ada = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        ada.Fill(ds, "tblRegister");
        GridView.DataSource = ds.Tables["tblRegister"];
        GridView.DataBind();
        GridView.DataBind();
    }
    protected void ltbnViewList_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;
    }
    protected void ltbnAddNew_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
    }
}
