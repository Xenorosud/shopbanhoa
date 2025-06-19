using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shopbanhoa.Admin
{
    public partial class ThemTinTuc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null || Session["IDQuyen"] == null || (int)Session["IDQuyen"] != 1)
            {
                Response.Redirect("~/DangNhap.aspx");
            }

            shopbanhoatuoiDataContext db = new shopbanhoatuoiDataContext();
            string email = Session["Email"].ToString();
            var user = db.TaiKhoans.FirstOrDefault(u => u.Email == email);

            if (user == null)
            {
                Response.Redirect("~/DangNhap.aspx");
            }


        }
    }
}