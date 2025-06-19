using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shopbanhoa.Product
{
    public partial class ChiTietSP : System.Web.UI.UserControl
    {
        shopbanhoatuoiDataContext db = new shopbanhoatuoiDataContext();
        public static List<SanPham> listSP = new List<SanPham>();
        public static List<LoaiHang> listLoaiHang = new List<LoaiHang>();
        public SanPham sanPham;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
                LoadDataLoaihoa();
            }
        }

        void LoadData()
        {
            try
            {
                if (Request.QueryString["MaSP"] != null) // MaSP thuộc tham số trong của URL , mục đích truyền dữ liệu ---
                {
                    long maSP = Convert.ToInt64(Request.QueryString["MaSP"]); // Chuyển đổi MaSP thành kiểu long.
                    var data = from q in db.SanPhams // lấy dữ liệu từ bảng sản phẩm 
                               where q.MaSP == maSP
                               select q;

                    if (data != null && data.Count() > 0)
                    {
                        sanPham = data.First();
                    }
                    else
                    {
                        Response.Redirect("Error.aspx"); // Nếu không có sản phẩm, chuyển hướng đến trang Error.aspx.
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Redirect("Error.aspx?message=Lỗi khi xử lý dữ liệu sản phẩm");
            }
        }

       
        //============================== load loại hàng trong trang chi tiết 
        void LoadDataLoaihoa()
        {
            var loaiHangs = (from lh in db.LoaiHangs
                             select lh).ToList();

            if (loaiHangs != null && loaiHangs.Count > 0)
            {
                listLoaiHang = loaiHangs;
            }
        }


        //===============
        //==============================================================================================================
        // code gửi đánh giá người dùng 
        protected void btnClick(object sender, EventArgs e)
        {
            string userName = txtUserName.Value;
            string userEmail = txtUserEmail.Value;
            string comment = txtComment.Value;
            if (string.IsNullOrEmpty(userName) || string.IsNullOrEmpty(userEmail) || string.IsNullOrEmpty(comment))
            {
               
                return;
            }

            // Lưu đánh giá vào cơ sở dữ liệu
            SaveDB(userName, userEmail, comment);
            Response.Redirect("Thankyou.aspx");
        }

        private void SaveDB(string userName, string userEmail, string comment)
        {
            using (var db = new shopbanhoatuoiDataContext())
            {
                var newReview = new Review
                {
                    UserName = userName,
                    Email = userEmail,
                    Comment = comment,
                    NgayDanhGia = DateTime.Now
                };

                db.Reviews.InsertOnSubmit(newReview); // chèn dữ liệu vào CSDL -----------
                db.SubmitChanges(); // cập nhật các thay đổi 
            }



        }

        //===============================================

       

        //==============================================================================================================

      


    }
}
