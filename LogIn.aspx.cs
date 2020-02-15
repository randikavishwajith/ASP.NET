using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;

namespace ProjectTest
{
    public partial class LogIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["UserName"] != null && Request.Cookies["Password"] != null)
                {
                    TextBoxUN.Text = Request.Cookies["UserName"].Value;
                    TextBoxPassword.Attributes["value"] = Request.Cookies["Password"].Value;
                }

                Label1.Visible = false;
            }
        }
        protected void Button_Login_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string checkuser = "select count(*) from UserData where UserName='" + TextBoxUN.Text + "'";
            SqlCommand com = new SqlCommand(checkuser, conn);
            int temp = int.Parse(com.ExecuteScalar().ToString()); 
            if (temp == 1)
            { 
                string checkPasswordQuery = "select password from UserData where UserName='" + TextBoxUN.Text + "'";
                SqlCommand passComm = new SqlCommand(checkPasswordQuery, conn);
                string password = passComm.ExecuteScalar().ToString().Replace(" ", "");
                if (password == TextBoxPassword.Text)
                {
                    if (ChkMe.Checked)
                    {
                        Response.Cookies["UserName"].Value = TextBoxUN.Text;
                        Response.Cookies["Password"].Value = TextBoxPassword.Text;
                        Response.Cookies["UserName"].Expires = DateTime.Now.AddMinutes(1);
                        Response.Cookies["Password"].Expires = DateTime.Now.AddMinutes(1);
                    }
                    else
                    {
                        Response.Cookies["UserName"].Expires = DateTime.Now.AddMinutes(-1);
                        Response.Cookies["Password"].Expires = DateTime.Now.AddMinutes(-1);
                    }

                    string checkadmin = "select count(*) from UserData where (UserName='" + TextBoxUN.Text + "' AND UserStat='Admin')";
                    SqlCommand cmd1 = new SqlCommand(checkadmin, conn);
                    string temp1 = cmd1.ExecuteScalar().ToString();
                    if (temp1 == "1")
                    {
                        Session["New"] = TextBoxUN.Text;
                        Label1.Text = "Password is correct";
                        Label1.ForeColor = Color.Red;
                        Label1.Visible = true;
                        Response.Redirect("Admin.aspx");
                        conn.Close();
                    }

                    else
                    {
                        string checkcaptain = "select count(*) from UserData where(UserName='" + TextBoxUN.Text + "' AND UserStat='Captain')";
                        SqlCommand cmd2 = new SqlCommand(checkcaptain, conn);
                        string temp2 = cmd2.ExecuteScalar().ToString();
                        if (temp2 == "1")
                        {
                            Session["New"] = TextBoxUN.Text;
                            Label1.Text = "Password is correct";
                            Label1.ForeColor = Color.Red;
                            Label1.Visible = true;
                            Response.Redirect("Captain.aspx");
                            conn.Close();
                        }
                        else
                        {
                            string checkmember = "select count(*) from UserData where (UserName='" + TextBoxUN.Text + "' AND UserStat='Member')";
                            SqlCommand cmd3 = new SqlCommand(checkmember, conn);
                            string temp3 = cmd3.ExecuteScalar().ToString();
                            if (temp3 == "1")
                            {
                                Session["New"] = TextBoxUN.Text;
                                Label1.Text = "Password is correct";
                                Label1.ForeColor = Color.Red;
                                Label1.Visible = true;
                                Response.Redirect("Member.aspx");
                                conn.Close();
                            }
                            else
                            {
                                string checkStaff = "select count(*) from UserData where (UserName='" + TextBoxUN.Text + "' AND UserStat='Staff')";
                                SqlCommand cmd4 = new SqlCommand(checkStaff, conn);
                                string temp4 = cmd4.ExecuteScalar().ToString();
                                if (temp4 == "1")
                                {
                                    Session["New"] = TextBoxUN.Text;
                                    Label1.Text = "Password is correct";
                                    Label1.ForeColor = Color.Red;
                                    Label1.Visible = true;
                                    Response.Redirect("Staff.aspx");
                                    conn.Close();
                                }
                            }
                        }  
                    }

                }
                else
                {
                    Label1.Text = "Password is Incorrect";
                    Label1.ForeColor = Color.Red;
                    Label1.Visible = true;
                    conn.Close();
                }
            }
            else
            {
                Label1.Text = "Username is Incorrect";
                Label1.ForeColor = Color.Red;
                Label1.Visible = true;
                conn.Close();
            }
            
        }

        protected void TextBoxUN_TextChanged(object sender, EventArgs e)
        {

        }
    }
}