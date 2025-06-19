using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shopbanhoa
{
    public partial class AdminHome : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnQuayVeTrangChu_Click(object sender, EventArgs e)
        {
            // Chuyển hướng về trang chủ của website
            Response.Redirect("~/Trangchu.aspx");
        }

    }
}