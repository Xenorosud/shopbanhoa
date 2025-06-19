using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shopbanhoa.Product
{
    public partial class SanPhamYeuThich : System.Web.UI.UserControl
    {
        shopbanhoatuoiDataContext db = new shopbanhoatuoiDataContext();

        public static List<SanPham> listSP = new List<SanPham>();



        public SanPham sanPham;
        public int quantity;
        public decimal totalAmount;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
              

            }
        }

        void LoadData()
        {
            try
            {
                if (Request.QueryString["MaSP"] != null && Request.QueryString["quantity"] != null)
                {
                    long maSP = Convert.ToInt64(Request.QueryString["MaSP"]);
                    quantity = int.Parse(Request.QueryString["quantity"]);

                    var data = from q in db.SanPhams
                               where q.MaSP == maSP
                               select q;
                    if (data != null && data.Count() > 0)
                    {
                        sanPham = data.First();

                        // Kiểm tra xem sản phẩm đã tồn tại trong danh sách chưa =======================
                        var existingProduct = listSP.FirstOrDefault(p => p.MaSP == maSP);
                        if (existingProduct != null)
                        {
                            // Nếu sản phẩm đã tồn tại, cập nhật số lượng ================================
                            existingProduct.SoLuong += quantity;
                        }
                        else
                        {
                            // Nếu sản phẩm chưa tồn tại, thêm mới vào danh sách=======================
                            sanPham.SoLuong = quantity;
                            listSP.Add(sanPham);
                        }
                    }
                    else
                    {
                        Response.Redirect("Error.aspx?");
                    }
                }
            }

            catch (Exception ex)
            {
                Response.Redirect("Error.aspx?message=" + ex.Message);
            }
        }
    }
}