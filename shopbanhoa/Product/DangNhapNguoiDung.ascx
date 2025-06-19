<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DangNhapNguoiDung.ascx.cs" Inherits="shopbanhoa.Product.DangNhapNguoiDung" %>

<marquee class="bg_run-text">      
         <p class="run_text">Fruits De Haute Qualité đang có chương trình giảm giá các loại hoa quả ngon và tươi!<i class="fa-solid fa-gift"></i> <i class="fa-solid fa-gift"></i> <i class="fa-solid fa-gift"></i>    <span class="run_text" style="margin-left:2rem;">Fruits De Haute Qualité đang có chương trình giảm giá các loại hoa quả ngon và tươi!</span> <i class="fa-solid fa-gift"></i> <i class="fa-solid fa-gift"></i> <i class="fa-solid fa-gift"></i></p>         
     </marquee>

<div class="body_alls">
    <div class="body_login-alls">
        <div class="body_part">
            <div class="img_logins">
                <img src="img/thongtinTC.png" alt="">
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
                <a href="#" id="form-one" class="form_link active">ĐĂNG NHẬP</a>
            </div>

            <!-- nhập các thông tin đăng nhập ------------------------------------------------------------------->
            <div class="form_body-sm">
                <asp:TextBox ID="txtUsername" runat="server" CssClass="input-text-sm" placeholder="Nhập Email...."></asp:TextBox>
                <span id="usernameError" class="error-message" style="color: red; display: none;">Vui lòng nhập Tên Đăng nhập</span>
            </div>
            <div class="form_body-sm">
                <asp:TextBox ID="txtPassword" runat="server" CssClass="input-text-sm" TextMode="Password" placeholder="Nhập mật khẩu...."></asp:TextBox>
                <span id="passwordError" class="error-message" style="color: red; display: none;">Vui lòng nhập Mật khẩu</span>
            </div>

            <!-------------------------------------------------------------------------------------------------------->
            <div class="form_body-fg">
                <span><a href="KhoiPhucMatKhau.aspx" class="link_forgot">Quên mật khẩu?</a></span>
            </div>
            <div class="form_body-btns">
                <asp:Button runat="server" ID="btnCheckout" CssClass="link-btns" OnClick="login_Click" Text="Đăng nhập"/>
               
            </div>
             <span id="loginError" class="error-message" style="color: red; display: none;">Thông tin tài khoản hoặc mật khẩu sai</span>
            <div class="body_logins-now">
                <p class="titles-now" style="margin-top: 1rem;">Bạn chưa có tài khoản: <a href="DangKy.aspx" class="link_now" style="color: red;font-size: 14px;font-weight:600;">Đăng ký ngay</a></p>
            </div>
        </div>
    </div>
</div>




       <!----------------- JS xử lí các thông báo khi người dùng chưa nhập đủ thông tin và Enter ------------------->
<script>
    document.addEventListener('DOMContentLoaded', function () {
        var btnCheckout = document.getElementById('<%= btnCheckout.ClientID %>');
        var txtUsername = document.getElementById('<%= txtUsername.ClientID %>');
        var txtPassword = document.getElementById('<%= txtPassword.ClientID %>');

        function validateForm(event) {
            var isValid = true;

            var username = txtUsername.value;
            var password = txtPassword.value;

            var usernameError = document.getElementById('usernameError');
            var passwordError = document.getElementById('passwordError');

            if (!username) {
                usernameError.style.display = 'block';
                isValid = false;
            } else {
                usernameError.style.display = 'none';
            }

            if (!password) {
                passwordError.style.display = 'block';
                isValid = false;
            } else {
                passwordError.style.display = 'none';
            }

            if (!isValid) {
                event.preventDefault();
            }
        }

        btnCheckout.addEventListener('click', function (event) {
            validateForm(event);
        });

        document.addEventListener('keydown', function (event) {
            if (event.key === 'Enter') {
                validateForm(event);
                if (event.defaultPrevented) {
                    btnCheckout.click();
                }
            }
        });
    });

    function showError(message) {
        var loginError = document.getElementById('loginError');
        loginError.textContent = message;
        loginError.style.display = 'block';
    }
</script>
