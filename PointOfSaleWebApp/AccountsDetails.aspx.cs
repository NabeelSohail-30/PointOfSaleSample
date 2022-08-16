using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PointOfSale;

namespace PointOfSaleWebApp
{
    public partial class AccountsDetails : System.Web.UI.Page
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
                    //panelAdd.Visible = true;
                    //panelEdit.Visible = false;
                }
                else
                {
                    btnAdd.Visible = false;
                    btnCancel.Visible = true;
                    btnUpdate.Visible = true;
                    btnDelete.Visible = true;

                    //panelAdd.Visible = false;
                    //panelEdit.Visible = true;

                    EditMode(id);
                }
            }
        }

        private void EditMode(int id)
        {
            AccountsDetailsRepo repo = new AccountsDetailsRepo();
            AccountsDetailsModel model = new AccountsDetailsModel();
            model = repo.Find(id);


            AccId.Text = model.AccountId.ToString();
            AccTitle.Text = model.AccountTitle.ToString();
            OpnBal.Text = model.OpeningBalance.ToString();
            BalType.SelectedValue = model.AccBalanceTypeId.ToString();
            Nature.Text = model.Nature.ToString();
            STax.Text = model.STax.ToString();
            NTN.Text = model.Ntn.ToString();
            Phone.Text = model.Phone.ToString();
            AccType.SelectedValue = model.AccountTypeId.ToString();
            Address.Text = model.Address.ToString();
            LeaveAc.Checked = model.LeaveAc;
            ActiveAc.Checked = model.ActiveAc;

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            AccountsDetailsRepo repo = new AccountsDetailsRepo();
            AccountsDetailsModel model = new AccountsDetailsModel();

            model.AccountTitle = AccTitle.Text;
            model.OpeningBalance = Convert.ToDecimal(OpnBal.Text);
            model.AccBalanceTypeId = Convert.ToInt32(BalType.SelectedValue);
            model.Nature = Nature.Text;
            model.STax = Convert.ToDecimal(STax.Text);
            model.Ntn = NTN.Text;
            model.Phone = Phone.Text;
            model.AccountTypeId = Convert.ToInt32(AccType.SelectedValue);
            model.Address = Address.Text;
            model.LeaveAc = LeaveAc.Checked;
            model.ActiveAc = ActiveAc.Checked;

            repo.Add(model);
            Response.Redirect("AccountsDetails.aspx");
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("AccountsDetails.aspx");
            btnAdd.Visible = true;
            btnCancel.Visible = false;
            btnUpdate.Visible = false;
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            Response.Redirect($"AccountsDetails.aspx?id={id}");
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            AccountsDetailsRepo repo = new AccountsDetailsRepo();
            AccountsDetailsModel model = new AccountsDetailsModel();

            int id = Convert.ToInt32(Request.QueryString["id"]);

            model.AccountTitle = AccTitle.Text;
            model.OpeningBalance = Convert.ToDecimal(OpnBal.Text);
            model.AccBalanceTypeId = Convert.ToInt32(BalType.SelectedValue);
            model.Nature = Nature.Text;
            model.STax = Convert.ToDecimal(STax.Text);
            model.Ntn = NTN.Text;
            model.Phone = Phone.Text;
            model.AccountTypeId = Convert.ToInt32(AccType.SelectedValue);
            model.Address = Address.Text;
            model.LeaveAc = LeaveAc.Checked;
            model.ActiveAc = ActiveAc.Checked;

            repo.Update(id, model);
            Response.Redirect("AccountsDetails.aspx");
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            AccountsDetailsRepo repo = new AccountsDetailsRepo();
            int id = Convert.ToInt32(AccId.Text);

            repo.Delete(id);
            Response.Redirect("AccountsDetails.aspx");

        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dashboard.aspx");
        }
    }
}