using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shopbanhoa.Product
{
    public partial class TinTucShop : System.Web.UI.UserControl
    {
        shopbanhoatuoiDataContext db = new shopbanhoatuoiDataContext();


        public static List<TinTuc> listTinTuc = new List<TinTuc>();

        protected void Page_Load(object sender, EventArgs e)
        {

            LoadData();
        }


        void LoadData()
        {

            var data = from tinTuc in db.TinTucs
                       select tinTuc;


            if (data != null && data.Count() > 0)
            {

                listTinTuc = data.ToList();
            }
        }
    }
}