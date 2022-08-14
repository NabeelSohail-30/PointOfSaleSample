using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PointOfSale
{
    public class ItemsDetailsRepo
    {
        public ItemsDetailsModel Find(int id)
        {
            string CS = ConfigurationManager.ConnectionStrings["PointOfSaleConnectionString"].ConnectionString;

            SqlConnection conn = new SqlConnection(CS);
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;

            cmd.CommandText = $"SELECT * FROM ItemsDetails WHERE (ItemCode = {id})";
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.Connection = conn;

            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }

            dr = cmd.ExecuteReader();

            ItemsDetailsModel model = new ItemsDetailsModel();

            while (dr.Read())
            {
                model.ItemCode = Convert.ToInt32(dr["ItemCode"]);
                model.Description = dr["Description"].ToString();
                model.CategoryId = Convert.ToInt32(dr["CategoryId"]);
                model.Unit = Convert.ToInt32(dr["Unit"]);
            }

            conn.Close();
            cmd.Dispose();
            dr.Close();

            return model;
        }

        public int Add(ItemsDetailsModel model)
        {
            string CS = ConfigurationManager.ConnectionStrings["PointOfSaleConnectionString"].ConnectionString;

            SqlConnection conn = new SqlConnection(CS);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "INSERT INTO ItemsDetails(Description, CategoryId, Unit) VALUES(@Description, @CategoryId, @Unit)";

            cmd.CommandType = System.Data.CommandType.Text;
            cmd.Parameters.AddWithValue("@Description", model.Description);
            cmd.Parameters.AddWithValue("@CategoryId", model.CategoryId);
            cmd.Parameters.AddWithValue("@Unit", model.Unit);
            cmd.Connection = conn;

            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }

            return cmd.ExecuteNonQuery();
        }

        public int Update(int id, ItemsDetailsModel model)
        {
            string CS = ConfigurationManager.ConnectionStrings["PointOfSaleConnectionString"].ConnectionString;

            SqlConnection conn = new SqlConnection(CS);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "UPDATE ItemsDetails SET Description = @Description, CategoryId = @CategoryId, Unit = @Unit WHERE (ItemCode = @id)";

            cmd.CommandType = System.Data.CommandType.Text;
            cmd.Parameters.AddWithValue("@id", id);
            cmd.Parameters.AddWithValue("@Description", model.Description);
            cmd.Parameters.AddWithValue("@CategoryId", model.CategoryId);
            cmd.Parameters.AddWithValue("@Unit", model.Unit);
            
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

            cmd.CommandText = "DELETE ItemsDetails WHERE (ItemCode = @id)";

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
