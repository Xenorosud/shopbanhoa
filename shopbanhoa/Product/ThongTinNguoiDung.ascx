<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ThongTinNguoiDung.ascx.cs" Inherits="shopbanhoa.Product.ThongTinNguoiDung" %>



<div class="bg_info-accounts">






 <!------------------------- thông tin tài khoản ------------------------------------->
<div class="account_part">


    <% if (TKnguoimua != null && TKnguoimua.Count > 0) { %>
    <% for (int i = 0; i < TKnguoimua.Count; i++) { %>
        <div class="part_account-sm">
                <p class="title_account">Thông tin tài khoản người mua</p>


            <div class="info_account-change">
                <label class="label_accounts">Mã tài khoản</label>
                 <p class="info_title_sm"><%= TKnguoimua[i].MaNguoiDung %></p>
            </div>
             <div class="info_account-change">
                  <label class="label_accounts">Họ và Tên</label>
                  <p class="info_title_sm"><%= TKnguoimua[i].HoTen %></p>
            </div>
             <div class="info_account-change">
                  <label class="label_accounts">Email</label>
                   <p class="info_title_sm"><%= TKnguoimua[i].Email %></p>
            </div>
             <div class="info_account-change">
                 <div class="label_sms">
                      <label class="label_accounts">Mật khẩu</label>
                      <a href="KhoiPhucMatKhau.aspx" class="links_labels">Đổi mật khẩu</a>
                 </div>
                  <p class="info_title_sm"><%= TKnguoimua[i].Matkhau %></p>
            </div>
            
             
                 <div class="info_account-change">
                      <label class="label_accounts">Số điện thoại</label>
                      <p class="info_title_sm"><%= TKnguoimua[i].Dienthoai %></p>
            </div>                                                               
        </div>
    <% } %>
<% } else { %>
    <p>Thông tin tài khoản không tồn tại !.</p>
<% } %>


</div>


 <!--  ------------------------------------------------------------>



 <!-- thông tin hiển thị đơn hàng tài khoản đã mua ------------------------------------------------------------>
<div class="account_part">
    <p class="title_account" style="margin-top:1rem;margin-bottom:1rem;">Đơn hàng gần đây</p>
    <% 
    if (Session["Email"] != null && Session["IDQuyen"] != null)
    {
        var loggedInUserEmail = Session["Email"].ToString();
        var loggedInUserRoleID = (int)Session["IDQuyen"];
        var loggedInUserRole = loggedInUserRoleID == 1 ? "Admin" : "User";

        if (loggedInUserRole == "Admin")
        {
            %>
        <a href="javascript:void(0);" style="background-color: #F3453F; color: white; padding: 8px; border-radius: 20px;" onclick="redirectToUserInfo();">Tài khoản người dùng : <%= loggedInUserEmail %></a>
       
        <%
    }
    else
    {
        %>
     
        <div class="info_main-account">
            <a href="javascript:void(0);" onclick="redirectToUserInfo();">Tài khoản người dùng : <%= loggedInUserEmail %></a>
        </div>
       
        
        <!-- Hiển thị danh sách đơn đặt hàng -->
        <% 
            // Hiển thị danh sách đơn đặt hàng
            var donDatHangs = LayDonDatHangCuaNguoiDung(loggedInUserEmail);
            if (donDatHangs != null && donDatHangs.Count > 0)
            {
                %>
                     <div style="max-height: 530px; overflow-y: auto;">
                <table border="1" class="table_bodys" style="margin-bottom:2rem;">
                    <tr>
                        <th>Ngày đặt</th>
                        <th>Mã đơn hàng</th>                      
                        <th>Tên Hoa</th>                                            
                        <th>Thành tiền</th>
                        <th>Thanh toán</th>
                    </tr>
                    <% foreach (var donDatHang in donDatHangs) { %>
                    <tr>
                        <td><%= donDatHang.NgayDat %></td>
                        <td><%= donDatHang.idDatHang %></td>                       
                        <td><%= donDatHang.TenSP %></td>                    
                        <td><%= string.Format("{0:#,##0} VNĐ", donDatHang.ThanhTien) %></td>
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
                    <% } %>
                </table>
              </div>
                <%
            }
            else
            {
                %>
                <p style="margin-top:2rem;margin-bottom:1rem;">Không có đơn đặt hàng.</p>
                <%
            }
            %>
            <%
        }
    }
    else
    {
        %>
        <a href="DangNhap.aspx" class="link-icons">
            <i class="fa-solid fa-user"></i>
        </a>
        <%
    }
    %>

     <a href="LichSuMuaHang.aspx" style="margin-top:5rem;color:#333;">Xem chi tiết lịch sử mua hàng <i class="fa-solid fa-arrow-right"></i></a> 
</div>

   
<!------------------------------------------------------------------------------------->
    </div>
