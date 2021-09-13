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
        public string Username = string.Empty;
        public string RoleName = string.Empty;
        public string EmailAddress = string.Empty;
        public string TelephoneNo = string.Empty;
        public string FullNames = string.Empty;
        public string UpdatedDate = string.Empty;
        public string UpdatedTime = string.Empty;
        public string UserPassword = string.Empty;
        public string RecID = string.Empty;
        public string UserID = string.Empty;

        public bool getClientProfile(string username, string sPassword)
        {
            try
            {
                string sPasswordDB = string.Empty;
                DataSet ds = new DataSet();
                string sSQL = "SELECT * FROM qry_user WHERE [UserName]=@username ";
                SqlCommand objCmd = new SqlCommand();
                objCmd.Parameters.Clear();
                objCmd.Parameters.AddWithValue("@username", username);
                objCmd.CommandText = sSQL;
                ds = ExecuteDataSet(objCmd);
                if (ds.Tables[0].Rows.Count <= 0)
                {
                    ErrorMessage = "Invalid User. Contact Administrator.";
                    return false;
                }
                sPasswordDB = ds.Tables[0].Rows[0]["User Password"].ToString();
                if (sPasswordDB.Trim() == string.Empty)
                {
                    ErrorMessage = "Password Not found in the database.";
                }
                else
                {
                    sPasswordDB = Decrypt(sPasswordDB);
                    if (sPassword != sPasswordDB)
                    {
                        ErrorMessage = "Invalid password.";
                        return false;
                    }
                }
                UserPassword = sPasswordDB;
                Username = ds.Tables[0].Rows[0]["UserName"].ToString();
                RoleName = ds.Tables[0].Rows[0]["RoleName"].ToString();
                EmailAddress = ds.Tables[0].Rows[0]["Email Address"].ToString();
                TelephoneNo = ds.Tables[0].Rows[0]["Telephone Number"].ToString();
                FullNames = ds.Tables[0].Rows[0]["FullNames"].ToString();
                UpdatedDate= ds.Tables[0].Rows[0]["UpdatedDate"].ToString();
                UpdatedTime = ds.Tables[0].Rows[0]["UpdatedTime"].ToString();
                RecID= ds.Tables[0].Rows[0]["RecID"].ToString();
                UserID  = ds.Tables[0].Rows[0]["UserID"].ToString();
                return true;
            }
            catch (Exception ex)
            {
                ErrorMessage = "No Login Connection.";
                return false;
            }
        }

        public bool getConsumerProfile(string username, string sPassword)
        {
            try
            {
                string sPasswordDB = string.Empty;
                DataSet ds = new DataSet();
                string sSQL = "SELECT * FROM qry_CustomerUser WHERE [UserName]=@username ";
                SqlCommand objCmd = new SqlCommand();
                objCmd.Parameters.Clear();
                objCmd.Parameters.AddWithValue("@username", username);
                objCmd.CommandText = sSQL;
                ds = ExecuteDataSet(objCmd);
                if (ds.Tables[0].Rows.Count <= 0)
                {
                    ErrorMessage = "Invalid User. Contact Administrator.";
                    return false;
                }
                sPasswordDB = ds.Tables[0].Rows[0]["User Password"].ToString();
                if (sPasswordDB.Trim() == string.Empty)
                {
                    ErrorMessage = "Password Not found in the database.";
                }
                else
                {
                    
                    if (sPassword != sPasswordDB)
                    {
                        ErrorMessage = "Invalid password.";
                        return false;
                    }
                }
                UserPassword = sPasswordDB;
                Username = ds.Tables[0].Rows[0]["UserName"].ToString();
                RoleName = ds.Tables[0].Rows[0]["RoleName"].ToString();
                EmailAddress = ds.Tables[0].Rows[0]["Email Address"].ToString();
                TelephoneNo = ds.Tables[0].Rows[0]["Telephone Number"].ToString();
                FullNames = ds.Tables[0].Rows[0]["FullNames"].ToString();
                UpdatedDate = ds.Tables[0].Rows[0]["UpdatedDate"].ToString();
                UpdatedTime = ds.Tables[0].Rows[0]["UpdatedTime"].ToString();
                RecID = ds.Tables[0].Rows[0]["RecID"].ToString();
                UserID = ds.Tables[0].Rows[0]["UserID"].ToString();
                return true;
            }
            catch (Exception ex)
            {
                ErrorMessage = "No Login Connection.";
                return false;
            }
        }

    }
}