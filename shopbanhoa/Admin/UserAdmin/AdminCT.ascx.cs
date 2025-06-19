using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shopbanhoa.Admin.UserAdmin
{
    public partial class AdminCT : System.Web.UI.UserControl
    {
        protected shopbanhoatuoiDataContext db = new shopbanhoatuoiDataContext();
        public static List<DatHang> listDonHang = new List<DatHang>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CapNhatThongTinDoanhThu();
                CapNhatNguoiMuaHang();
                CapNhatDonHangHomNay();
                CapNhatDanhGiaHomNay();
                CapNhatTongSanPhamGiamGia();
                CapNhatTongSanPham();
                CapNhatTongDoanhThu();
                CapNhatTongDathang();
                Loadtheodoanhthu();
            }
        }


        // ------------------ cập nhật tổng doanh thu hôm nay ===================================
        protected void CapNhatThongTinDoanhThu()
        {
            using (var db = new shopbanhoatuoiDataContext())
            {
                DateTime homNay = DateTime.Today;

                // Kiểm tra xem có đơn hàng nào được đặt trong ngày hôm nay không============
                var donHangHomNay = db.DatHangs
                                        .Where(dh => dh.NgayDat.HasValue && dh.NgayDat.Value.Date == homNay);

                // Nếu không có đơn hàng nào được đặt, hiển thị tổng doanh thu là 0=============
                if (!donHangHomNay.Any())
                {
                    price_admin_info.Text = "0 VNĐ";
                    price_increase_doanhthu.Text = "+0 VNĐ";
                    return;
                }

                // Tính tổng doanh thu của ngày hôm nay============
                decimal tongDoanhThuHomNay = donHangHomNay
                                                .Where(dh => dh.ThanhTien.HasValue)
                                                .Sum(dh => dh.ThanhTien.Value);

                // Lấy tổng doanh thu của các ngày trước hôm nay=======
                DateTime homNayTruoc = homNay.AddDays(-1); // Ví dụ, lấy tổng doanh thu của hôm qua==========
                var donHangHomNayTruoc = db.DatHangs
                                           .Where(dh => dh.NgayDat.HasValue && dh.NgayDat.Value.Date == homNayTruoc && dh.ThanhTien.HasValue);

                decimal tongDoanhThuHomNayTruoc = donHangHomNayTruoc.Any() ? donHangHomNayTruoc.Sum(dh => dh.ThanhTien.Value) : 0;

                // Tính số tiền tăng so với hôm qua=========
                decimal soTienTang = tongDoanhThuHomNay - tongDoanhThuHomNayTruoc;

                // Nếu tổng doanh thu hôm nay nhỏ hơn hoặc bằng 0, đặt giá trị là 0===========
                if (tongDoanhThuHomNay <= 0)
                {
                    price_admin_info.Text = "0 VNĐ";
                    price_increase_doanhthu.Text = "+0 VNĐ";
                    return;
                }

                // Hiển thị tổng doanh thu của ngày hôm nay====
                price_admin_info.Text = tongDoanhThuHomNay.ToString("N0") + " VNĐ";

                // Hiển thị số tiền tăng===========
                price_increase_doanhthu.Text = soTienTang.ToString("N0") + " VNĐ";
            }
        }





        //--------------------------------------------cập nhật người mua hàng hôm nay
        protected void CapNhatNguoiMuaHang()
        {
            using (var db = new shopbanhoatuoiDataContext())
            {
                DateTime homNay = DateTime.Today;
                int tongNguoiMuaHangHomNay = db.DatHangs.Where(dh => dh.NgayDat.HasValue && dh.NgayDat.Value.Date == homNay).Select(dh => dh.HoTen).Distinct().Count();
                price_admin_info_nguoimua.Text = tongNguoiMuaHangHomNay.ToString();
            }
        }

        //--------------------------------------------------cập nhật đơn đặt hàng hôm nay 
        protected void CapNhatDonHangHomNay()
        {
            using (var db = new shopbanhoatuoiDataContext())
            {
                DateTime homNay = DateTime.Today;
                int tongDonHangHomNay = db.DatHangs.Where(dh => dh.NgayDat.HasValue && dh.NgayDat.Value.Date == homNay).Count();
                price_admin_info_donhang.Text = tongDonHangHomNay.ToString();
            }
        }

        //-----------------------------------------------------cập nhật đánh giá hôm nay 
        protected void CapNhatDanhGiaHomNay()
        {
            using (var db = new shopbanhoatuoiDataContext())
            {
                DateTime homNay = DateTime.Today;
                int tongDanhGiaHomNay = db.Reviews.Where(dg => dg.NgayDanhGia.HasValue && dg.NgayDanhGia.Value.Date == homNay).Count();
                price_admin_info_danhgia.Text = tongDanhGiaHomNay.ToString();
            }
        }

        //--------------------------------------------cập nhật tổng sản phẩm giảm giá 
        protected void CapNhatTongSanPhamGiamGia()
        {
            using (var db = new shopbanhoatuoiDataContext())
            {
                int tongSanPhamGiamGia = db.SanPhams.Where(p => p.GiamGia > 0).Count();
                price_sanphamgiamgia.Text = tongSanPhamGiamGia.ToString();
            }
        }

        //--------------------------------------- cập nhật tổng số lượng sản phẩm 
        protected void CapNhatTongSanPham()
        {
            using (var db = new shopbanhoatuoiDataContext())
            {
                int tongSanPham = db.SanPhams.Count();
                price_tongsanpham.Text = tongSanPham.ToString();
            }
        }

        //------------------------------------------------------------ tổng doanh thu chung 
        protected void CapNhatTongDoanhThu()
        {
            using (var db = new shopbanhoatuoiDataContext())
            {
                DateTime homNay = DateTime.Today;
                // Tính tổng doanh thu của tất cả các ngày
                decimal tongDoanhThuTatCaCacNgay = db.DatHangs.Where(dh => dh.NgayDat.HasValue && dh.ThanhTien.HasValue).Sum(dh => dh.ThanhTien.Value);
                // Lấy tổng số đơn hàng của tất cả các ngày
                int tongDonHangTatCaCacNgay = db.DatHangs.Count();
                // Hiển thị tổng doanh thu của tất cả các ngày
                price_alltime_info.Text = tongDoanhThuTatCaCacNgay.ToString("N0") + " VNĐ";
            }
        }
        //------------------------------------------------------------
        protected void CapNhatTongDathang()
        {
            using (var db = new shopbanhoatuoiDataContext())
            {
                DateTime homNay = DateTime.Today;
                // Tính tổng doanh thu của tất cả các ngày
                decimal tongDoanhThuTatCaCacNgay = db.DatHangs.Where(dh => dh.NgayDat.HasValue && dh.ThanhTien.HasValue).Sum(dh => dh.ThanhTien.Value);
                // Lấy tổng số đơn hàng của tất cả các ngày
                int tongDonHangTatCaCacNgay = db.DatHangs.Count();
                // Hiển thị tổng doanh thu của tất cả các ngày
                price_alltime_info_donhang.Text = tongDonHangTatCaCacNgay.ToString();
            }
        }
        //------------------------------------------------------------
        //--- load doanh thu theo các ngày 

        void Loadtheodoanhthu()
        {
            var data = from q in db.DatHangs
                       select q;
            if (data != null && data.Count() > 0)
            {
                listDonHang = data.ToList();
            }
        }



        //---------------------------------
    }
}