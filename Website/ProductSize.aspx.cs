﻿
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RestuarantLibrary;
using System.IO;
using System.Data.OleDb;
using System.Data;
using System.Configuration;

public partial class ProductSize : System.Web.UI.Page
{
    SysAdminModel objAdm = new SysAdminModel();
    DataSet ds;
    DataTable Dt;
    static string sRecValue;
    static int itrig = 0;
    public int TotalPage { get; set; }
    public int CurrentPage { get; set; }

    public string UserID()
    {
        try
        {
            string username = ((BoutiqueMaster)this.Master).UserID;
            return username;
        }
        catch (Exception ex)
        {
            return null;
        }
    }
    private void GetProduct()
    {
        try
        {
            DataSet ds = objAdm.GetProduct ();
            product_id.DataSource = ds;
            product_id.DataValueField = "Code";
            product_id.DataTextField = "Desc";
            product_id.DataBind();
        }
        catch (Exception ex)
        {

        }
    }


    protected void AddNewRecord(object sender, EventArgs e)
    {
        try
        {

        }
        catch (Exception ex)
        {

        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {

            if (!IsPostBack)
            {
                GetProduct ();
                LoadGrid();
                formView.Visible = false;
                TableView.Visible = true;
            }
            //LoadGrid(); 






        }
        catch (Exception ex)
        {

        }
    }
    protected void AddNewRecordClicked(object sender, EventArgs e)
    {
        try
        {
            formView.Visible = true;
            TableView.Visible = false;
            LoadGrid();
            objAdm.clearPanel(PnlProductSize);
            itrig = 0;
        }
        catch (Exception ex)
        {

        }
    }
    protected void ViewRecord(object sender, EventArgs e)
    {
        try
        {
            formView.Visible = false;
            TableView.Visible = true;
            LoadGrid();
            itrig = 0;
        }
        catch (Exception ex)
        {

        }
    }

    protected void Page_Init(object sender, EventArgs e)
    {
        try
        {

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
            (this.Master as BoutiqueMaster).DisplayMessage(sMessage, BoutiqueMaster.MsgType.Success);
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
            (this.Master as BoutiqueMaster).DisplayMessage(sMessage, BoutiqueMaster.MsgType.Error);
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
            (this.Master as BoutiqueMaster).DisplayMessage(sMessage, BoutiqueMaster.MsgType.Warning);
        }
        catch (Exception ex)
        {
            Session["msg"] = ex.Message.ToString();
            Response.Redirect("~/en");
        }
    }



    public void bindGrid(int currentPage)
    {

        TableResult.DataSource = objAdm.PopulateData(currentPage, "GetSize", int.Parse (UserID ()));
        TableResult.DataBind();

        generatePager(objAdm._TotalRowCount, objAdm.pageSize, currentPage);


    }
    protected void dlPager_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "PageNo")
        {
            bindGrid(Convert.ToInt32(e.CommandArgument));
        }
        TableResult.UseAccessibleHeader = true;
        TableResult.HeaderRow.TableSection = TableRowSection.TableHeader;
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
    private void LoadGrid()
    {
        try
        {
            bindGrid(1);
            TableResult.UseAccessibleHeader = true;
            TableResult.HeaderRow.TableSection = TableRowSection.TableHeader;
        }
        catch (Exception ex)
        {

        }
    }


    protected void tableChanged(object sender, EventArgs e)
    {
        try
        {

            itrig = 1;
            GridViewRow dgi = TableResult.SelectedRow;
            rec_id.Value = dgi.Cells[objAdm.getColumnIndexByName(TableResult, "RecID")].Text;
            int iRec = int.Parse(rec_id.Value);
            GetProduct ();
            objAdm.getPanelByRecID(PnlProductSize );
            //ckEditor.InnerText = product_description.Value;
            formView.Visible = true;
            TableView.Visible = false;


        }
        catch (Exception ex)
        {

        }
    }
    protected void TableDelete(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            GridViewRow dgi = TableResult.Rows[e.RowIndex];
            rec_id.Value = dgi.Cells[objAdm.getColumnIndexByName(TableResult, "RecID")].Text;
            Label1.ForeColor = System.Drawing.Color.DarkRed;
            Label1.Text = "Are you sure that you want to delete Record with ID:" + " " + rec_id.Value + " " + " ?";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "LaunchServerSide", "$(function() { showDelete(); });", true);

        }
        catch (Exception ex)
        {
        }
    }

    protected void lbDeleteYes_Click(object sender, EventArgs e)
    {
        try
        {

            string sTbl = "ProductSize";
            if (objAdm.DeleteRecord(rec_id.Value, sTbl) == true)
            {
                DisplaySuccess("Record deleted successfully.");
                LoadGrid();


            }
            else
            {

            }

        }
        catch (Exception ex)
        {

        }
    }

    protected void SaveChangesClicked(object sender, EventArgs e)
    {
        try
        {

            string sYearMonthDay = DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString();

            //if (FileUpload1.HasFile)
            //{

            //    FileUpload1.SaveAs(HttpContext.Current.Server.MapPath("dist/") + sYearMonthDay + FileUpload1.FileName);
            //    string URL3 = "dist/" + sYearMonthDay + FileUpload1.FileName;
            //    img_profile.Value = URL3;
            //}
            if (itrig == 0)
            {
                if (objAdm.CRUDProductSize(rec_id.Value , product_id .SelectedValue , size_name.Text , "INSERT") == true)
                {
                    LoadGrid();
                    DisplaySuccess(objAdm.ErrorMessage);

                    objAdm.clearPanel(PnlProductSize );
                    //ckEditor.InnerText = "";
                    itrig = 0;
                    LoadGrid();
                    //formView.Visible = false;
                    //TableView.Visible = true;
                }
                else
                {
                    DisplayError(objAdm.ErrorMessage);
                    LoadGrid();
                    formView.Visible = false;
                    TableView.Visible = true;
                }
            }
            if (itrig == 1)
            {
                if (objAdm.CRUDProductSize(rec_id.Value, product_id.SelectedValue, size_name.Text, "UPDATE") == true)
                {
                    LoadGrid();
                    DisplaySuccess(objAdm.ErrorMessage);

                    objAdm.clearPanel(PnlProductSize);
                    //ckEditor.InnerText = "";
                    itrig = 0;
                    LoadGrid();
                    //formView.Visible = false;
                    //TableView.Visible = true;
                }
                else
                {
                    DisplayError(objAdm.ErrorMessage);
                    LoadGrid();
                    formView.Visible = false;
                    TableView.Visible = true;
                }
            }


        }
        catch (Exception ex)
        {

        }
    }

}