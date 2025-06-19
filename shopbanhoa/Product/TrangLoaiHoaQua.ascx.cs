using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shopbanhoa.Product
{
    public partial class TrangLoaiHoaQua : System.Web.UI.UserControl
    {
        shopbanhoatuoiDataContext db = new shopbanhoatuoiDataContext();
        public List<SanPham> listSP = new List<SanPham>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }
        }

        void LoadData()
        {
            if (!string.IsNullOrEmpty(Request.QueryString["MaLoai"]))
            {
                int maLoai;
                if (int.TryParse(Request.QueryString["MaLoai"], out maLoai))
                {
                    var sanPhams = (from sp in db.SanPhams
                                    where sp.MaLoai == maLoai
                                    select sp).ToList();

                    if (sanPhams != null && sanPhams.Count > 0)
                    {
                        listSP = sanPhams;
                    }
                }
                else
                {
                    // Xử lý khi MaLoai không hợp lệ
                }
            }
            else
            {
                // Xử lý khi không có MaLoai được truyền
            }
        }
    }
}