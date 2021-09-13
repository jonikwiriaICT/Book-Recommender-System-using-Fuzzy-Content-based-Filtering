using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RestuarantLibrary;
using System.Data;

public partial class BoutiqueMaster : System.Web.UI.MasterPage
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

    protected void SignOut(object sender, EventArgs e)
    {
        try
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("en");
        }
        catch (Exception ex)
        {

        }
    }
    private void GetIdentity()
    {
        try
        {
            UserImage.Src = "images/favicon.png";
            UserImage1.Src = "images/favicon.png";
            lblUsername.Text = UserName;
            lblUsername1.Text = UserName;
            lblCreatedDate.Text = UpdatedDate ;
            lblUsername2.Text = UserName;
            userImage2.Src = "images/favicon.png";
        }
        catch (Exception ex)
        {

        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!this.IsPostBack)
            {
                if (string.IsNullOrEmpty(UserName) || string.IsNullOrWhiteSpace(UserName))
                {
                    Session.Clear();
                    Session.Abandon();
                    Response.Redirect("index");
                }
                else
                {
                    GetIdentity();
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
        catch (Exception ex)
        {

        }
    }
    protected void Page_Init(object sender, EventArgs e)
    {

    }

    public enum MsgType
    {
        Error = 0,
        Success = 1,
        Warning = 2
    }
    protected void NavigateClicked(object sender, EventArgs e)
    {
        try
        {
            if (sender.Equals(lnkChangePassword))
            {
                Response.Redirect("Change-Password");
            }
            if (sender.Equals(lnkDashboard))
            {
                Response.Redirect("Dashboard");
            }
        }
        catch (Exception ex)
        {

        }
    }
    public void DisplayMessage(String sMessage, MsgType type)
    {
        try
        {
            if (sMessage.Trim() == "")
            {
                pnlAlert.Visible = false;
            }
            else
            {
                lblMsg.Text = sMessage;
                if (type == MsgType.Success)
                {
                    pnlAlert.CssClass = "alert alert-success";
                    spIcon.InnerHtml = "<i class='fa fa-check-circle-o'></i>";
                }
                else if (type == MsgType.Warning)
                {
                    pnlAlert.CssClass = "alert alert-warning";
                    spIcon.InnerHtml = "<i class='fa fa-exclamation-triangle'></i>";
                }
                else
                {
                    pnlAlert.CssClass = "alert alert-danger";
                    spIcon.InnerHtml = "<i class='fa fa-exclamation-circle'></i>";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "displayMsg", "alert('" + sMessage + "');", true);
                }
                pnlAlert.Visible = true;
                //ClientScript.RegisterStartupScript(this.GetType(), "displayMsg", "alert('" + sMessage + "');", true);
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
            pnlAlert.Visible = true;
        }
    }
}
