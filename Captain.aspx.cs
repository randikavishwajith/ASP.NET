using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;


namespace ProjectTest
{
    public partial class Captain : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                PopulateGridview();

            if (Session["New"] != null)
            {
                Label_Welcome.Text += Session["New"].ToString();
            }
            else
            {
                Response.Redirect("Login.aspx");
            }

            }

            DataTable DT = new DataTable();
            using (SqlConnection conn = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                conn.Open();
                SqlDataAdapter adapter = new SqlDataAdapter("SELECT * FROM EmployeeIdorName", conn);
                adapter.Fill(DT);
                rptMarkers.DataSource = DT;
                rptMarkers.DataBind();
            }

        }

        void PopulateGridview()
        {
            DataTable DT = new DataTable();
            using (SqlConnection conn = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                conn.Open();
                SqlDataAdapter adapter = new SqlDataAdapter("SELECT * FROM EmployeeIdorName", conn);
                adapter.Fill(DT);
            }
            if (DT.Rows.Count > 0)
            {
                GridView.DataSource = DT;
                GridView.DataBind();
            }
            else
            {
                DT.Rows.Add(DT.NewRow());
                GridView.DataSource = DT;
                GridView.DataBind();
                GridView.Rows[0].Cells.Clear();
                GridView.Rows[0].Cells.Add(new TableCell());
                GridView.Rows[0].Cells[0].ColumnSpan = DT.Columns.Count;
                GridView.Rows[0].Cells[0].Text = "No Data Found ..!";
                GridView.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }

        }
        protected void GridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {

                    if (e.CommandName == "Redmark")
                    {
                        conn.Open();
                        int index = Convert.ToInt32(e.CommandArgument);
                        string query = "UPDATE EmployeeIdorName SET FlagStat=@fs WHERE ID = @id";
                        SqlCommand command = new SqlCommand(query, conn);
                        command.Parameters.AddWithValue("@fs", "Red");
                        command.Parameters.AddWithValue("@id", Convert.ToInt32(GridView.DataKeys[index].Value.ToString()));
                        command.ExecuteNonQuery();
                        PopulateGridview();
                        SuccMes.Text = "Marker status successfully changed!";
                        ErrorMes.Text = "";
                        conn.Close();
                    }

                    if (e.CommandName == "Greenmark")
                    {
                        conn.Open();
                        int index = Convert.ToInt32(e.CommandArgument);
                        string query = "UPDATE EmployeeIdorName SET FlagStat=@fs WHERE ID = @id";
                        SqlCommand command = new SqlCommand(query, conn);
                        command.Parameters.AddWithValue("@fs", "Green");
                        command.Parameters.AddWithValue("@id", Convert.ToInt32(GridView.DataKeys[index].Value.ToString()));
                        command.ExecuteNonQuery();
                        PopulateGridview();
                        SuccMes.Text = "Marker status successfully changed!";
                        ErrorMes.Text = "";
                        conn.Close();
                    }

                    if (e.CommandName == "Apprv")
                    {
                        conn.Open();
                        int index = Convert.ToInt32(e.CommandArgument);
                        string query = "UPDATE EmployeeIdorName SET ApprovalStatus=@aprs WHERE ID = @id";
                        SqlCommand command = new SqlCommand(query, conn);
                        command.Parameters.AddWithValue("@aprs", "Approved");
                        command.Parameters.AddWithValue("@id", Convert.ToInt32(GridView.DataKeys[index].Value.ToString()));
                        command.ExecuteNonQuery();
                        PopulateGridview();
                        SuccMes.Text = "Approval status successfully changed!";
                        ErrorMes.Text = "";
                        conn.Close();
                    }

                    if (e.CommandName == "Disapprov")
                    {
                        int index = Convert.ToInt32(e.CommandArgument);
                        string query = "UPDATE EmployeeIdorName SET ApprovalStatus=@aprs WHERE ID = @id";
                        SqlCommand command = new SqlCommand(query, conn);
                        conn.Open();
                        command.Parameters.AddWithValue("@aprs", "Disapproved");
                        command.Parameters.AddWithValue("@id", Convert.ToInt32(GridView.DataKeys[index].Value.ToString()));
                        command.ExecuteNonQuery();
                        PopulateGridview();
                        SuccMes.Text = "Approval status successfully changed!";
                        ErrorMes.Text = "";
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                SuccMes.Text = "";
                ErrorMes.Text = ex.Message;
            }
        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            Session["New"] = null;
            Response.Redirect("Login.aspx");
        }

    }
}