using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shopbanhoa.Product
{
    public partial class DangKyNguoiDung : System.Web.UI.UserControl
    {
        shopbanhoatuoiDataContext db = new shopbanhoatuoiDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDangKy_Click(object sender, EventArgs e)
        {
            string hoTen = txtHoTen.Text;
            string dienThoai = txtDienThoai.Text;
            string email = txtEmail.Text;
            string matKhau = txtMatKhau.Text;
            string diaChi = txtDiaChi.Text;

            if (string.IsNullOrEmpty(hoTen) || string.IsNullOrEmpty(dienThoai) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(matKhau) || string.IsNullOrEmpty(diaChi))
            {
              
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ValidateFields", "validateForm();", true);
                return;
            }

            // Kiểm tra xem email đã tồn tại trong cơ sở dữ liệu hay chưa ----------------------------------------
            if (IsEmailExists(email))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "EmailExists", "alert('Email đã được sử dụng!');", true);
            }
            else
            {
                // Lưu thông tin tài khoản vào cơ sở dữ liệu -------------------------------------------------------
                SaveTaiKhoan(hoTen, dienThoai, email, matKhau, diaChi);

                // Hiển thị modal thông báo đăng ký thành công và nút đăng nhập ngay ---------------------------
                ScriptManager.RegisterStartupScript(this, this.GetType(), "RegisterSuccess", "showSuccessModal();", true);
            }
        }

        private bool IsEmailExists(string email)
        {
            return db.TaiKhoans.Any(tk => tk.Email == email);
        }

        // lưu thông tin tài khoản vào bảng --------------------------------------------------------------------
        private void SaveTaiKhoan(string hoTen, string dienThoai, string email, string matKhau, string diaChi)
        {
            TaiKhoan newTaiKhoan = new TaiKhoan
            {
                HoTen = hoTen,
                Email = email,
                Dienthoai = dienThoai,
                Matkhau = matKhau,
                Diachi = diaChi
            };
            newTaiKhoan.IDQuyen = 2; 
            db.TaiKhoans.InsertOnSubmit(newTaiKhoan);
            db.SubmitChanges();
        }
    }
}
