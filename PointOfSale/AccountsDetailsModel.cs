using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PointOfSale
{
    public class AccountsDetailsModel
    {
        public int AccountId { get; set; }
        public string AccountTitle { get; set; }
        public decimal OpeningBalance { get; set; }
        public int AccBalanceTypeId { get; set; }
        public string Nature { get; set; }
        public decimal STax { get; set; }
        public string Ntn { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }
        public bool LeaveAc { get; set; }
        public bool ActiveAc { get; set; }
        public int AccountTypeId { get; set; }
    }
}
