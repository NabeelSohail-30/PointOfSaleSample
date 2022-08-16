using PointOfSale;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PointOfSaleWebApp
{
    public partial class ItemCoding : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int id = Convert.ToInt32(Request.QueryString["id"]);
                if (Request.QueryString["id"] == null)
                {
                    btnAdd.Visible = true;
                    btnCancel.Visible = false;
                    btnUpdate.Visible = false;
                    btnDelete.Visible = false;
                }
                else
                {
                    btnAdd.Visible = false;
                    btnCancel.Visible = true;
                    btnUpdate.Visible = true;
                    btnDelete.Visible = true;

                    EditMode(id);
                }
            }
        }

        private void EditMode(int id)
        {
            ItemsDetailsRepo repo = new ItemsDetailsRepo();
            ItemsDetailsModel model = new ItemsDetailsModel();

            model = repo.Find(id);

            Code.Text = model.ItemCode.ToString();
            Desc.Text = model.Description.ToString();
            Catg.SelectedValue = model.CategoryId.ToString();
            Unit.SelectedValue = model.Unit.ToString();
            Qty.Text = model.Qty.ToString();
            sPrice.Text = model.sPrice.ToString();
            pPrice.Text = model.pPrice.ToString();


        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            Response.Redirect($"ItemCoding.aspx?id={id}");
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            ItemsDetailsRepo repo = new ItemsDetailsRepo();
            ItemsDetailsModel model = new ItemsDetailsModel();

            model.Description = Desc.Text;
            model.CategoryId = Convert.ToInt32(Catg.SelectedValue);
            model.Qty = Convert.ToInt32(Qty.Text);
            model.Unit = Convert.ToInt32(Unit.SelectedValue);
            model.sPrice = Convert.ToDecimal(sPrice.Text);
            model.pPrice = Convert.ToDecimal(pPrice.Text);

            repo.Add(model);

            Response.Redirect("ItemCoding.aspx");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("ItemCoding.aspx");
            btnAdd.Visible = true;
            btnCancel.Visible = false;
            btnUpdate.Visible = false;
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            ItemsDetailsRepo repo = new ItemsDetailsRepo();
            ItemsDetailsModel model = new ItemsDetailsModel();
            int id = Convert.ToInt32(Request.QueryString["id"]);

            model.Description = Desc.Text;
            model.CategoryId = Convert.ToInt32(Catg.SelectedValue);
            model.Qty = Convert.ToInt32(Qty.Text);
            model.Unit = Convert.ToInt32(Unit.SelectedValue);
            model.sPrice = Convert.ToDecimal(sPrice.Text);
            model.pPrice = Convert.ToDecimal(pPrice.Text);

            repo.Update(id, model);

            Response.Redirect("ItemCoding.aspx");
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            ItemsDetailsRepo repo = new ItemsDetailsRepo();
            int id = Convert.ToInt32(Code.Text);
            repo.Delete(id);
            Response.Redirect("ItemCoding.aspx");
        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dashboard.aspx");
        }
    }
}