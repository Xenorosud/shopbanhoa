using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shopbanhoa.Admin.UserAdmin
{
    public partial class QuanLyDonHang : System.Web.UI.UserControl
    {
        protected shopbanhoatuoiDataContext db = new shopbanhoatuoiDataContext();
        public static List<DatHang> listDonHang = new List<DatHang>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }
        }

        void LoadData()
        {
            var data = from q in db.DatHangs
                       select q;
            if (data != null && data.Count() > 0)
            {
                listDonHang = data.ToList();
                GridViewDonHang.DataSource = listDonHang;
                GridViewDonHang.DataBind();
            }
        }

        protected void GridViewDonHang_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int idDatHang = Convert.ToInt32(GridViewDonHang.DataKeys[e.RowIndex].Value);

                using (shopbanhoatuoiDataContext db = new shopbanhoatuoiDataContext())
                {
                    var donHang = db.DatHangs.FirstOrDefault(dh => dh.idDatHang == idDatHang);
                    if (donHang != null)
                    {
                        db.DatHangs.DeleteOnSubmit(donHang);
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
