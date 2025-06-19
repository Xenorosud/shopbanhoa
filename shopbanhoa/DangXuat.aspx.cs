using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using shopbanhoa.Product; 
namespace shopbanhoa
{
    public partial class DangXuat : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            var user = shopbanhoa.Product.DangNhapNguoiDung.listtaikhoan.FirstOrDefault(u => u.MaNguoiDung == (int)Session["UserID"]);
            if (user != null)
            {
                shopbanhoa.Product.DangNhapNguoiDung.listtaikhoan.Remove(user);
            }

            // Xóa tất cả các thông tin lưu trong session
            Session.Clear();
            Session.Abandon();

            // Chuyển hướng người dùng về trang đăng nhập
            Response.Redirect("~/DangNhap.aspx");
        }
    }
}