using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data.SqlClient;

namespace PointOfSale
{
    public class AccountsDetailsRepo
    {
        public AccountsDetailsModel Find(int id)
        {
            string CS = ConfigurationManager.ConnectionStrings["PointOfSaleConnectionString"].ConnectionString;

            SqlConnection conn = new SqlConnection(CS);
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;

            cmd.CommandText = $"SELECT * FROM AccountsDetails WHERE (AccountId = {id})";
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.Connection = conn;

            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }

            dr = cmd.ExecuteReader();

            AccountsDetailsModel Account = new AccountsDetailsModel();

            while (dr.Read())
            {
                Account.AccountId = Convert.ToInt32(dr["AccountId"]);
                Account.OpeningBalance = Convert.ToDecimal(dr["OpeningBalance"]);
                Account.AccBalanceTypeId = Convert.ToInt32(dr["AccBalanceTypeId"]);
                Account.STax = Convert.ToDecimal(dr["STax"]);
                Account.AccountTypeId = Convert.ToInt32(dr["AccountTypeId"]);
                Account.LeaveAc = Convert.ToBoolean(dr["LeaveAc"]);
                Account.ActiveAc = Convert.ToBoolean(dr["ActiveAc"]);
                Account.AccountTitle = dr["AccountTitle"].ToString();
                Account.Nature = dr["Nature"].ToString();
                Account.Ntn = dr["Ntn"].ToString();
                Account.Phone = dr["Phone"].ToString();
                Account.Address = dr["Address"].ToString();
            }

            conn.Close();
            cmd.Dispose();
            dr.Close();

            return Account;
        }

        public int Add(AccountsDetailsModel model)
        {
            string CS = ConfigurationManager.ConnectionStrings["PointOfSaleConnectionString"].ConnectionString;

            SqlConnection conn = new SqlConnection(CS);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "INSERT INTO AccountsDetails(AccountTitle, OpeningBalance, AccBalanceTypeId, Nature, STax, Ntn, Phone, Address, LeaveAc, ActiveAc, AccountTypeId) VALUES(@AccountTitle, @OpeningBalance, @AccBalanceTypeId, @Nature, @STax, @Ntn, @Phone, @Address, @LeaveAc, @ActiveAc, @AccountTypeId)";

            cmd.CommandType = System.Data.CommandType.Text;
            cmd.Parameters.AddWithValue("@AccountTitle", model.AccountTitle);
            cmd.Parameters.AddWithValue("@OpeningBalance", model.OpeningBalance);
            cmd.Parameters.AddWithValue("@AccBalanceTypeId", model.AccBalanceTypeId);
            cmd.Parameters.AddWithValue("@Nature", model.Nature);
            cmd.Parameters.AddWithValue("@STax", model.STax);
            cmd.Parameters.AddWithValue("@Ntn", model.Ntn);
            cmd.Parameters.AddWithValue("@Phone", model.Phone);
            cmd.Parameters.AddWithValue("@Address", model.Address);
            cmd.Parameters.AddWithValue("@LeaveAc", model.LeaveAc);
            cmd.Parameters.AddWithValue("@ActiveAc", model.ActiveAc);
            cmd.Parameters.AddWithValue("@AccountTypeId", model.AccountTypeId);
            cmd.Connection = conn;

            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }

           return cmd.ExecuteNonQuery();
        }

        public int Update(int id, AccountsDetailsModel model)
        {
            string CS = ConfigurationManager.ConnectionStrings["PointOfSaleConnectionString"].ConnectionString;

            SqlConnection conn = new SqlConnection(CS);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "UPDATE AccountsDetails SET AccountTitle = @AccountTitle, OpeningBalance = @OpeningBalance, AccBalanceTypeId = @AccBalanceTypeId, Nature = @Nature, STax = @STax, Ntn = @Ntn, Phone = @Phone, Address = @Address, LeaveAc = @LeaveAc, ActiveAc = @ActiveAc, AccountTypeId = @AccountTypeId WHERE (AccountId = @id)";

            cmd.CommandType = System.Data.CommandType.Text;
            cmd.Parameters.AddWithValue("@id", id);
            cmd.Parameters.AddWithValue("@AccountTitle", model.AccountTitle);
            cmd.Parameters.AddWithValue("@OpeningBalance", model.OpeningBalance);
            cmd.Parameters.AddWithValue("@AccBalanceTypeId", model.AccBalanceTypeId);
            cmd.Parameters.AddWithValue("@Nature", model.Nature);
            cmd.Parameters.AddWithValue("@STax", model.STax);
            cmd.Parameters.AddWithValue("@Ntn", model.Ntn);
            cmd.Parameters.AddWithValue("@Phone", model.Phone);
            cmd.Parameters.AddWithValue("@Address", model.Address);
            cmd.Parameters.AddWithValue("@LeaveAc", model.LeaveAc);
            cmd.Parameters.AddWithValue("@ActiveAc", model.ActiveAc);
            cmd.Parameters.AddWithValue("@AccountTypeId", model.AccountTypeId);
            cmd.Connection = conn;

            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }

            return cmd.ExecuteNonQuery();
        }

        public int Delete(int id)
        {
            string CS = ConfigurationManager.ConnectionStrings["PointOfSaleConnectionString"].ConnectionString;

            SqlConnection conn = new SqlConnection(CS);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "DELETE AccountsDetails WHERE (AccountId = @id)";

            cmd.CommandType = System.Data.CommandType.Text;
            cmd.Parameters.AddWithValue("@id", id);

            cmd.Connection = conn;

            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }

            return cmd.ExecuteNonQuery();
        }
    }
}
