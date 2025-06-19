using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shopbanhoa.Product
{
    public partial class ThongTinNguoiDung : System.Web.UI.UserControl
    {
        shopbanhoatuoiDataContext db = new shopbanhoatuoiDataContext();
        public List<TaiKhoan> TKnguoimua = new List<TaiKhoan>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }
        }

        void LoadData()
        {
            if (!string.IsNullOrEmpty(Request.QueryString["MaNguoiDung"]))
            {
                int maNguoiDung;
                if (int.TryParse(Request.QueryString["MaNguoiDung"], out maNguoiDung))
                {
                    var sanPhams = (from sp in db.TaiKhoans
                                    where sp.MaNguoiDung == maNguoiDung
                                    select sp).ToList();

                    if (sanPhams != null && sanPhams.Count > 0)
                    {
                        TKnguoimua = sanPhams;
                    }
                }
                else
                {
                    // Xử lý khi MaNguoiDung không hợp lệ
                }
            }
            else
            {
                // Xử lý khi không có MaNguoiDung được truyền
            }
        }
        //--------------------------------------------------------------
        //code nếu Email trùng với thông tin đặt hàng thì thêm vào tài khoản đã đặt

        public List<DatHang> LayDonDatHangCuaNguoiDung(string email)
        {
            var donDatHangs = (from ddh in db.DatHangs
                               where ddh.Email == email
                               select ddh).ToList();
            return donDatHangs;
        }

        //----------------------------
    }
}
