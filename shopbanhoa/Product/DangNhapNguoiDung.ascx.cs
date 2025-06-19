using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shopbanhoa.Product
{
    public partial class DangNhapNguoiDung : System.Web.UI.UserControl
    {
        shopbanhoatuoiDataContext db = new shopbanhoatuoiDataContext();
        public static List<TaiKhoan> listtaikhoan = new List<TaiKhoan>();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void login_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string password = txtPassword.Text;

            // Kiểm tra ràng buộc phía server ----------------------------------------------------
            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showError", "showError('Vui lòng nhập đầy đủ thông tin đăng nhập!');", true);
                return;
            }
            //-----------------------------------------------------------------
            var user = db.TaiKhoans.FirstOrDefault(u => u.Email == username && u.Matkhau == password);

            if (user != null)
            {
                // Lưu thông tin đăng nhập vào session ---------
                Session["UserID"] = user.MaNguoiDung;
                Session["Email"] = user.Email;
                Session["IDQuyen"] = user.IDQuyen;


                // lưu vào bảng CSDL-------------
                ThongTinDangNhap newLogin = new ThongTinDangNhap
                {
                    MaNguoiDung = user.MaNguoiDung,
                    Email = user.Email,
                    Matkhau = user.Matkhau,
                    LoginTime = DateTime.Now
                };
                db.ThongTinDangNhaps.InsertOnSubmit(newLogin);
                db.SubmitChanges();
                //---------------------------------------------
                // Chuyển hướng dựa vào quyền của người dùng --------------------------------
                if (user.IDQuyen == 1) // Điều chỉnh để kiểm tra quyền truy cập admin
                {
                    Response.Redirect("~/Admin/TrangchuAdmin.aspx");
                }
                else
                {
                    Response.Redirect("~/Trangchu.aspx");
                }
                //----------------------------------------------------
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showError", "showError('Thông tin tài khoản hoặc mật khẩu sai');", true);
            }
        }
    }
}
