using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RestuarantLibrary;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Net;
using System.Net.Mail;

public partial class CheckOut : System.Web.UI.Page
{
    SysAdminModel objAdm = new SysAdminModel();
    public string RetailerID = string.Empty;
    public string ManufacturerID = string.Empty;
    public string PurchaseTypeID = string.Empty;
    public string WareHouse = string.Empty;
    public string productID = string.Empty;
    public string remark = string.Empty;
    public string Email = string.Empty;
    public string TelephoneNo = string.Empty;
    Dictionary<string, string> dictionaryCart;
    DataTable dtblProducts;
    DataTable dtblCart;
    public int totalQuantity = 0;
    public double totalAmount = 0;
    public int tot;
    public int OrderItemNo;

    public object RecID { get; private set; }

   
    //private void checkAll()
    //{
    //    try
    //    {
    //        foreach (GridViewRow grow in GVCart.Rows)
    //        {
    //            CheckBox chkVerified = (CheckBox)grow.FindControl("chkcheck");
    //            if (chkVerified.Checked == false)
    //            {
    //                chkVerified.Checked = true;
    //                lblCheck.Text = "Uncheck";
    //            }

    //        }

    //    }
    //    catch(Exception ex)
    //    {

    //    }
    //}
    protected void Page_Load(object sender, EventArgs e)
    {


        var cookieCart = Request.Cookies["CookieCart"];

        if (cookieCart != null)
        {
            dictionaryCart = objAdm.ToDictionary(cookieCart.Value);

            CreateDataTableCart();

            if (dtblCart.Rows.Count > 0)
            {
                GVCart.DataSource = dtblCart;
                GVCart.DataBind();

            }
        }

    }
    protected void Page_UnLoad(object sender, EventArgs e)
    {
        try
        {
            objAdm.CloseConnection();
        }
        catch (Exception ex)
        {

        }
    }

    protected void Page_Init(object sender, EventArgs e)
    {

    }

    private void PopulateData()
    {
        dtblProducts = objAdm.PopulateViewCart("GetTopProduct");
    }
    private void InsertRecord()
    {

    }

    private void CreateDataTableCart()
    {
        PopulateData();
        dtblCart = new DataTable();
        dtblCart.Columns.Add("ProductID");
        dtblCart.Columns.Add("ProductName");
        dtblCart.Columns.Add("UserID");
        dtblCart.Columns.Add("Price");
        dtblCart.Columns.Add("Quantity");
        dtblCart.Columns.Add("ProductTotalAmount");
        dtblCart.Columns.Add("ImgProfile");
        foreach (KeyValuePair<string, string> item in dictionaryCart)
        {
            DataRow[] selectedRow = dtblProducts.Select("ProductID = " + item.Key);
            DataRow row = dtblCart.NewRow();
            row["ProductID"] = int.Parse(item.Key);
            row["ProductName"] = selectedRow[0]["ProductName"];
            row["UserID"] = selectedRow[0]["UserID"];
            row["Price"] = selectedRow[0]["Price"];
            row["Quantity"] = item.Value;
            row["ProductTotalAmount"] = double.Parse(row["Price"].ToString()) * int.Parse(item.Value);
            totalAmount += double.Parse(row["Price"].ToString()) * int.Parse(item.Value);
            row["ImgProfile"] = selectedRow[0]["ImgProfile"];
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["mssqlConnectionString"].ConnectionString;
            con.Open();
            using (SqlCommand newCmd = new SqlCommand())
            {
                newCmd.Connection = con;
                newCmd.CommandType = CommandType.Text;
                newCmd.CommandText = "insert into TransactionStock(orderID, RetailerID, CustomerID,product_id, quantity, price, date_sold, time_sold, stock_description, flag_on) values('" + Session["order"].ToString () + "', '" + row["UserID"].ToString () + "', '" + Session["UserID"].ToString () + "','" + row["ProductID"].ToString () + "', '" + row["Quantity"] .ToString () + "', '" + row["Price"] .ToString () + "', '" + DateTime .UtcNow .ToShortDateString() + "', '" + DateTime .UtcNow.ToShortTimeString() + "', '" + row["ProductName"].ToString () + "','1')";
                newCmd.ExecuteNonQuery();
            }         
            con.Close();
            dtblCart.Rows.Add(row);

        }
        Response.Redirect("Payment-Success");

    }
}