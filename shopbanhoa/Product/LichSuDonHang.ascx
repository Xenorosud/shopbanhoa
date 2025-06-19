<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LichSuDonHang.ascx.cs" Inherits="shopbanhoa.Product.LichSuDonHang" %>


 <div>
             <p class="title_orders">Lịch sử mua hàng trong tài khoản</p>
            <table border="1">
                <tr>
                    <th>Ngày đặt</th>
                    <th>Mã đơn hàng</th>                  
                    <th>Tên Hoa</th>                               
                    <th>Thành tiền</th>
                     <th>Họ Tên</th>
            <th>Điện thoại</th>
            <th>Email</th>
            <th>Địa chỉ</th>
            <th>Tên thành phố</th>
                    <th>Thanh toán</th>
                </tr>
                <% 
                if (Session["Email"] != null)
                {
                    string email = Session["Email"].ToString();
                    var donDatHangs = LayDonDatHangCuaNguoiDung(email);
                    if (donDatHangs != null && donDatHangs.Count > 0)
                    {
                        foreach (var donDatHang in donDatHangs)
                        {
                            %>
                            <tr>
                                <td><%= donDatHang.NgayDat %></td>
                                <td><%= donDatHang.idDatHang %></td>                   
                                <td><%= donDatHang.TenSP %></td>                           
                                <td><%= string.Format("{0:#,##0} VNĐ", donDatHang.ThanhTien) %></td>
                                <td><%= donDatHang.HoTen %></td>
                                <td><%= donDatHang.Dienthoai %></td>
                                <td><%= donDatHang.Email %></td>
                                <td><%= donDatHang.Diachi %></td>
                                <td><%= donDatHang.TenThanhPho %></td>
                                <td>
                                    <%
                            switch (donDatHang.PhuongThucThanhToan)
                            {
                                case 1:
                                    Response.Write("Thanh toán khi nhận hàng");
                                    break;
                                case 2:
                                    Response.Write("Chuyển khoản ngân hàng");
                                    break;
                                default:
                                    Response.Write("Không xác định");
                                    break;
                            }
                            %>
                        </td>
                            </tr>
                            <% 
                        }
                    }
                    else
                    {
                        %>
                        <tr>
                            <td colspan="13">Không có đơn hàng.</td>
                        </tr>
                        <% 
                    }
                }
                else
                {
                    Response.Redirect("DangNhap.aspx"); // Redirect đến trang đăng nhập nếu chưa đăng nhập
                }
                %>
            </table>
        </div>


<style>
     .title_orders {
        text-align:center;
        padding:14px;
        background-color:#1BBC9B;
        color:#fff;
        margin-bottom:1rem;
        text-transform:uppercase;
        font-size:15px;
        font-weight:600;
        margin-top:2rem;
    }

     table th,td {
         font-size:13px;
         text-align:center;
     }
</style>