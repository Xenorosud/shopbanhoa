using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shopbanhoa.Product
{
    public partial class TatCaHoa : System.Web.UI.UserControl
    {

        // Khởi tạo đối tượng DataContext để kết nối với cơ sở dữ liệu.
        shopbanhoatuoiDataContext db = new shopbanhoatuoiDataContext();


        // Danh sách sản phẩm sẽ được sử dụng để hiển thị sản phẩm trên giao diện hoặc có thể lưu trữ sản phẩm 
        public static List<SanPham> listSP = new List<SanPham>();

        // Số lượng sản phẩm trên mỗi trang.
        public int PageSize = 9;

        // Chỉ số của trang hiện tại (bắt đầu từ 0).
        public int PageIndex = 0;

        // Khai báo biến lấy Tổng số trang.
        public int TotalPages = 0;


        // Phương thức Page_Load được gọi khi trang được tải lên browser
        protected void Page_Load(object sender, EventArgs e)
        {

            // thực hiện tải dữ liệu 
            if (!IsPostBack)
            {

                // Kiểm tra nếu có tham số "page" trong query string, gán giá trị cho PageIndex.
                if (Request.QueryString["page"] != null)
                {
                    int.TryParse(Request.QueryString["page"], out PageIndex);
                }

                // Gọi phương thức LoadData để tải dữ liệu sản phẩm lên website 
                LoadData();
            }
        }


        // Phương thức LoadData để tải dữ liệu sản phẩm từ cơ sở dữ liệu.
        void LoadData()
        {

            // Truy vấn lấy tất cả sản phẩm, sắp xếp theo giá bán tăng dần = orderby = ascending (mặc định là tăng )
            var data = from q in db.SanPhams
                       orderby q.GiaBan ascending
                       select q;

            // Kiểm tra nếu có dữ liệu.
            if (data != null && data.Count() > 0)
            {
                // Chỉ lấy những sản phẩm cần thiết cho trang hiện tại.
                listSP = data.Skip(PageIndex * PageSize).Take(PageSize).ToList();

                // Tính tổng số trang dựa trên số lượng sản phẩm và kích thước trang.
                TotalPages = (int)Math.Ceiling((double)data.Count() / PageSize);
            }
        }
    }
}
