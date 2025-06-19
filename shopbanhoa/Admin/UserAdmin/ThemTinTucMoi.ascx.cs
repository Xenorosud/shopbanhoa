using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace shopbanhoa.Admin.UserAdmin
{
    public partial class ThemTinTucMoi : System.Web.UI.UserControl
    {
        protected shopbanhoatuoiDataContext db = new shopbanhoatuoiDataContext();
        public static List<TinTuc> listTinTuc = new List<TinTuc>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }
        }

        void LoadData()
        {
            var data = from q in db.TinTucs
                       select q;
            if (data != null && data.Count() > 0)
            {
                listTinTuc = data.ToList();
                GridViewTinTuc.DataSource = listTinTuc;
                GridViewTinTuc.DataBind();
            }
        }

        protected void btnThemTinTuc_Click(object sender, EventArgs e)
        {
            if (txtTieuDe.Text.Trim().Length == 0 || txtNoiDung.Text.Trim().Length == 0 || !fuAnhSanPhamtintuc.HasFile)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "ErrorMessage", "showErrorMessage('Vui lòng nhập đầy đủ thông tin!');", true);
                return;
            }

            if (fuAnhSanPhamtintuc.HasFile)
            {
                string fileName = Path.GetFileName(fuAnhSanPhamtintuc.FileName);
                string filePath = "~/img/" + fileName;
                fuAnhSanPhamtintuc.SaveAs(Server.MapPath(filePath));
                string anhtintuc = filePath;

                using (shopbanhoatuoiDataContext db = new shopbanhoatuoiDataContext())
                {
                    TinTuc tintucmoi = new TinTuc
                    {
                        HinhAnh = anhtintuc,
                        TieuDe = txtTieuDe.Text,
                        NoiDung = txtNoiDung.Text
                    };

                    db.TinTucs.InsertOnSubmit(tintucmoi);
                    db.SubmitChanges();
                    LoadData();
                }

                Page.ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", "showSuccessMessage();", true);
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "ErrorMessage", "showErrorMessage('Vui lòng nhập đủ thông tin của tin tức!');", true);
            }
        }

        protected void GridViewTinTuc_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewTinTuc.EditIndex = e.NewEditIndex;
            LoadData();
        }

        protected void GridViewTinTuc_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                int maTT = Convert.ToInt32(GridViewTinTuc.DataKeys[e.RowIndex].Values[0]);
                TextBox txtTieuDeEdit = (TextBox)GridViewTinTuc.Rows[e.RowIndex].FindControl("txtTieuDeEdit");
                TextBox txtNoiDungEdit = (TextBox)GridViewTinTuc.Rows[e.RowIndex].FindControl("txtNoiDungEdit");
                FileUpload fuAnhSanPhamEdit = (FileUpload)GridViewTinTuc.Rows[e.RowIndex].FindControl("fuAnhSanPhamEdit");
                HiddenField hfAnhHienTai = (HiddenField)GridViewTinTuc.Rows[e.RowIndex].FindControl("hfAnhHienTai");

                string anhtintuc = hfAnhHienTai.Value;

                if (fuAnhSanPhamEdit.HasFile)
                {
                    string fileName = Path.GetFileName(fuAnhSanPhamEdit.FileName);
                    string filePath = "~/img/" + fileName;
                    fuAnhSanPhamEdit.SaveAs(Server.MapPath(filePath));
                    anhtintuc = filePath;
                }

                using (shopbanhoatuoiDataContext db = new shopbanhoatuoiDataContext())
                {
                    var tintuc = db.TinTucs.FirstOrDefault(tt => tt.MaTT == maTT);
                    if (tintuc != null)
                    {
                        tintuc.TieuDe = txtTieuDeEdit.Text.Trim();
                        tintuc.NoiDung = txtNoiDungEdit.Text.Trim();
                        tintuc.HinhAnh = anhtintuc;
                        db.SubmitChanges();
                    }
                }

                GridViewTinTuc.EditIndex = -1;
                LoadData();
            }
            catch (Exception ex)
            {
               
            }
        }

        protected void GridViewTinTuc_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewTinTuc.EditIndex = -1;
            LoadData();
        }

        protected void GridViewTinTuc_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int maTT = Convert.ToInt32(GridViewTinTuc.DataKeys[e.RowIndex].Values[0]);

                using (shopbanhoatuoiDataContext db = new shopbanhoatuoiDataContext())
                {
                    var tintuc = db.TinTucs.FirstOrDefault(tt => tt.MaTT == maTT);
                    if (tintuc != null)
                    {
                        db.TinTucs.DeleteOnSubmit(tintuc);
                        db.SubmitChanges();
                    }
                }

                LoadData();
            }
            catch (Exception ex)
            {
               
            }
        }
    }
}
