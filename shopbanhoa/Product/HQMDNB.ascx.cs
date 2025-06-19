using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shopbanhoa.Product
{
    public partial class HoaSenNB : System.Web.UI.UserControl
    {
        shopbanhoatuoiDataContext db = new shopbanhoatuoiDataContext();
        public static List<SanPham> listSP = new List<SanPham>();
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadData();
        }

        void LoadData()
        {
            var data = from q in db.SanPhams
                       where q.MaLoai == 3
                       orderby q.GiaBan ascending
                       select q;
            if (data != null && data.Count() > 0)
            {
                listSP = data.ToList();
            }
        }
    }
}