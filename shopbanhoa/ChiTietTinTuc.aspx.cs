using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shopbanhoa
{
    public partial class ChiTietTinTuc : System.Web.UI.Page
    {
        shopbanhoatuoiDataContext db = new shopbanhoatuoiDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Lấy mã tin tức từ tham số truy vấn trên URL
                string maTT = Request.QueryString["MaTT"];
                if (!string.IsNullOrEmpty(maTT))
                {
                    int maTTInt;
                    if (int.TryParse(maTT, out maTTInt))
                    {
                        // Truy vấn tin tức từ cơ sở dữ liệu
                        var tinTuc = db.TinTucs.SingleOrDefault(tt => tt.MaTT == maTTInt);
                        if (tinTuc != null)
                        {
                            // Hiển thị thông tin chi tiết tin tức
                            imgHinhAnh.Src = tinTuc.HinhAnh;
                            lblTieuDe.InnerHtml = tinTuc.TieuDe;
                            lblNoiDung.InnerHtml = tinTuc.NoiDung;
                        }
                    }
                }
            }
        }
    }
}


