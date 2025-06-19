using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shopbanhoa.Admin.UserAdmin
{
    public partial class LoaiHoa : System.Web.UI.UserControl
    {
        protected shopbanhoatuoiDataContext db = new shopbanhoatuoiDataContext();
        public static List<LoaiHang> listLoaiHang = new List<LoaiHang>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }
        }

        void LoadData()
        {
            var loaiHangs = (from lh in db.LoaiHangs
                             select lh).ToList();

            if (loaiHangs != null && loaiHangs.Count > 0)
            {
                listLoaiHang = loaiHangs;
                GridViewLoaiHoa.DataSource = listLoaiHang;
                GridViewLoaiHoa.DataBind();
            }
        }

        protected void btnThemLoaiHoa_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtTenLoai.Text.Trim().Length == 0)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "ErrorMessage", "showErrorMessage('Vui lòng nhập tên loại sản phẩm!');", true);
                    return;
                }

                using (shopbanhoatuoiDataContext db = new shopbanhoatuoiDataContext())
                {
                    var loaiHang = new LoaiHang
                    {
                        TenLoai = txtTenLoai.Text
                    };

                    db.LoaiHangs.InsertOnSubmit(loaiHang);
                    db.SubmitChanges();

                    Page.ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", "showSuccessMessage();", true);

                    txtTenLoai.Text = "";
                    LoadData();
                }
            }
            catch (Exception ex)
            {
                // Xử lí lỗi
               
            }
        }

        protected void GridViewLoaiHoa_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewLoaiHoa.EditIndex = e.NewEditIndex;
            LoadData();
        }

        protected void GridViewLoaiHoa_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                int maLoai = Convert.ToInt32(GridViewLoaiHoa.DataKeys[e.RowIndex].Values[0]);
                TextBox txtTenLoai = (TextBox)GridViewLoaiHoa.Rows[e.RowIndex].FindControl("txtTenLoai");

                using (shopbanhoatuoiDataContext db = new shopbanhoatuoiDataContext())
                {
                    var loaiHoa = db.LoaiHangs.FirstOrDefault(lh => lh.MaLoai == maLoai);
                    if (loaiHoa != null)
                    {
                        loaiHoa.TenLoai = txtTenLoai.Text.Trim();
                        db.SubmitChanges();
                    }
                }

                GridViewLoaiHoa.EditIndex = -1;
                LoadData();
            }
            catch (Exception ex)
            {
                // Xử lí lỗi
              
            }
        }

        protected void GridViewLoaiHoa_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewLoaiHoa.EditIndex = -1;
            LoadData();
        }

        protected void GridViewLoaiHoa_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int maLoai = Convert.ToInt32(GridViewLoaiHoa.DataKeys[e.RowIndex].Values[0]);

                using (shopbanhoatuoiDataContext db = new shopbanhoatuoiDataContext())
                {
                    var loaiHoa = db.LoaiHangs.FirstOrDefault(lh => lh.MaLoai == maLoai);
                    if (loaiHoa != null)
                    {
                        db.LoaiHangs.DeleteOnSubmit(loaiHoa);
                        db.SubmitChanges();
                    }
                }

                LoadData();
            }
            catch (Exception ex)
            {
                // Xử lí lỗi
               
            }
        }
    }
}
