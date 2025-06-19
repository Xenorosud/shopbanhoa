using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shopbanhoa.Product
{
    public partial class TinTucNB : System.Web.UI.UserControl
    {
        shopbanhoatuoiDataContext db = new shopbanhoatuoiDataContext();

        // Tạo danh sách chứa các tin tức
        public static List<TinTuc> listTinTuc = new List<TinTuc>();

        protected void Page_Load(object sender, EventArgs e)
        {
            // Gọi phương thức để tải dữ liệu
            LoadData();
        }

        // Phương thức để tải dữ liệu từ cơ sở dữ liệu
        void LoadData()
        {
            // Truy vấn cơ sở dữ liệu để lấy các tin tức
            var data = (from tinTuc in db.TinTucs
                        select tinTuc).Take(4);

            // Kiểm tra xem có tin tức nào được trả về không
            if (data != null && data.Count() > 0)
            {
                // Nếu có, thêm các tin tức vào danh sách
                listTinTuc = data.ToList();
            }
        }
    }
}