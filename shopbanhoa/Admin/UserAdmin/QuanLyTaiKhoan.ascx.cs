using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shopbanhoa.Admin.UserAdmin
{
    public partial class QuanLyTaiKhoan : System.Web.UI.UserControl
    {
        protected shopbanhoatuoiDataContext db = new shopbanhoatuoiDataContext();
        public static List<TaiKhoan> listTaiKhoan = new List<TaiKhoan>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }
        }

        void LoadData()
        {
            var data = from q in db.TaiKhoans
                       select q;
            if (data != null && data.Count() > 0)
            {
                listTaiKhoan = data.ToList();
                GridViewTaiKhoan.DataSource = listTaiKhoan;
                GridViewTaiKhoan.DataBind();
            }
        }

        protected void btnThemTaiKhoan_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtHoTen.Text.Trim().Length == 0 || txtEmail.Text.Trim().Length == 0 || txtDienThoai.Text.Trim().Length == 0 || txtMatKhau.Text.Trim().Length == 0 || txtIDQuyen.Text.Trim().Length == 0)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "ErrorMessage", "showErrorMessage('Vui lòng nhập đầy đủ thông tin!');", true);
                    return;
                }

                var taiKhoan = new TaiKhoan
                {
                    HoTen = txtHoTen.Text,
                    Email = txtEmail.Text,
                    Dienthoai = txtDienThoai.Text,
                    Matkhau = txtMatKhau.Text,
                    IDQuyen = int.Parse(txtIDQuyen.Text)
                };

                db.TaiKhoans.InsertOnSubmit(taiKhoan);
                db.SubmitChanges();

                Page.ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", "showSuccessMessage();", true);

                txtHoTen.Text = "";
                txtEmail.Text = "";
                txtDienThoai.Text = "";
                txtMatKhau.Text = "";
                txtIDQuyen.Text = "";

                LoadData();
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "ErrorMessage", "showErrorMessage('Có lỗi xảy ra: " + ex.Message + "');", true);
            }
        }

        protected void GridViewTaiKhoan_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewTaiKhoan.EditIndex = e.NewEditIndex;
            LoadData();
        }

        protected void GridViewTaiKhoan_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                int maNguoiDung = Convert.ToInt32(GridViewTaiKhoan.DataKeys[e.RowIndex].Value);
                GridViewRow row = GridViewTaiKhoan.Rows[e.RowIndex];

                string hoTen = ((TextBox)row.Cells[1].Controls[0]).Text;
                string email = ((TextBox)row.Cells[2].Controls[0]).Text;
                string matKhau = ((TextBox)row.Cells[3].Controls[0]).Text;
                string dienThoai = ((TextBox)row.Cells[4].Controls[0]).Text;
                int idQuyen = int.Parse(((TextBox)row.Cells[5].Controls[0]).Text);

                using (shopbanhoatuoiDataContext db = new shopbanhoatuoiDataContext())
                {
                    var taiKhoan = db.TaiKhoans.FirstOrDefault(tk => tk.MaNguoiDung == maNguoiDung);
                    if (taiKhoan != null)
                    {
                        taiKhoan.HoTen = hoTen;
                        taiKhoan.Email = email;
                        taiKhoan.Matkhau = matKhau;
                        taiKhoan.Dienthoai = dienThoai;
                        taiKhoan.IDQuyen = idQuyen;
                        db.SubmitChanges();
                    }
                }

                GridViewTaiKhoan.EditIndex = -1;
                LoadData();
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "ErrorMessage", "showErrorMessage('Có lỗi xảy ra: " + ex.Message + "');", true);
            }
        }

        protected void GridViewTaiKhoan_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewTaiKhoan.EditIndex = -1;
            LoadData();
        }

        protected void GridViewTaiKhoan_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int maNguoiDung = Convert.ToInt32(GridViewTaiKhoan.DataKeys[e.RowIndex].Value);

                using (shopbanhoatuoiDataContext db = new shopbanhoatuoiDataContext())
                {
                    var taiKhoan = db.TaiKhoans.FirstOrDefault(tk => tk.MaNguoiDung == maNguoiDung);
                    if (taiKhoan != null)
                    {
                        db.TaiKhoans.DeleteOnSubmit(taiKhoan);
                        db.SubmitChanges();
                    }
                }

                LoadData();
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "ErrorMessage", "showErrorMessage('Có lỗi xảy ra: " + ex.Message + "');", true);
            }
        }
    }
}
