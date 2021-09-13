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


        public DataSet GetUser()
        {
            try
            {
                SqlCommand objCmd = new SqlCommand();
                string sSQL = "select userID AS[Code], rec_id + ' ' + ':' + fullname as [Desc] from Users";
                objCmd.CommandText = sSQL;
                return ExecuteDataSet(objCmd);
            }
            catch (Exception ex)
            {
                ErrorMessage += ex.Message;
                return null;
            }
        }


        public bool CRUDStore(string rec_id, string store_name,string branch_name, string store_address, string store_description,string userID, string StatementType)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("CRUDStore", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@rec_id", rec_id);
            cmd.Parameters.AddWithValue("@store_name", store_name);
            cmd.Parameters.AddWithValue("@branch_name", branch_name);
            cmd.Parameters.AddWithValue("@store_address", store_address);
            cmd.Parameters.AddWithValue("@store_description", store_description);
            cmd.Parameters.AddWithValue("@userID", userID);
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
