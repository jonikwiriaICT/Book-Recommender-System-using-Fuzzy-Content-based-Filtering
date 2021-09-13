using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RestuarantLibrary;
using System.Data;

public partial class DefaultUserMaster : System.Web.UI.MasterPage
{
    SysAdminModel objAdm = new SysAdminModel();

    string s;
    string t;
    string[] a = new string[6];
    decimal tot = 0;
    int totalCount = 0;
    public string sCountMoney;
    public string sCountCart;
    Dictionary<string, string> dictionaryCart;
    DataTable dtblProducts;
    DataTable dtblCart;
    public int totalQuantity = 0;
    public double totalAmount = 0;

    protected void SearchForDesktop( object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("Index?ID=" + SearchID.Value);
        }
        catch(Exception ex)
        {

        }
    }

    public string UserName
    {
        get
        {
            try
            {
                string sValue = string.Empty;

                if (string.IsNullOrEmpty(sValue) == true)
                {
                    sValue = Session["UserName"].ToString();
                }
                return sValue;
            }
            catch (Exception ex)
            {
                try
                {
                    return Session["UserName"].ToString();
                }
                catch (Exception ex2) { }
                return string.Empty;
            }
        }
    }

    public string Administrator
    {
        get
        {
            try
            {
                string sValue = string.Empty;

                if (string.IsNullOrEmpty(sValue) == true)
                {
                    sValue = Session["Administrator"].ToString();
                }
                return sValue;
            }
            catch (Exception ex)
            {
                try
                {
                    return Session["Administrator"].ToString();
                }
                catch (Exception ex2) { }
                return string.Empty;
            }
        }
    }
    public string TelephoneNo
    {
        get
        {
            try
            {
                string sValue = string.Empty;

                if (string.IsNullOrEmpty(sValue) == true)
                {
                    sValue = Session["TelephoneNo"].ToString();
                }
                return sValue;
            }
            catch (Exception ex)
            {
                try
                {
                    return Session["TelephoneNo"].ToString();
                }
                catch (Exception ex2) { }
                return string.Empty;
            }
        }
    }
    public string fullName
    {
        get
        {
            try
            {
                string sValue = string.Empty;

                if (string.IsNullOrEmpty(sValue) == true)
                {
                    sValue = Session["fullName"].ToString();
                }
                return sValue;
            }
            catch (Exception ex)
            {
                try
                {
                    return Session["fullName"].ToString();
                }
                catch (Exception ex2) { }
                return string.Empty;
            }
        }
    }
    public string EmailAddress
    {
        get
        {
            try
            {
                string sValue = string.Empty;

                if (string.IsNullOrEmpty(sValue) == true)
                {
                    sValue = Session["EmailAddress"].ToString();
                }
                return sValue;
            }
            catch (Exception ex)
            {
                try
                {
                    return Session["EmailAddress"].ToString();
                }
                catch (Exception ex2) { }
                return string.Empty;
            }
        }
    }

    public string UserID
    {
        get
        {
            try
            {
                string sValue = string.Empty;

                if (string.IsNullOrEmpty(sValue) == true)
                {
                    sValue = Session["UserID"].ToString();
                }
                return sValue;
            }
            catch (Exception ex)
            {
                try
                {
                    return Session["UserID"].ToString();
                }
                catch (Exception ex2) { }
                return string.Empty;
            }
        }
    }

    public string User
    {
        get
        {
            try
            {
                string sValue = string.Empty;

                if (string.IsNullOrEmpty(sValue) == true)
                {
                    sValue = Session["User"].ToString();
                }
                return sValue;
            }
            catch (Exception ex)
            {
                try
                {
                    return Session["User"].ToString();
                }
                catch (Exception ex2) { }
                return string.Empty;
            }
        }
    }
    public string UpdatedDate
    {
        get
        {
            try
            {
                string sValue = string.Empty;

                if (string.IsNullOrEmpty(sValue) == true)
                {
                    sValue = Session["UpdatedDate"].ToString();
                }
                return sValue;
            }
            catch (Exception ex)
            {
                try
                {
                    return Session["UpdatedDate"].ToString();
                }
                catch (Exception ex2) { }
                return string.Empty;
            }
        }
    }
    public string UpdatedTime
    {
        get
        {
            try
            {
                string sValue = string.Empty;

                if (string.IsNullOrEmpty(sValue) == true)
                {
                    sValue = Session["UpdatedTime"].ToString();
                }
                return sValue;
            }
            catch (Exception ex)
            {
                try
                {
                    return Session["UpdatedTime"].ToString();
                }
                catch (Exception ex2) { }
                return string.Empty;
            }
        }
    }





    protected void Page_Load(object sender, EventArgs e)
    {

        try
        {
            if (!this.IsPostBack)
            {
                var cookieCart = Request.Cookies["CookieCart"];

                if (cookieCart != null)
                {
                    sCountCart = objAdm.GetNumberOfItems(cookieCart.Value).ToString();

                }
                else
                {
                    sCountCart = "0";
                }
            }
        }
        catch (Exception ex)
        {

        }
    }
    protected void Page_UnLoad(object sender, EventArgs e)
    {
        try
        {
            objAdm.CloseConnection();
        }
        catch(Exception ex)
        {

        }
    }
    protected void Page_Init(object sender, EventArgs e)
    {

    }
    protected void SignOut(object sender, EventArgs e)
    {
        try
        {
            Session.Abandon();
            Session.Clear();
            Response.Redirect("Index");
        }
        catch(Exception ex)
        {

        }
    }
   
    protected void Signin(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("Customer-Signin");
        }
        catch(Exception ex)
        {

        }
    }



   
    protected void CartCheck(object sender, EventArgs e)
    {
        try
        {
            if (Session["audit_username"] == null)
            {
                Response.Redirect("Customer-Signin");
            }
            else
            {
                Response.Redirect("Cart");
            }
        }
        catch (Exception ex)
        {

        }
    }
}
