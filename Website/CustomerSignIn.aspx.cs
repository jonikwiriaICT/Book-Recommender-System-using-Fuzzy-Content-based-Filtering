using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RestuarantLibrary;

public partial class CustomerSignIn : System.Web.UI.Page
{
    SysAdminModel objAdm = new SysAdminModel();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!this.IsPostBack)
            {

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
    protected void Page_Init(object sender, EventArgs e)
    {

    }
    protected void loginClick(object sender, EventArgs e)
    {
        try
        {
            if (string.IsNullOrEmpty(username.Text ) || string.IsNullOrWhiteSpace(username.Text ))
            {
                DisplayError  ("Please enter your username");
            }
            else if (userpassword .Text  == "")
            {
                DisplayError("Please enter your password");
            }
            else
            {
                if (objAdm.getConsumerProfile(username.Text , userpassword .Text ))
                {

                    Session["audit_username"] = objAdm.Username;
                    Session["UserName"] = objAdm.Username;
                    Session["fullName"] = objAdm.FullNames;
                    Session["EmailAddress"] = objAdm.EmailAddress;
                    Session["RoleName"] = objAdm.RoleName;
                    Session["TelephoneNo"] = objAdm.TelephoneNo;
                    Session["UpdatedDate"] = objAdm.UpdatedDate;
                    Session["UpdatedTime"] = objAdm.UpdatedTime;
                    Session["UserPassword"] = objAdm.UserPassword;
                    Session["UserID"] = objAdm.UserID;
                    
                        Session["User"] = "1";
                  
                   

                        if (objAdm.UserPassword != "welcome")
                        {
                            Response.Redirect("Index");
                        }
                        else
                        {
                            Response.Redirect("Index");
                        
                        }
                   
                }
                else
                {
                    DisplayError (objAdm.ErrorMessage);
                }
            }
        }
        catch (Exception ex)
        {

        }
    }
}