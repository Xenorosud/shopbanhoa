using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shopbanhoa.Product
{
    public partial class TimKiemSanPham : System.Web.UI.UserControl
    {
        private readonly shopbanhoatuoiDataContext db = new shopbanhoatuoiDataContext();
        public static List<SanPham> listSP = new List<SanPham>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string keyword = Request.QueryString["keyword"];
                if (!string.IsNullOrEmpty(keyword))
                {
                    listSP = db.SanPhams.Where(sp => sp.TenSP.Contains(keyword)).ToList();
                    if (listSP.Count > 0)
                    {
                        // Hiển thị kết quả tìm kiếm và từ khóa
                        Page.Title = "Kết quả tìm kiếm cho từ khóa: " + keyword;
                    }
                    else
                    {
                        // Hiển thị thông báo khi không có kết quả
                        Page.Title = "Sản phẩm bạn tìm kiếm hiện không có";
                    }
                }
            }
        }
    }
}