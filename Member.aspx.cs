using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.UI.WebControls ;
using System.IO;

namespace ProjectTest
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {
                Label2.Visible = false;
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

            foreach (GridViewRow row in GridView.Rows)
            {
                foreach (TableCell cell in row.Cells)
                {
                    cell.Attributes.CssStyle["text-align"] = "center";
                }
            }
        }

        //ADD NEW
        protected void Save_Click(object sender, EventArgs e)
        {

            string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();

            SqlCommand command;
            SqlDataAdapter adapter = new SqlDataAdapter();
            System.Web.UI.HtmlControls.HtmlTextArea comment = (System.Web.UI.HtmlControls.HtmlTextArea)(form1.FindControl("Comment"));
            String comm = comment.Value;

            string H1 = Hidden1.Value;
            bool b1 = string.IsNullOrEmpty(H1);
            string H2 = Hidden2.Value;
            bool b2 = string.IsNullOrEmpty(H1);

            String sql = "insert into EmployeeIdorName (ApprovalStatus,Location,Latitude,longitude,Description,Image) values (@apr,@loc,@lat,@lng,@des,@img)";
            command = new SqlCommand(sql, conn);

            string fileExtension = Path.GetExtension(FileUpload.FileName);
            int fileSize = FileUpload.PostedFile.ContentLength;
            string savePath = "/Uploads/";
            if (b1 == true || b2 == true)
            {
                Label2.Visible = true;
                Label2.Text = "Please select a location first!";
                Label2.ForeColor = System.Drawing.Color.Red;
                conn.Close();
            }

            else if (fileExtension != "" && fileExtension.ToUpper() != ".jpg" && fileExtension.ToUpper() != ".jpeg" && fileExtension.ToUpper() != ".png"
                     && fileExtension.ToLower() != ".jpg" && fileExtension.ToLower() != ".jpeg" && fileExtension.ToLower() != ".png" )
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

            else
            {             
                adapter.InsertCommand = command;
                command.Parameters.AddWithValue("@apr", "Approval Pending");
                command.Parameters.AddWithValue("@loc", Hidden3.Value);
                command.Parameters.AddWithValue("@lat", Hidden1.Value);
                command.Parameters.AddWithValue("@lng", Hidden2.Value);
                command.Parameters.AddWithValue("@des", comm);

                
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
                Label2.Text = "Information Successfully Uploaded!";
                Label2.ForeColor = System.Drawing.Color.Green;
                command.Dispose();
                conn.Close();
            }                    

            
        }

        //UPDATE/DELETE
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

        protected void GridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView.EditIndex = e.NewEditIndex;
            PopulateGridview();

        }

        protected void GridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView.EditIndex = -1;
            PopulateGridview();
        }  
        
        protected void GridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    conn.Open();
                    string query = "UPDATE EmployeeIdorName SET Location=@Loc,Description=@Des,Image=@Img WHERE ID = @id";
                    SqlCommand command = new SqlCommand(query, conn);

                    command.Parameters.AddWithValue("@Loc", (GridView.Rows[e.RowIndex].FindControl("txtLocation") as TextBox).Text.Trim());
                    command.Parameters.AddWithValue("@Des", (GridView.Rows[e.RowIndex].FindControl("txtDescription") as TextBox).Text.Trim());

                    int index = e.RowIndex;
                    GridViewRow row = (GridViewRow)GridView.Rows[index];
                    Label Labelx = (Label)row.FindControl("Label3");
                    FileUpload upload = (FileUpload)row.FindControl("FileUpload2");
                    string fileExtension = System.IO.Path.GetExtension(upload.FileName);
                    int fileSize = upload.PostedFile.ContentLength;
                    string savePath = "/Uploads/";

                    if (upload.HasFile)
                    {

                        if (fileExtension != "" && fileExtension.ToUpper() != ".jpg" && fileExtension.ToUpper() != ".jpeg" && fileExtension.ToUpper() != ".png"
                        && fileExtension.ToLower() != ".jpg" && fileExtension.ToLower() != ".jpeg" && fileExtension.ToLower() != ".png")
                        {
                            Labelx.Visible = true;
                            Labelx.ForeColor = System.Drawing.Color.Red;
                            Labelx.Text = "Only files with .jpg, .jpeg, .gif and .png extension are allowed";
                            conn.Close();
                        }

                        else if (fileSize > 15728640)
                        {
                            Labelx.Visible = true;
                            Labelx.ForeColor = System.Drawing.Color.Red;
                            Labelx.Text = "File size cannot be greater than 15MB!";
                        } 

                         else
                         {
                            String link = "/Uploads/" + Path.GetFileName(upload.FileName);
                            command.Parameters.AddWithValue("@Img", link);

                            string FileName = SaveFile(upload.PostedFile);
                            string SaveFile(HttpPostedFile file)
                            {

                                string fileName = upload.FileName;

                                string pathToCheck = savePath + fileName;

                                string tempfileName = "";

                                if (System.IO.File.Exists(Server.MapPath(pathToCheck)))
                                {
                                    int counter = 2;
                                    while (System.IO.File.Exists(Server.MapPath(pathToCheck)))
                                    {

                                        tempfileName = counter.ToString() + fileName;
                                        pathToCheck = savePath + tempfileName;
                                        counter++;
                                    }

                                    fileName = tempfileName;

                                }

                                savePath += fileName;

                                upload.SaveAs(Server.MapPath(savePath));
                                return fileName;
                            }
                        }
                       
                    }
                    else
                    {
                        command.Parameters.AddWithValue("@Img", (GridView.Rows[e.RowIndex].FindControl("txtImage") as TextBox).Text.Trim());
                    }


                    command.Parameters.AddWithValue("@id", Convert.ToInt32(GridView.DataKeys[e.RowIndex].Value.ToString()));
                    command.ExecuteNonQuery();
                    GridView.EditIndex = -1;
                    PopulateGridview();
                    SuccMes.Text = "Selected Record Updated";
                    ErrorMes.Text = "";
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                SuccMes.Text = "";
                ErrorMes.Text = ex.Message;
            }
        }

        protected void GridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    conn.Open();
                    string query = "DELETE FROM EmployeeIdorName WHERE ID = @id";
                    SqlCommand command = new SqlCommand(query, conn);
                    command.Parameters.AddWithValue("@id", Convert.ToInt32(GridView.DataKeys[e.RowIndex].Value.ToString()));
                    command.ExecuteNonQuery();
                    PopulateGridview();
                    SuccMes.Text = "Selected Record Deleted";
                    ErrorMes.Text = "";
                    conn.Close();
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