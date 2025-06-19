using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shopbanhoa.Product
{
    public partial class DatHangCT : System.Web.UI.UserControl
    {
        shopbanhoatuoiDataContext db = new shopbanhoatuoiDataContext();

        // Khởi tạo danh sách tĩnh để lưu trữ sản phẩm-----
        public static List<SanPham> listSP = new List<SanPham>();


        // Các biến lưu trữ thông tin sản phẩm, số lượng và tổng số tiền-------------
        public SanPham sanPham;
        public int quantity;
        public decimal totalAmount;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
                BindGrid();  // Cập nhật hiển thị giỏ hàng ----
                UpdateTotal(); // cập nhật tổng tiền 
            }
        }

        void LoadData()
        {
            try
            {
                if (Request.QueryString["MaSP"] != null && Request.QueryString["quantity"] != null) // lấy thông tin trong URL -------------
                {
                    long maSP = Convert.ToInt64(Request.QueryString["MaSP"]);
                    quantity = int.Parse(Request.QueryString["quantity"]);

                    // Truy vấn cơ sở dữ liệu để lấy thông tin sản phẩm
                    var data = from q in db.SanPhams
                               where q.MaSP == maSP
                               select q;
                    if (data != null && data.Count() > 0)
                    {
                        sanPham = data.First();

                        var existingProduct = listSP.FirstOrDefault(p => p.MaSP == maSP);
                        if (existingProduct != null)
                        {
                            // nếu có sản phẩm ròi thì cộng dồn vào 
                            existingProduct.SoLuong += quantity;
                        }
                        else
                        {
                            // chưa có thì thêm mới vào 
                            sanPham.SoLuong = quantity;
                            listSP.Add(sanPham); // add thêm vào listSP 
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


        // Phương thức này cập nhật hiển thị giỏ hàng----
        void BindGrid()
        {
            if (listSP.Count > 0)
            {
                gvCart.DataSource = listSP;
                gvCart.DataBind(); // databind lấy dữ liệu từ các control điều khiển trong GridView
                gvCart.Visible = true;
                emptyCartMessage.Visible = false; // dòng này chạy khi có sản phẩm trong giỏ hàng ---
            }
            else
            {
                gvCart.Visible = false;
                emptyCartMessage.Visible = true; 
            }
        }

        // Phương thức này cập nhật tổng số lượng và tổng tiền--------------
        void UpdateTotal()
        {
            if (listSP.Count > 0)
            {
                decimal total = 0;
                int totalQuantity = 0;
                foreach (var item in listSP)
                {
                    decimal giaBan = item.GiaBan ?? 0;
                    decimal giamGia = item.GiamGia ?? 0;
                    decimal giaSauGiam = giaBan - (giaBan * giamGia / 100);
                    item.Giakhuyenmai = giaSauGiam * item.SoLuong ?? 0;
                    total += giaSauGiam * item.SoLuong ?? 0;
                    totalQuantity += item.SoLuong ?? 0;
                }
                totalAmount = total;

                // Hiển thị tổng số lượng và tổng tiền----------
                lblTotalQuantity.Text = totalQuantity.ToString();
                lblTotalAmount.Text = string.Format("{0:#,##0} VNĐ", totalAmount);
                lblTotalAmounts.Text = string.Format("{0:#,##0} VNĐ", totalAmount);

               
            }
            else
            {
                // Nếu giỏ hàng trống, hiển thị số lượng và tiền là 0
                lblTotalQuantity.Text = "0";
                lblTotalAmount.Text = "0 VNĐ";
                lblTotalAmounts.Text = "0 VNĐ";

              
            }
        }


        // Xử lý các lệnh xóa và tăng , giảm số lượng  từ người dùng trong giỏ hàng-----------------
        protected void gvCart_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteProduct" || e.CommandName == "IncreaseQuantity" || e.CommandName == "DecreaseQuantity")
            {
                long maSP = Convert.ToInt64(e.CommandArgument);

                var product = listSP.FirstOrDefault(p => p.MaSP == maSP);
                if (product != null)
                {
                    switch (e.CommandName)
                    {
                        case "DeleteProduct":
                            listSP.Remove(product);
                            break;

                        case "IncreaseQuantity":
                            product.SoLuong++;
                            break;

                        case "DecreaseQuantity":
                            if (product.SoLuong > 1)
                            {
                                product.SoLuong--;
                            }
                            break;
                    }

                    BindGrid();
                    UpdateTotal();
                  
                }
            }
        }

        // cập nhật giá trị tổng tiền  khi tăng số lượng trong giỏ hàng 
        protected void gvCart_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                SanPham product = (SanPham)e.Row.DataItem;
                if (product != null)
                {
                    // Cập nhật giá trị "Thành tiền" từ danh sách sản phẩm
                    Label lblThanhTien = (Label)e.Row.FindControl("lblThanhTien");
                    if (lblThanhTien != null)
                    {
                        decimal thanhTien = product.Giakhuyenmai ?? 0;
                        lblThanhTien.Text = string.Format("{0:#,##0} VNĐ", thanhTien);
                    }
                }
            }
        }


        protected void btnDathang_Click(object sender, EventArgs e)
        {
            try
            {
                if (listSP.Count == 0)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "ErrorMessage", "showErrorMessage('Không có sản phẩm trong giỏ hàng!');", true);
                    return;
                }
                if (string.IsNullOrEmpty(txtHoten.Text) || string.IsNullOrEmpty(txtsdt.Text) || string.IsNullOrEmpty(txtemail.Text) || string.IsNullOrEmpty(txtdiachi.Text) || string.IsNullOrEmpty(txtTenThanhPho.Text))
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "ErrorMessage", "showErrorMessage('Vui lòng điền đủ thông tin thanh toán!');", true);
                    return;
                }

                // Tạo đối tượng DatHang để lưu thông tin đơn hàng
                DatHang datHang = new DatHang();
                datHang.HoTen = txtHoten.Text;
                datHang.Dienthoai = txtsdt.Text;
                datHang.Email = txtemail.Text;
                datHang.Diachi = txtdiachi.Text;
                datHang.TenThanhPho = txtTenThanhPho.Text;
                datHang.PhuongThucThanhToan = Convert.ToInt32(ddlPaymentMethod.SelectedValue);
                datHang.NgayDat = DateTime.Now;

                // Tạo một chuỗi để lưu tên các sản phẩm
                string tenSanPham = "";
                string AnhSanPham = "";
                foreach (var sanPham in listSP)
                {
                    // Thêm tên sản phẩm vào chuỗi
                    tenSanPham += sanPham.TenSP + ", ";
                    AnhSanPham += sanPham.AnhSP + ", ";
                }

                // Loại bỏ dấu phẩy ở cuối chuỗi
                tenSanPham = tenSanPham.TrimEnd(' ', ',');
                AnhSanPham = AnhSanPham.TrimEnd(' ', ',');

                // Gán tên sản phẩm vào đơn hàng
                datHang.TenSP = tenSanPham;
                datHang.AnhSP = AnhSanPham;

                // Tính tổng số lượng và tổng tiền
                int totalQuantity = 0;
                decimal totalAmount = 0;
                foreach (var sanPham in listSP)
                {
                    totalQuantity += sanPham.SoLuong ?? 0;
                    decimal giaBan = sanPham.GiaBan ?? 0;
                    decimal giamGia = sanPham.GiamGia ?? 0;
                    decimal giaSauGiam = giaBan - (giaBan * giamGia / 100);
                    totalAmount += giaSauGiam * (sanPham.SoLuong ?? 0);
                }

                // Gán tổng số lượng và tổng tiền vào đơn hàng
                datHang.SoLuong = totalQuantity;
                datHang.ThanhTien = totalAmount;

                // Thêm đơn hàng vào bảng DatHang
                db.DatHangs.InsertOnSubmit(datHang);
                db.SubmitChanges();

                // Xóa thông tin giỏ hàng và các trường nhập liệu
                txtHoten.Text = "";
                txtsdt.Text = "";
                txtemail.Text = "";
                txtdiachi.Text = "";
                txtTenThanhPho.Text = "";
                lblTotalAmount.Text = "0 VNĐ";
                lblTotalAmounts.Text = "0 VNĐ";
                lblTotalQuantity.Text = "0";
                listSP.Clear();

               

                ScriptManager.RegisterStartupScript(this, GetType(), "SuccessMessage", "showSuccessMessage();", true);
            }
            catch (Exception ex)
            {
                Response.Redirect("Error.aspx?message=" + ex.Message);
            }
        }


    }
}


