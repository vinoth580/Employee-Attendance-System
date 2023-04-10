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

public partial class StudentAttandance : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            loadSubject();
            gridview();
            //lblDate.Text = DateTime.Now.ToString();
        }
    }
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
    private void gridview()
    {
        // con.Open();

        con.Open();
        SqlCommand cmd = new SqlCommand("select * from tblStudent", con);
        SqlDataAdapter ada = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        ada.Fill(ds, "tblStudent");
        GvStudentAttendance.DataSource = ds.Tables["tblStudent"];
        GvStudentAttendance.DataBind();
        con.Close();

    }
    private void loadSubject()
    {
        // con.Open();

        con.Open();
        SqlCommand cmd = new SqlCommand("select * from tbl_Subject", con);
        SqlDataAdapter ada = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        ada.Fill(ds, "tbl_Subject");
        cboSubject.DataSource = ds.Tables["tbl_Subject"];
        cboSubject.DataTextField = "Subject";
        cboSubject.DataValueField= "Id";
        cboSubject.DataBind();
        con.Close();

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Session["StaffId"] != null)
        {
            foreach (GridViewRow row in GvStudentAttendance.Rows)//Running all lines of grid
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkRow1 = (row.Cells[0].FindControl("chkstudent1") as CheckBox);
                    HiddenField hfID1 = (row.Cells[0].FindControl("HiddenField1") as HiddenField);

                    CheckBox chkRow2 = (row.Cells[0].FindControl("chkstudent2") as CheckBox);
                    HiddenField hfID2 = (row.Cells[0].FindControl("HiddenField2") as HiddenField);

                    CheckBox chkRow3 = (row.Cells[0].FindControl("chkstudent3") as CheckBox);
                    HiddenField hfID3 = (row.Cells[0].FindControl("HiddenField3") as HiddenField);

                    CheckBox chkRow4 = (row.Cells[0].FindControl("chkstudent4") as CheckBox);
                    HiddenField hfID4 = (row.Cells[0].FindControl("HiddenField4") as HiddenField);

                    CheckBox chkRow5 = (row.Cells[0].FindControl("chkstudent5") as CheckBox);
                    HiddenField hfID5 = (row.Cells[0].FindControl("HiddenField5") as HiddenField);

                    CheckBox chkRow6 = (row.Cells[0].FindControl("chkstudent6") as CheckBox);
                    HiddenField hfID6 = (row.Cells[0].FindControl("HiddenField6") as HiddenField);

                    CheckBox chkRow7 = (row.Cells[0].FindControl("chkstudent7") as CheckBox);
                    HiddenField hfID7 = (row.Cells[0].FindControl("HiddenField7") as HiddenField);

                    CheckBox chkRow8 = (row.Cells[0].FindControl("chkstudent8") as CheckBox);
                    HiddenField hfID8 = (row.Cells[0].FindControl("HiddenField8") as HiddenField);


                    string sql = "Insert into tblAttendance (StudentId,PresentApsent,DateOfAttandance,StaffId,Period,Subject) " +
                            "values(@StudentId,@PresentApsent,@DateOfAttandance,@StaffId,@Period,@Subject)";
                    if (chkRow1.Checked)
                    {
                        
                        SqlCommand cmd = new SqlCommand(sql, con);
                        cmd.Parameters.AddWithValue("@StudentId", hfID1.Value);
                        cmd.Parameters.AddWithValue("@PresentApsent", chkRow1.Checked);
                        cmd.Parameters.AddWithValue("@DateOfAttandance", DateTime.Now);
                        cmd.Parameters.AddWithValue("@StaffId", Session["StaffId"].ToString());
                        cmd.Parameters.AddWithValue("@Period", "P1");
                        cmd.Parameters.AddWithValue("@Subject", cboSubject.SelectedItem.Text);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();

                    }
                    if (chkRow2.Checked)
                    {
                        
                        SqlCommand cmd = new SqlCommand(sql, con);
                        cmd.Parameters.AddWithValue("@StudentId", hfID2.Value);
                        cmd.Parameters.AddWithValue("@PresentApsent", chkRow2.Checked);
                        cmd.Parameters.AddWithValue("@DateOfAttandance", DateTime.Now);
                        cmd.Parameters.AddWithValue("@StaffId", Session["StaffId"].ToString());
                        cmd.Parameters.AddWithValue("@Period", "P2");
                        cmd.Parameters.AddWithValue("@Subject", cboSubject.SelectedItem.Text);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();

                    }
                    if (chkRow3.Checked)
                    {
                        
                        SqlCommand cmd = new SqlCommand(sql, con);
                        cmd.Parameters.AddWithValue("@StudentId", hfID3.Value);
                        cmd.Parameters.AddWithValue("@PresentApsent", chkRow3.Checked);
                        cmd.Parameters.AddWithValue("@DateOfAttandance", DateTime.Now);
                        cmd.Parameters.AddWithValue("@StaffId", Session["StaffId"].ToString());
                        cmd.Parameters.AddWithValue("@Period", "P3");
                        cmd.Parameters.AddWithValue("@Subject", cboSubject.SelectedItem.Text);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();

                    }
                    if (chkRow4.Checked)
                    {
                        
                        SqlCommand cmd = new SqlCommand(sql, con);
                        cmd.Parameters.AddWithValue("@StudentId", hfID4.Value);
                        cmd.Parameters.AddWithValue("@PresentApsent", chkRow4.Checked);
                        cmd.Parameters.AddWithValue("@DateOfAttandance", DateTime.Now);
                        cmd.Parameters.AddWithValue("@StaffId", Session["StaffId"].ToString());
                        cmd.Parameters.AddWithValue("@Period", "P4");
                        cmd.Parameters.AddWithValue("@Subject", cboSubject.SelectedItem.Text);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();

                    }
                    if (chkRow5.Checked)
                    {
                        
                        SqlCommand cmd = new SqlCommand(sql, con);
                        cmd.Parameters.AddWithValue("@StudentId", hfID5.Value);
                        cmd.Parameters.AddWithValue("@PresentApsent", chkRow5.Checked);
                        cmd.Parameters.AddWithValue("@DateOfAttandance", DateTime.Now);
                        cmd.Parameters.AddWithValue("@StaffId", Session["StaffId"].ToString());
                        cmd.Parameters.AddWithValue("@Period", "P5");
                        cmd.Parameters.AddWithValue("@Subject", cboSubject.SelectedItem.Text);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();

                    }
                    if (chkRow6.Checked)
                    {
                        
                        SqlCommand cmd = new SqlCommand(sql, con);
                        cmd.Parameters.AddWithValue("@StudentId", hfID6.Value);
                        cmd.Parameters.AddWithValue("@PresentApsent", chkRow6.Checked);
                        cmd.Parameters.AddWithValue("@DateOfAttandance", DateTime.Now);
                        cmd.Parameters.AddWithValue("@StaffId", Session["StaffId"].ToString());
                        cmd.Parameters.AddWithValue("@Period", "P6");
                        cmd.Parameters.AddWithValue("@Subject", cboSubject.SelectedItem.Text);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();

                    }
                    if (chkRow7.Checked)
                    {
                        
                        SqlCommand cmd = new SqlCommand(sql, con);
                        cmd.Parameters.AddWithValue("@StudentId", hfID7.Value);
                        cmd.Parameters.AddWithValue("@PresentApsent", chkRow7.Checked);
                        cmd.Parameters.AddWithValue("@DateOfAttandance", DateTime.Now);
                        cmd.Parameters.AddWithValue("@StaffId", Session["StaffId"].ToString());
                        cmd.Parameters.AddWithValue("@Period", "P7");
                        cmd.Parameters.AddWithValue("@Subject", cboSubject.SelectedItem.Text);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();

                    }
                    if (chkRow8.Checked)
                    {
                        
                        SqlCommand cmd = new SqlCommand(sql, con);
                        cmd.Parameters.AddWithValue("@StudentId", hfID8.Value);
                        cmd.Parameters.AddWithValue("@PresentApsent", chkRow8.Checked);
                        cmd.Parameters.AddWithValue("@DateOfAttandance", DateTime.Now);
                        cmd.Parameters.AddWithValue("@StaffId", Session["StaffId"].ToString());
                        cmd.Parameters.AddWithValue("@Period", "P8");
                        cmd.Parameters.AddWithValue("@Subject", cboSubject.SelectedItem.Text);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();

                    }
                }

            }
        }
    }
}
