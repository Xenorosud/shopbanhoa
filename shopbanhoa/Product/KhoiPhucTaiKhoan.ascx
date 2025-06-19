<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="KhoiPhucTaiKhoan.ascx.cs" Inherits="shopbanhoa.Product.KhoiPhucTaiKhoan" %>



<marquee class="bg_run-text">      
         <p class="run_text">Fruits De Haute Qualité đang có chương trình giảm giá các loại hoa quả ngon và tươi!<i class="fa-solid fa-gift"></i> <i class="fa-solid fa-gift"></i> <i class="fa-solid fa-gift"></i>    <span class="run_text" style="margin-left:2rem;">Fruits De Haute Qualité đang có chương trình giảm giá các loại hoa quả ngon và tươi!</span> <i class="fa-solid fa-gift"></i> <i class="fa-solid fa-gift"></i> <i class="fa-solid fa-gift"></i></p>         
     </marquee>
     



     <div class="body_alls">
        <div class="body_login-alls">

            <div class="body_part">
                <div class="img_logins">
            <img src="img/KhoiPhuc.jpg" alt="">
           </div>
           <div class="body_info-logins">
            <h4 class="titles-login">QUYỀN LỢI THÀNH VIÊN</h4>
            <p class="titles_sm-logins"><i class="fa-regular fa-circle-check"></i> Mua hàng khắp thế giới cực dễ dàng, nhanh chóng</p>
            <p class="titles_sm-logins"><i class="fa-regular fa-circle-check"></i> Theo dõi chi tiết đơn hàng, địa chỉ thanh toán dễ dàng</p>
            <p class="titles_sm-logins"><i class="fa-regular fa-circle-check"></i> Nhận nhiều chương trình ưu đãi hấp dẫn từ chúng tôi</p>
            </div>
                 </div>

   <div class="body_parts">
    <div class="form_titles-logins">
        <a href="#" id="form-one" class="form_link active">KHÔI PHỤC MẬT KHẨU</a>
    </div>
    <div class="form_body-sm">
        <input id="txtEmail" runat="server" class="input-text-sm" placeholder="Tên đăng nhập" />
    </div>
    <div class="form_body-sm">
        <input id="txtNewPassword" runat="server" type="password" class="input-text-sm" placeholder="Mật khẩu mới" />
    </div>
    <div class="form_body-sm">
        <input id="txtConfirmNewPassword" runat="server" type="password" class="input-text-sm" placeholder="Xác nhận mật khẩu mới" />
    </div>
    <div class="form_body-btns">
        <button type="submit" name="btnCheckout" onserverclick="btnResetPassword_Click" runat="server"  class="link-btns">KHÔI PHỤC MẬT KHẨU</button>
        
    </div>

        <div id="lblMessage" runat="server" style="margin-top:1rem;color:red;font-weight:600;font-size:14px;"></div>


   
   
</div>






        </div>
    </div>