using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shopbanhoa.Product
{
    public partial class LichSuDonHang : System.Web.UI.UserControl
    {
        shopbanhoatuoiDataContext db = new shopbanhoatuoiDataContext();
        public List<TaiKhoan> TKnguoimua = new List<TaiKhoan>();

        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

      

        // Lấy danh sách đơn đặt hàng của người dùng dựa trên email
        protected List<DatHang> LayDonDatHangCuaNguoiDung(string email)
        {
            var donDatHangs = (from ddh in db.DatHangs
                               where ddh.Email == email
                               select ddh).ToList();
            return donDatHangs;
        }

       
    }
}