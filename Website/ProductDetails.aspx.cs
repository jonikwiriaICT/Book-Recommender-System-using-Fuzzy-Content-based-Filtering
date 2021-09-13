using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RestuarantLibrary;
using System.Data;

public partial class ProductDetails : System.Web.UI.Page
{
    SysAdminModel objAdm = new SysAdminModel();
    public string PublicID = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!this.IsPostBack)
            {
                if (Request .QueryString ["ID"] != null)
                {
                    PublicID = Request.QueryString["ID"].ToString();
                    GetProductSubImage();
                    GetProductZoomImage();
                    GetProductDescription();
                }
                else
                {
                    Response.Redirect("Index");
                }

            }
        }
        catch(Exception ex)
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
    private void GetProductSubImage()
    {
        try
        {
            DataSet ds = objAdm.GetProductImage(PublicID);
            dtPictures.DataSource = ds;
            dtPictures.DataBind();
        }
        catch(Exception ex)
        {

        }
    }
    private void GetProductZoomImage()
    {
        try
        {
            DataSet ds = objAdm.GetProductZoomPicture(PublicID);
            dtZoomPicture .DataSource = ds;
            dtZoomPicture.DataBind();
        }
        catch (Exception ex)
        {

        }
    }
    private void GetProductDescription()
    {
        try
        {
            DataSet ds = objAdm.GetProductZoomPicture(PublicID);
            dtDescription .DataSource = ds;
            dtDescription.DataBind();
        }
        catch (Exception ex)
        {

        }
    }
}