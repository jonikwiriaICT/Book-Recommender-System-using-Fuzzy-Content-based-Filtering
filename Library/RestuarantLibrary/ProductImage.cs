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

       


        public bool CRUDProductImage( string rec_id, string product_id, string img_profile, string StatementType)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("CRUDProductImage", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@rec_id", rec_id);
            cmd.Parameters.AddWithValue("@product_id", product_id);
            cmd.Parameters.AddWithValue("@img_profile", img_profile);
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
