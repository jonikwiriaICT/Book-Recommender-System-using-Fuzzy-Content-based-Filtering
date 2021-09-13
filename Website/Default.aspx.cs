﻿
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RestuarantLibrary;

public partial class _Default : System.Web.UI.Page
{
    SysAdminModel objAdm = new SysAdminModel();
   
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
           
                if (!IsPostBack)
                {

                    if (Request.QueryString ["ID"] != null)
                {
                    DataSet ds = objAdm.GetSearchByCategory(Request.QueryString["ID"].ToString());
                    ListProduct.DataSource = ds;
                    ListProduct.DataBind();

                }
                else
                {
                    bindGrid(1);
                    bindGrids(1);
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

    protected void SearchProduct(object sender, EventArgs e)
    {
        try
        {
            bindGrid(1);
            bindGrids(1);
        }
        catch (Exception ex)
        {

        }
    }
    public void bindGrid(int currentPage)
    {

        LVProducts.DataSource = objAdm.PopulateData(currentPage, "GetProductForCustomer");
        LVProducts.DataBind();

        generatePager(objAdm._TotalRowCount, objAdm.pageSize, currentPage);
    }
    public void bindGrids(int currentPage)
    {

        ListProduct.DataSource = objAdm.PopulateData(currentPage, "GetProductForCustomer");
        ListProduct.DataBind();

        generatePagers(objAdm._TotalRowCount, objAdm.pageSize, currentPage);
    }
    protected void dlPagers_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "PageNo")
        {
            bindGrids(Convert.ToInt32(e.CommandArgument));
        }
    }
    protected void dlPager_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "PageNo")
        {
            bindGrid(Convert.ToInt32(e.CommandArgument));
        }
    }
    public void generatePager(int totalRowCount, int pageSize, int currentPage)
    {
        int totalLinkInPage = 5;
        int totalPageCount = (int)Math.Ceiling((decimal)totalRowCount / pageSize);

        int startPageLink = Math.Max(currentPage - (int)Math.Floor((decimal)totalLinkInPage / 2), 1);
        int lastPageLink = Math.Min(startPageLink + totalLinkInPage - 1, totalPageCount);

        if ((startPageLink + totalLinkInPage - 1) > totalPageCount)
        {
            lastPageLink = Math.Min(currentPage + (int)Math.Floor((decimal)totalLinkInPage / 2), totalPageCount);
            startPageLink = Math.Max(lastPageLink - totalLinkInPage + 1, 1);
        }

        List<ListItem> pageLinkContainer = new List<ListItem>();

        if (startPageLink != 1)
            pageLinkContainer.Add(new ListItem("First", "1", currentPage != 1));
        for (int i = startPageLink; i <= lastPageLink; i++)
        {
            pageLinkContainer.Add(new ListItem(i.ToString(), i.ToString(), currentPage != i));
        }
        if (lastPageLink != totalPageCount)
            pageLinkContainer.Add(new ListItem("Last", totalPageCount.ToString(), currentPage != totalPageCount));

        dlPager.DataSource = pageLinkContainer;
        dlPager.DataBind();

  
    }
    public void generatePagers(int totalRowCount, int pageSize, int currentPage)
    {
        int totalLinkInPage = 5;
        int totalPageCount = (int)Math.Ceiling((decimal)totalRowCount / pageSize);

        int startPageLink = Math.Max(currentPage - (int)Math.Floor((decimal)totalLinkInPage / 2), 1);
        int lastPageLink = Math.Min(startPageLink + totalLinkInPage - 1, totalPageCount);

        if ((startPageLink + totalLinkInPage - 1) > totalPageCount)
        {
            lastPageLink = Math.Min(currentPage + (int)Math.Floor((decimal)totalLinkInPage / 2), totalPageCount);
            startPageLink = Math.Max(lastPageLink - totalLinkInPage + 1, 1);
        }

        List<ListItem> pageLinkContainer = new List<ListItem>();

        if (startPageLink != 1)
            pageLinkContainer.Add(new ListItem("First", "1", currentPage != 1));
        for (int i = startPageLink; i <= lastPageLink; i++)
        {
            pageLinkContainer.Add(new ListItem(i.ToString(), i.ToString(), currentPage != i));
        }
        if (lastPageLink != totalPageCount)
            pageLinkContainer.Add(new ListItem("Last", totalPageCount.ToString(), currentPage != totalPageCount));

       
        dgPage.DataSource = pageLinkContainer;
        dgPage.DataBind();

    }

    protected void dtSpouse_itemCommand(object source, ListViewCommandEventArgs  e)
    {
        try
        {

            switch (e.CommandName)
            {
                case "btnAddToCart":
                    var cookieCart = Request.Cookies["CookieCart"];
                    string itemID = e.CommandArgument.ToString();
                    if (cookieCart == null)
                    {
                        cookieCart = new HttpCookie("CookieCart");
                        cookieCart.Value = "";
                        cookieCart.Expires = DateTime.Now.AddDays(30);
                        cookieCart.Value = objAdm.Add(itemID, cookieCart.Value);
                        Response.Cookies.Add(cookieCart);
                    }
                    else
                    {
                        cookieCart.Value = objAdm.Add(itemID, cookieCart.Value);
                        Response.Cookies["CookieCart"].Value = cookieCart.Value;
                    }

                    Response.Redirect("Index");
                    break;
            }
        }

        catch (Exception ex)
        {

        }
    }
    protected void dtSpouses_itemCommand(object source, ListViewCommandEventArgs e)
    {
        try
        {

            switch (e.CommandName)
            {
                case "btnAddToCarts":
                    var cookieCart = Request.Cookies["CookieCart"];
                    string itemID = e.CommandArgument.ToString();
                    if (cookieCart == null)
                    {
                        cookieCart = new HttpCookie("CookieCart");
                        cookieCart.Value = "";
                        cookieCart.Expires = DateTime.Now.AddDays(30);
                        cookieCart.Value = objAdm.Add(itemID, cookieCart.Value);
                        Response.Cookies.Add(cookieCart);
                    }
                    else
                    {
                        cookieCart.Value = objAdm.Add(itemID, cookieCart.Value);
                        Response.Cookies["CookieCart"].Value = cookieCart.Value;
                    }

                    Response.Redirect("Index");
                    break;
            }
        }

        catch (Exception ex)
        {

        }
    }
}