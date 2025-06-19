using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web.UI.WebControls;

namespace shopbanhoa.Admin.UserAdmin
{
    public partial class ThemSanPham : System.Web.UI.UserControl
    {
        shopbanhoatuoiDataContext db = new shopbanhoatuoiDataContext();
      
        public List<SanPham> listSP = new List<SanPham>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadLoaiHoa();
              
                LoadSanPham();

            }
          
        }


      

        private void LoadLoaiHoa()
        {
            using (shopbanhoatuoiDataContext db = new shopbanhoatuoiDataContext())
            {
                var loaiHoa = from lh in db.LoaiHangs
                              select lh;
                ddlLoaiHoa.DataSource = loaiHoa.ToList();
                ddlLoaiHoa.DataTextField = "TenLoai";
                ddlLoaiHoa.DataValueField = "MaLoai";
                ddlLoaiHoa.DataBind();
            }
        }

        private void LoadSanPham()
        {
            using (shopbanhoatuoiDataContext db = new shopbanhoatuoiDataContext())
            {
                var sanPham = from sp in db.SanPhams
                              select sp;
                GridViewSanPham.DataSource = sanPham.ToList();
                GridViewSanPham.DataBind();
            }
        }

        protected void btnThemSanPham_Click(object sender, EventArgs e)
        {
            if (fuAnhSanPham.HasFile)
            {
                string fileName = Path.GetFileName(fuAnhSanPham.FileName);
                string filePath = "~/img/" + fileName;
                fuAnhSanPham.SaveAs(Server.MapPath(filePath));

                using (shopbanhoatuoiDataContext db = new shopbanhoatuoiDataContext())
                {
                    SanPham sanPham = new SanPham
                    {
                        TenSP = txtTenSanPham.Text,
                        GiaBan = Convert.ToDecimal(txtGia.Text),
                        SoLuong = Convert.ToInt32(txtSoLuong.Text),
                        MoTa = txtMoTa.Text,
                        MaLoai = Convert.ToInt32(ddlLoaiHoa.SelectedValue),
                        GiamGia = Convert.ToDecimal(txtGiamGia.Text),
                        Giakhuyenmai = Convert.ToDecimal(txtGia.Text) - (Convert.ToDecimal(txtGia.Text) * Convert.ToDecimal(txtGiamGia.Text) / 100),
                        AnhSP = filePath
                    };

                    db.SanPhams.InsertOnSubmit(sanPham);
                    db.SubmitChanges();
                }

                LoadSanPham();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", "showSuccessMessage();", true);
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "ErrorMessage", "showErrorMessage('Vui lòng nhập đủ thông tin sản phẩm !');", true);
            }
        }

        protected void GridViewSanPham_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewSanPham.EditIndex = e.NewEditIndex;
            LoadSanPham();
        }

        protected void GridViewSanPham_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridViewSanPham.Rows[e.RowIndex];
            int maSP = Convert.ToInt32(GridViewSanPham.DataKeys[e.RowIndex].Value);

            TextBox txtTenSP = (TextBox)row.FindControl("txtTenSP");
            TextBox txtGiaBan = (TextBox)row.FindControl("txtGiaBan");
            TextBox txtSoLuong = (TextBox)row.FindControl("txtSoLuong");
            TextBox txtMoTa = (TextBox)row.FindControl("txtMoTa");
            TextBox txtGiamGia = (TextBox)row.FindControl("txtGiamGia");

            using (shopbanhoatuoiDataContext db = new shopbanhoatuoiDataContext())
            {
                SanPham sanPham = db.SanPhams.FirstOrDefault(sp => sp.MaSP == maSP);
                if (sanPham != null)
                {
                    sanPham.TenSP = txtTenSP.Text;
                    sanPham.GiaBan = Convert.ToDecimal(txtGiaBan.Text);
                    sanPham.SoLuong = Convert.ToInt32(txtSoLuong.Text);
                    sanPham.MoTa = txtMoTa.Text;
                    sanPham.GiamGia = Convert.ToDecimal(txtGiamGia.Text);
                    sanPham.Giakhuyenmai = Convert.ToDecimal(txtGiaBan.Text) - (Convert.ToDecimal(txtGiaBan.Text) * Convert.ToDecimal(txtGiamGia.Text) / 100);
                    db.SubmitChanges();
                    GridViewSanPham.EditIndex = -1;
                    LoadSanPham();
                }
            }

          
        }

        protected void GridViewSanPham_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewSanPham.EditIndex = -1;
            LoadSanPham();
        }

        protected void GridViewSanPham_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int maSP = Convert.ToInt32(GridViewSanPham.DataKeys[e.RowIndex].Value);

            using (shopbanhoatuoiDataContext db = new shopbanhoatuoiDataContext())
            {
                SanPham sanPham = db.SanPhams.FirstOrDefault(sp => sp.MaSP == maSP);
                if (sanPham != null)
                {
                    db.SanPhams.DeleteOnSubmit(sanPham);
                    db.SubmitChanges();
                }
            }

            LoadSanPham();
        }

        protected string GetLoaiHoaName(int maLoai)
        {
            using (shopbanhoatuoiDataContext db = new shopbanhoatuoiDataContext())
            {
                var loaiHoa = db.LoaiHangs.FirstOrDefault(lh => lh.MaLoai == maLoai);
                if (loaiHoa != null)
                {
                    return loaiHoa.TenLoai;
                }
                return string.Empty;
            }
        }
        //=========== hiển thị theo thông tin loại sản phẩm 

      




        //
    }
}