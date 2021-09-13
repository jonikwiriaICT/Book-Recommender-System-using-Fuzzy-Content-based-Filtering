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
    public partial class SysAdminModel: _Database 
    {


        public DataSet GetProductImage(string ProductID)
        {
            try
            {
                SqlCommand objCmd = new SqlCommand();
                string sSQL = "select * from qry_Image where ProductID='" + ProductID + "'";
                objCmd.CommandText = sSQL;
                return ExecuteDataSet(objCmd);
            }
            catch (Exception ex)
            {
                ErrorMessage += ex.Message;
                return null;
            }
        }
        public DataSet GetProductZoomPicture(string ProductID)
        {
            try
            {
                SqlCommand objCmd = new SqlCommand();
                string sSQL = "select * from qry_Product where ProductID='" + ProductID + "'";
                objCmd.CommandText = sSQL;
                return ExecuteDataSet(objCmd);
            }
            catch (Exception ex)
            {
                ErrorMessage += ex.Message;
                return null;
            }
        }


    }
}
