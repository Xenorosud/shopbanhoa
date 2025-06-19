using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shopbanhoa.Admin.UserAdmin
{
    public partial class DanhGiaNguoiMua : System.Web.UI.UserControl
    {
        protected shopbanhoatuoiDataContext db = new shopbanhoatuoiDataContext();
        public static List<Review> listReviews = new List<Review>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }
        }

        void LoadData()
        {
            var data = from r in db.Reviews
                       select r;
            if (data != null && data.Count() > 0)
            {
                listReviews = data.ToList();
                GridViewDanhGia.DataSource = listReviews;
                GridViewDanhGia.DataBind();
            }
        }

      
    
        protected void GridViewDanhGia_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int reviewId = Convert.ToInt32(GridViewDanhGia.DataKeys[e.RowIndex].Value);
            var reviewToDelete = db.Reviews.FirstOrDefault(r => r.ReviewId == reviewId);
            if (reviewToDelete != null)
            {
                db.Reviews.DeleteOnSubmit(reviewToDelete);
                db.SubmitChanges();
                LoadData();
                ShowSuccessMessage("Xóa đánh giá thành công!");
            }
        }

        private void ShowSuccessMessage(string message)
        {
           // xử lí ngoại lệ 
        }
    }
}
