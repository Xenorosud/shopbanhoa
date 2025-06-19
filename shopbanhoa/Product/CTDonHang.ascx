<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CTDonHang.ascx.cs" Inherits="shopbanhoa.Product.CTDonHang" %>



<div class="bg_orders">
    <p class="title_orders">Danh sách đơn hàng</p>

     <div style="max-height: 600px; overflow-y: auto;margin-top:1.8rem;">
    <% if (DatHangsp != null && DatHangsp.Count() > 0) { %>
    <table border="1" class="table_bodys">
        <tr>
           
            <th>Ngày đặt</th>
            <th>Thanh Toán</th>           
            <th>Tên SP</th>
            <th>Số lượng</th>                   
            <th>Thành tiền</th>
            <th>Họ Tên</th>
            <th>Điện thoại</th>
            <th>Email</th>
            <th>Địa chỉ</th>
            <th>Tên thành phố</th>
        </tr>
        <% for (int i = 0; i < DatHangsp.Count; i++)
           { %>
            <tr>
              
                <td><%= DatHangsp[i].NgayDat %></td>
                <td>
    <% 
        if (DatHangsp[i].PhuongThucThanhToan == 1)
        {
            Response.Write("Thanh toán khi nhận hàng");
        }
        else if (DatHangsp[i].PhuongThucThanhToan == 2)
        {
            Response.Write("Chuyển khoản ngân hàng");
        }
        else
        {
            Response.Write("Không xác định");
        }
    %>
</td>

               
                <td><%= DatHangsp[i].TenSP %></td>
                <td><%= DatHangsp[i].SoLuong %></td>              
                <td><%= string.Format("{0:#,##0} VNĐ", DatHangsp[i].ThanhTien) %></td>
               <td><%= DatHangsp[i].HoTen %></td>
                 <td><%= DatHangsp[i].Dienthoai %></td>
                 <td><%= DatHangsp[i].Email %></td>
                 <td><%= DatHangsp[i].Diachi %></td>
                 <td><%= DatHangsp[i].TenThanhPho %></td>
            </tr>
        <% } %>
    </table>
<% } else { %>
    <p>Đơn hàng trống!</p>
<% } %>
</div>


     <div class="btn-again">
           
                <a href="ChiTietDatHang.aspx" class="btn_link-again"><i class="fa-solid fa-chevron-left"></i>Quay lại trang đặt hàng</a>
           
        </div>
    </div>





<style>
    .bg_orders {
        padding:10px;
    }
    .title_orders {
        text-align:center;
        padding:14px;
        background-color:#1BBC9B;
        color:#fff;
        margin-bottom:1rem;
        text-transform:uppercase;
        font-size:15px;
        font-weight:600;
    }
</style>