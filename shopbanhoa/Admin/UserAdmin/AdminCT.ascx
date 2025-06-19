<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdminCT.ascx.cs" Inherits="shopbanhoa.Admin.UserAdmin.AdminCT" %>


 <div class="bg_thongso-all">



     <!----------------------------- code tính tổng doanh thu ----------------------------------->
         <div class="bg_admins-info" data-aos="flip-up">
    <div class="all_info-admins">
        <p class="titles_admin-info">Tổng doanh thu hôm nay</p>
    
        <asp:Label ID="price_admin_info" runat="server" CssClass="price_admin-info" Text="0 VNĐ"></asp:Label>


        <div class="up_price">
           <p>Tiến độ:</p>
           <asp:Label ID="price_increase_doanhthu" runat="server" CssClass="titles-up_price" Text="0"></asp:Label>

        </div>
    </div>
    <div class="bg-sm_admin">
        <i class="fa-solid fa-sack-dollar"></i>
    </div>
</div>


       <!--------------------------- code tổng người mua hàng ------------------------------------->

            <div class="bg_admins-info" data-aos="flip-up">
    <div class="all_info-admins">
        <p class="titles_admin-info">Tổng người mua hôm nay</p>
       <asp:Label ID="price_admin_info_nguoimua" runat="server" CssClass="price_admin-info" Text="0"></asp:Label>
        <div class="up_price">
           
        </div>
    </div>
    <div class="bg-sm_admin" style="background-color:#E53271;">
        <i class="fa-solid fa-users"></i>
    </div>
</div>


       <!------------------------------ code tổng đặt hàng ---------------------------------->

            <div class="bg_admins-info" data-aos="flip-up">
                     
                <div class="all_info-admins">
                     <p class="titles_admin-info">Tổng Đặt Hàng Hôm Nay</p>
                    <asp:Label ID="price_admin_info_donhang" runat="server" CssClass="price_admin-info" Text="0"></asp:Label>
                    
                <div class="up_price">
                     
                </div>
                </div>

                 <div class="bg-sm_admin" style="background-color:#5FB663;">
                    <i class="fa-brands fa-shopify"></i>
                 </div>

            </div>

       <!--------------------------- code tổng đánh giá ------------------------------------->
             <div class="bg_admins-info" data-aos="flip-up">
                     
                <div class="all_info-admins">
                     <p class="titles_admin-info">Tổng Đánh Giá Hôm nay</p>
                 <asp:Label ID="price_admin_info_danhgia" runat="server" CssClass="price_admin-info" Text="0"></asp:Label>
                    
                <div class="up_price">
                    
                </div>
                </div>

                 <div class="bg-sm_admin" style="background-color:#EFD033;">
                   <i class="fa-solid fa-pen"></i>
                 </div>

            </div>


       <!-------------------------- code tổng sản phẩm giảm giá  -------------------------------------->


              <div class="bg_admins-info" data-aos="flip-up">
                     
                <div class="all_info-admins">
                     <p class="titles_admin-info">Tổng Sản Phẩm Giảm Giá</p>
                 <asp:Label ID="price_sanphamgiamgia" runat="server" CssClass="price_admin-info" Text="0"></asp:Label>
                    
                <div class="up_price">
                    
                </div>
                </div>

                 <div class="bg-sm_admin" style="background-color:#FF5A5F;">
                 <i class="fa-solid fa-tag"></i>
                 </div>

            </div>
       <!----------------------------- code tổng sản phẩm cả website ----------------------------------->
              <div class="bg_admins-info" data-aos="flip-up">
                     
                <div class="all_info-admins">
                     <p class="titles_admin-info">Tổng Sản Phẩm</p>
                 <asp:Label ID="price_tongsanpham" runat="server" CssClass="price_admin-info" Text="0"></asp:Label>
                    
                <div class="up_price">
                     
                </div>
                </div>

                 <div class="bg-sm_admin" style="background-color:#FF5A5F;">
              <i class="fa-solid fa-cart-shopping"></i>
                 </div>

            </div>
       <!---------------------------------------------------------------->

        </div>



  <!--------------------------- thông tin báo cáo số liệu chung ------------------------------------->
    <div class="bg-all_report">

                <p class="title-big-report">Báo cáo chung</p>  

        <div class="bodys-all_sm">

        <div class="part-report">

                <div class="report_sms">
                   <i class="fa-solid fa-money-bill"></i>
                </div>

            <div class="report-sm">
                <p class="title-report">Tổng doanh thu chung</p>
                  <asp:Label ID="price_alltime_info" runat="server" CssClass="sum_report" Text="0"></asp:Label>                   
            </div>
           
        </div>



         <div class="part-report">

                <div class="report_sms">
                 <i class="fa-solid fa-bag-shopping"></i>
                </div>

            <div class="report-sm">
                <p class="title-report">Tổng đơn đã đặt hàng</p>
                  <asp:Label ID="price_alltime_info_donhang" runat="server" CssClass="sum_report" Text="0"></asp:Label>             
            </div>
           
        </div>


        
            </div>

    </div>
  <!---------------------------------------------------------------->


  <!----------------------------- bảng danh sách đơn hàng của khách hàng đã mua ----------------------------------->
<!---->
<div class="tb_products">
     <p class="bg-titles-creat" style="background-color:#12B76A;">Bảng danh sách đơn hàng đã mua</p>
   <table class="table-tintuc">
    <thead>
        <tr>
            <th>ID</th>
            <th>Ngày Đặt</th>
            <th>Họ Tên</th>
            <th>Tên SP</th>
            <th>Thành Tiền</th>
        </tr>
    </thead>
    <tbody>
        <% for (int i = 0; i < listDonHang.Count; i++) { %>
        <tr class="product_tr">
            <td><%= listDonHang[i].idDatHang %></td>
            <td><%= listDonHang[i].NgayDat %></td>
            <td><%= listDonHang[i].HoTen %></td>
            <td><%= listDonHang[i].TenSP %></td>
            <td style="color:red;font-weight:600;"><%= string.Format("{0:#,##0} VNĐ", listDonHang[i].ThanhTien) %></td>
        </tr>
       
        <% } %>
    </tbody>
</table>
</div>
 
<!---->
  <!---------------------------------------------------------------->

<script>
    document.addEventListener('DOMContentLoaded', function () {
        AOS.init();
    });

    // Cập nhật lại AOS khi có sự thay đổi trong nội dung của trang
    window.addEventListener('load', function () {
        AOS.refresh();
    });
  </script>




 
       



   

