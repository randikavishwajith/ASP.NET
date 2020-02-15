using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.UI.WebControls;
using System.IO;

namespace ProjectTest
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                PopulateGridview();
                Label2.Visible = false;

            if (Session["New"] != null)
            {
                Label_Welcome.Text += Session["New"].ToString();
            }
            else
            {
                Response.Redirect("Login.aspx");
            }

            }
        }

        void PopulateGridview()
        {
            DataTable DT = new DataTable();
            using (SqlConnection conn = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                conn.Open();
                SqlDataAdapter adapter = new SqlDataAdapter("SELECT Id,UserStat,FirstName,LastName,Email,Gender,City,Mobile FROM UserData where UserStat<>'Admin' AND UserStat<>'Staff'", conn);
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
                    if (e.CommandName == "make")
                    {
                        conn.Open();
                        int index = Convert.ToInt32(e.CommandArgument);
                        string query = "UPDATE UserData SET UserStat=@us WHERE ID = @id";
                        SqlCommand command = new SqlCommand(query, conn);
                        command.Parameters.AddWithValue("@us", "Captain");
                        command.Parameters.AddWithValue("@id", Convert.ToInt32(GridView.DataKeys[index].Value.ToString()));
                        command.ExecuteNonQuery();
                        PopulateGridview();
                        SuccMes.Text = "Selected Member is now a Captain!";
                        ErrorMes.Text = "";
                        conn.Close();
                    }

                    if (e.CommandName == "remove")
                    {
                        conn.Open();
                        int index = Convert.ToInt32(e.CommandArgument);
                        string query = "UPDATE UserData SET UserStat=@us WHERE ID = @id";
                        SqlCommand command = new SqlCommand(query, conn);
                        command.Parameters.AddWithValue("@us", "Member");
                        command.Parameters.AddWithValue("@id", Convert.ToInt32(GridView.DataKeys[index].Value.ToString()));
                        command.ExecuteNonQuery();
                        PopulateGridview();
                        SuccMes.Text = "Selected Captain is now a Member!";
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

        protected void Subart_Click(object sender, EventArgs e)
        {
            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
                SqlConnection conn = new SqlConnection(connStr);
                conn.Open();
                SqlDataAdapter adapter = new SqlDataAdapter();
                String sql = "insert into Articles (AdminArt,AdminTxt,Image) values (@aa,@at,@img)";
                SqlCommand command = new SqlCommand(sql, conn);

                string textt = Request.Form["textt"];
                string fileExtension = Path.GetExtension(FileUpload.FileName);
                int fileSize = FileUpload.PostedFile.ContentLength;
                string savePath = "/Uploads/Admin/";

                if (fileExtension != "" && fileExtension.ToUpper() != ".jpg" && fileExtension.ToUpper() != ".jpeg" && fileExtension.ToUpper() != ".png"
                   && fileExtension.ToLower() != ".jpg" && fileExtension.ToLower() != ".jpeg" && fileExtension.ToLower() != ".png")
                {
                    Label2.Visible = true;
                    Label2.ForeColor = System.Drawing.Color.Red;
                    Label2.Text = "Only files with .jpg, .jpeg, .gif and .png extension are allowed";
                    conn.Close();
                }

                else if (fileSize > 15728640)
                {
                    Label2.Visible = true;
                    Label2.ForeColor = System.Drawing.Color.Red;
                    Label2.Text = "File size cannot be greater than 15MB!";
                }

                else if (textt=="")
                {
                    Label2.Visible = true;
                    Label2.ForeColor = System.Drawing.Color.Red;
                    Label2.Text = "You cannot leave article empty!";
                }

                else if (head.Text == "")
                {
                    Label2.Visible = true;
                    Label2.ForeColor = System.Drawing.Color.Red;
                    Label2.Text = "You cannot leave heading empty!";
                }

                else
                {
                    adapter.InsertCommand = command;
                    command.Parameters.AddWithValue("@aa", head.Text);
                    command.Parameters.AddWithValue("@at", textt);


                    if (FileUpload.HasFile)
                    {

                        string FileName = SaveFile(FileUpload.PostedFile);
                        string SaveFile(HttpPostedFile file)
                        {

                            string fileName = FileUpload.FileName;

                            string pathToCheck = savePath + fileName;

                            string tempfileName = "";

                            if (File.Exists(Server.MapPath(pathToCheck)))
                            {
                                int counter = 2;
                                while (File.Exists(Server.MapPath(pathToCheck)))
                                {

                                    tempfileName = counter.ToString() + fileName;
                                    pathToCheck = savePath + tempfileName;
                                    counter++;
                                }

                                fileName = tempfileName;

                            }

                            savePath += fileName;

                            FileUpload.SaveAs(Server.MapPath(savePath));
                            return fileName;
                        }

                    }

                    command.Parameters.AddWithValue("@img", savePath);

                    adapter.InsertCommand.ExecuteNonQuery();
                    Label2.Visible = true;
                    Label2.Text = "Article Successfully Uploaded!";
                    Label2.ForeColor = System.Drawing.Color.Green;
                    command.Dispose();
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                Label2.Text = ex.Message;
                Label2.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            Session["New"] = null;
            Response.Redirect("Login.aspx");
        }

    }
}







