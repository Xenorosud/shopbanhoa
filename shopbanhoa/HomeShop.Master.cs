using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shopbanhoa
{
    public partial class HomeShop : System.Web.UI.MasterPage
    {
        shopbanhoatuoiDataContext db = new shopbanhoatuoiDataContext();
       
        public static List<LoaiHang> listLoaiHang = new List<LoaiHang>();
        public List<TaiKhoan> TKnguoimua = new List<TaiKhoan>();
       

        
       

      

        protected void Page_Load(object sender, EventArgs e)
        {
           
               
            if (!IsPostBack)
            {
                LoadData();
               
               
            }
        }

       
      

       
      

        //===============================================================================================
        // load loại hàng từ CSDL
        void LoadData()
        {
            var loaiHangs = (from lh in db.LoaiHangs
                             select lh).ToList();

            if (loaiHangs != null && loaiHangs.Count > 0)
            {
                listLoaiHang = loaiHangs;
            }
        }

        //===============================================================================================
        // code gửi đánh giá người dùng 
        protected void btnClick(object sender, EventArgs e)
        {
            string userName = txtUserName.Value;
            string userEmail = txtUserEmail.Value;
            string comment = txtComment.Value;
            if (string.IsNullOrEmpty(userName) || string.IsNullOrEmpty(userEmail) || string.IsNullOrEmpty(comment))
            {

                return;
            }

            // Lưu đánh giá vào cơ sở dữ liệu
            SaveDB(userName, userEmail, comment);
            Response.Redirect("Thankyou.aspx");
        }

        private void SaveDB(string userName, string userEmail, string comment)
        {
            using (var db = new shopbanhoatuoiDataContext())
            {
                var newReview = new Review
                {
                    UserName = userName,
                    Email = userEmail,
                    Comment = comment,
                    NgayDanhGia = DateTime.Now
                };

                db.Reviews.InsertOnSubmit(newReview);
                db.SubmitChanges();
            }



        }

        //===============================================

      

      
       


       
       

    }
}


