using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Configuration;
using System.Data.SqlClient;
using RestuarantLibrary;


using System.Web.Script.Services;
using System.Configuration;

public partial class Cart : System.Web.UI.Page
{
    SysAdminModel objAdm = new SysAdminModel();
    Dictionary<string, string> dictionaryCart;
    DataTable dtblProducts;
    DataTable dtblCart;
    public int totalQuantity = 0;
    public double totalAmount = 0;
    
   
    public string UserID()
    {
        try
        {
            string username = ((CustomerMaster)this.Master).UserID;
            return username;
        }
        catch (Exception ex)
        {
            return null;
        }
    }
    public string Email()
    {
        try
        {
            string username = ((CustomerMaster)this.Master).EmailAddress ;
            return username;
        }
        catch (Exception ex)
        {
            return null;
        }
    }
    public string TelephoneNo()
    {
        try
        {
            string username = ((CustomerMaster)this.Master).TelephoneNo ;
            return username;
        }
        catch (Exception ex)
        {
            return null;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        try
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
               
            
                Session["Email"] = Email ();
                Session["Telephone"] = TelephoneNo ();
           
        }
        catch (Exception ex)
        {

        }
    }
    private void PopulateData()
    {
        dtblProducts = objAdm.PopulateViewCart("GetTopProduct");


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
            Session["total"] = totalAmount;
            row["ImgProfile"] = selectedRow[0]["ImgProfile"];
            dtblCart.Rows.Add(row);
        }
        if (totalAmount == 0)
        {
            idTotal.Visible = false;
            Response.Redirect("Empty-Cart");
        }
    }

    protected void GVCart_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Remove From Cart":
                string itemID = e.CommandArgument.ToString();
                var cookieCart = Request.Cookies["CookieCart"];
                cookieCart.Value = objAdm.Remove(itemID, cookieCart.Value);
                Response.Cookies["CookieCart"].Value = cookieCart.Value;
                Response.Redirect("Cart");
                break;
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
   
   

    protected void NavigateToPayOut(object sender, EventArgs e)
    {
        try
        {

            Response.Redirect("Check");

        }
        catch (Exception ex)
        {

        }
    }
    private void DisplaySuccess(String sMessage)
    {
        try
        {
            (this.Master as CustomerMaster).DisplayMessage(sMessage, CustomerMaster.MsgType.Success);
        }
        catch (Exception ex)
        {
            Session["msg"] = ex.Message.ToString();
            Response.Redirect("~/en");
        }
    }
    private void DisplayError(String sMessage)
    {
        try
        {
            (this.Master as CustomerMaster).DisplayMessage(sMessage, CustomerMaster.MsgType.Error);
        }
        catch (Exception ex)
        {
            Session["msg"] = ex.Message.ToString();
            Response.Redirect("~/en");
        }
    }

    private void DisplayWarning(String sMessage)
    {
        try
        {
            (this.Master as CustomerMaster).DisplayMessage(sMessage, CustomerMaster.MsgType.Warning);
        }
        catch (Exception ex)
        {
            Session["msg"] = ex.Message.ToString();
            Response.Redirect("~/en");
        }
    }




}