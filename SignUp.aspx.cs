using System;
using System.Data.SqlClient;
using System.Configuration;

namespace ProjectTest
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Visible = false;
            Label2.Visible = false;
            Label3.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();
                string insertQuery = "insert into UserData(UserStat,FirstName,LastName,Email,UserName,Password,Gender,City,Mobile)values(@us,@Fname,@Lname,@email,@Uname,@password,@gender,@city,@mob)";
                SqlCommand com = new SqlCommand(insertQuery, conn);
                com.Parameters.AddWithValue("@us", RadioButtonList2US.SelectedItem.ToString());
                com.Parameters.AddWithValue("@Fname", TextBox1FN.Text);
                com.Parameters.AddWithValue("@Lname", TextBox6LN.Text);
                com.Parameters.AddWithValue("@Uname", TextBox7UN.Text);
                com.Parameters.AddWithValue("@gender", RadioButtonList1Gend.SelectedItem.ToString());
                com.Parameters.AddWithValue("@city", TextBox5City.Text);
                com.Parameters.AddWithValue("@mob", TextBox6phone.Text);

                if (TextBox3PASS.Text.Length < 8)
                {
                    Label3.Text = "Password must contain at least 8 Characters!";
                    Label3.Visible = true;
                    return;
                }
                else
                {
                    com.Parameters.AddWithValue("@password", TextBox3PASS.Text);
                }


                string checkuser = "select count(*) from UserData where Email='" + TextBox2EMAIL.Text + "'";
                SqlCommand cmd = new SqlCommand(checkuser, conn);
                string temp = cmd.ExecuteScalar().ToString();
                if (temp == "1")
                {
                    Label1.Text = "A user with this Email is already exist!";
                    Label1.Visible = true;
                    conn.Close();
                }
                else
                {
                    com.Parameters.AddWithValue("@email", TextBox2EMAIL.Text);
                    com.ExecuteNonQuery();
                    Label2.Text = ("Registration is Successful");
                    Label2.Visible = true;
                    conn.Close();
                }
                
            }
            catch (Exception ex)
            {
                Response.Write("Error:" + ex.ToString());
            }
        }

        protected void DropDownList1COUNT_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}