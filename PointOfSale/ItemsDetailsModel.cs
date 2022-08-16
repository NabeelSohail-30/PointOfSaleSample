using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PointOfSale
{
    public class ItemsDetailsModel
    {
        public int ItemCode { get; set; }
        public string Description { get; set; }
        public int CategoryId { get; set; }
        public int Qty { get; set; }
        public int Unit { get; set; }
        public decimal sPrice { get; set; }
        public decimal pPrice { get; set; }
    }
}
