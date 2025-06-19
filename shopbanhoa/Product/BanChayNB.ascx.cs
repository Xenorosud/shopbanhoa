using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shopbanhoa.Product
{
    public partial class BanChayNB : System.Web.UI.UserControl
    {
        // Tạo một đối tượng của DataContext, dùng để tương tác với cơ sở dữ liệu-----------
        shopbanhoatuoiDataContext db = new shopbanhoatuoiDataContext();

        // Tạo một danh sách tĩnh để lưu trữ các sản phẩm-----------
        public static List<SanPham> listSP = new List<SanPham>();

        // Phương thức này sẽ được gọi khi trang được tải---------
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadData();
        }

        void LoadData()
        {
            // Truy vấn dữ liệu từ bảng SanPhams
            var data = from q in db.SanPhams
                       where q.MaLoai == 1    // Lọc những sản phẩm có MaLoai bằng 1
                       orderby q.GiaBan ascending   // Sắp xếp theo Giá Bán tăng dần (mặc định )
                       select q;
            if (data != null && data.Count() > 0)
            {
                listSP = data.ToList(); // lấy dữ liệu từ bảng hiện ra website -----------
            }
        }
    }
}