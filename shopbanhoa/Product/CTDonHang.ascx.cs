using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shopbanhoa.Product
{
    public partial class CTDonHang : System.Web.UI.UserControl
    {
        shopbanhoatuoiDataContext db = new shopbanhoatuoiDataContext();
        public static List<DatHang> DatHangsp = new List<DatHang>();
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadData();
        }

        void LoadData()
        {
            var data = from q in db.DatHangs                                  
                       select q;
            if (data != null && data.Count() > 0)
            {
                DatHangsp = data.ToList();
            }
        }
    }
}