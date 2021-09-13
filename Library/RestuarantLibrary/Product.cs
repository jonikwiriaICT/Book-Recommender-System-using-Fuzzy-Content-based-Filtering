using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using _Foundation;
using System.Data;
using System.Data.SqlClient;

namespace RestuarantLibrary
{
    public partial class SysAdminModel : _Database
    {


        public DataSet GetSearchByCategory(string text)
        {
            try
            {
                SqlCommand objCmd = new SqlCommand();
                string sSQL = "select top(5  + 1 -1)RowNumber,fms.score,  RecID, ProductID,CategoryName as [Category Name], ProductName as [Product Name] , Quantity, Price, ProductDescription as [Product Description],ImgProfile as [Img Profile], UpdatedDate as [Updated Date], UpdatedTime as [Updated Time], SOUNDEX(ProductName + CategoryName) AS SoundexCode from qry_Product CROSS APPLY(select dbo.FuzzyMatchString('" + text + "', ProductName + CategoryName) AS score) AS fms ORDER by fms.score desc";
                objCmd.CommandText = sSQL;
                return ExecuteDataSet(objCmd);
            }
            catch (Exception ex)
            {
                ErrorMessage += ex.Message;
                return null;
            }
        }


        public DataSet GetCategory()
        {
            try
            {
                SqlCommand objCmd = new SqlCommand();
                string sSQL = "select category_id as [Code], rec_id + '  ' + ':' + category_name as [Desc] from Category";
                objCmd.CommandText = sSQL;
                return ExecuteDataSet(objCmd);
            }
            catch (Exception ex)
            {
                ErrorMessage += ex.Message;
                return null;
            }
        }


        public bool CRUDProduct(string rec_id, string category_id, string UserID,string product_name, string Quantity, string price ,string img_profile, string product_description, string StatementType)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("CRUDProduct", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@rec_id", rec_id);
            cmd.Parameters.AddWithValue("@category_id", category_id);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            cmd.Parameters.AddWithValue("@product_name", product_name);
            cmd.Parameters.AddWithValue("@Quantity", Quantity);
            cmd.Parameters.AddWithValue("@price", price);
            cmd.Parameters.AddWithValue("@img_profile", img_profile);
            cmd.Parameters.AddWithValue("@product_description", product_description);
            cmd.Parameters.AddWithValue("@StatementType", StatementType);
            if (ExecuteNonQuery(cmd) <= 0)
            {
                ErrorMessage = "Unable to process transaction";
                return false;
            }
            ErrorMessage = "Record executed successfully .";
            return true;
        }


    }
}
