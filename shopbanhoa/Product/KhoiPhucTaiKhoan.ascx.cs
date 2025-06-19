using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shopbanhoa.Product
{
    public partial class KhoiPhucTaiKhoan : System.Web.UI.UserControl
    {
        shopbanhoatuoiDataContext db = new shopbanhoatuoiDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnResetPassword_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Value;
            string newPassword = txtNewPassword.Value;
            string confirmNewPassword = txtConfirmNewPassword.Value; // Thêm trường này để lấy giá trị xác nhận mật khẩu mới 

            // Kiểm tra xem email có tồn tại trong cơ sở dữ liệu không
            var user = db.TaiKhoans.FirstOrDefault(u => u.Email == email);
            if (user != null)
            {
                // Kiểm tra xác nhận mật khẩu mới
                if (newPassword == confirmNewPassword)
                {
                    // Cập nhật mật khẩu mới trong cơ sở dữ liệu
                    user.Matkhau = newPassword;
                    db.SubmitChanges();

                    // Hiển thị thông báo cho người dùng
                    lblMessage.InnerText = "Mật khẩu đã được đặt lại thành công.";
                }
                else
                {
                    // Hiển thị thông báo nếu xác nhận mật khẩu mới không trùng khớp
                    lblMessage.InnerText = "Xác nhận mật khẩu mới không trùng khớp.";
                }
            }
            else
            {
                // Hiển thị thông báo nếu email không tồn tại trong cơ sở dữ liệu
                lblMessage.InnerText = "Địa chỉ email không tồn tại trong hệ thống.";
            }
        }

    }
}