<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DangKyNguoiDung.ascx.cs" Inherits="shopbanhoa.Product.DangKyNguoiDung" %>

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
                <a href="#" id="form-one" class="form_link active">ĐĂNG KÝ</a>
            </div>


             <!-- nhập các thông tin đăng ký -------------------------------------------------------------- -->
            <div class="form_body-sm">
                <asp:TextBox ID="txtHoTen" runat="server" CssClass="input-text-sm" placeholder="Họ và Tên..." />
                <span id="hoTenError" class="error-message" style="color: red; display: none;">Vui lòng nhập Họ và Tên</span>
            </div>
            <div class="form_body-sm">
                <asp:TextBox ID="txtDienThoai" runat="server" CssClass="input-text-sm" placeholder="Nhập số điện thoại..." />
                <span id="dienThoaiError" class="error-message" style="color: red; display: none;">Vui lòng nhập Số điện thoại</span>
            </div>
            <div class="form_body-sm">
                <asp:TextBox ID="txtEmail" runat="server" CssClass="input-text-sm" placeholder="Nhập Email..." />
                <span id="emailError" class="error-message" style="color: red; display: none;">Vui lòng nhập Email</span>
            </div>
            <div class="form_body-sm">
                <asp:TextBox ID="txtMatKhau" runat="server" CssClass="input-text-sm" placeholder="Nhập mật khẩu..." TextMode="Password" />
                <span id="matKhauError" class="error-message" style="color: red; display: none;">Vui lòng nhập Mật khẩu</span>
            </div>
            <div class="form_body-sm">
                <asp:TextBox ID="txtDiaChi" runat="server" CssClass="input-text-sm" placeholder="Nhập địa chỉ..." />
                <span id="diaChiError" class="error-message" style="color: red; display: none;">Vui lòng nhập Địa chỉ</span>
            </div>
           

             <!--------------------------------------------------------------------------------------------------->
            <div class="form_body-btns">
                <asp:Button runat="server" ID="btnDangKy" CssClass="link-btns" OnClick="btnDangKy_Click" Text="TẠO TÀI KHOẢN" />
            </div>
            <div class="body_logins-now">
                <p class="titles-now" style="margin-top: 1rem;">Bạn đã có tài khoản: <a href="DangNhap.aspx" class="link_now" style="color: red; font-size: 14px; font-weight: 600;">Đăng nhập ngay</a></p>
            </div>
        </div>
    </div>
</div>



<!-- modal thông báo đăng ký thành công -->
<div id="successModal" class="modal_register">
    <div class="modal-content_register slide-in-top">
        <span class="close_register">&times;</span>
        <div class="bg-check_res">
            <div class="md-res-sm">
                <img src="img/check.png" width="100" height="100" />
            </div>
            <div class="md-res-sm">
                <h4 style="text-transform: uppercase;">Thông báo</h4>
                <p style="margin-top: 1rem;">Bạn đã đăng ký thành công!</p>
            <a href="DangNhap.aspx" style="color: #fff;" class="loginButton_register">Đăng nhập ngay</a>
            </div>
        </div>
    </div>
</div>
<!-------------------------------------------------------------------------------------------------------->

<style>
    .error-message {
        margin-top:.23rem;
    }
</style>
<!---     JS xử lí các sự kiện báo lỗi khi nhập thông tin và nhấn Enter --------------------------------------- -->
<script>
    document.getElementById('<%= btnDangKy.ClientID %>').addEventListener('click', function (event) {
        validateForm(event);
    });

    document.getElementById('<%= txtHoTen.ClientID %>').addEventListener('keypress', function (event) {
        if (event.key === 'Enter') {
            validateForm(event);
        }
    });

    document.getElementById('<%= txtDienThoai.ClientID %>').addEventListener('keypress', function (event) {
        if (event.key === 'Enter') {
            validateForm(event);
        }
    });

    document.getElementById('<%= txtEmail.ClientID %>').addEventListener('keypress', function (event) {
        if (event.key === 'Enter') {
            validateForm(event);
        }
    });

    document.getElementById('<%= txtMatKhau.ClientID %>').addEventListener('keypress', function (event) {
        if (event.key === 'Enter') {
            validateForm(event);
        }
    });

    document.getElementById('<%= txtDiaChi.ClientID %>').addEventListener('keypress', function (event) {
        if (event.key === 'Enter') {
            validateForm(event);
        }
    });

    function validateForm(event) {
        var isValid = true;

        var hoTen = document.getElementById('<%= txtHoTen.ClientID %>').value;
        var dienThoai = document.getElementById('<%= txtDienThoai.ClientID %>').value;
        var email = document.getElementById('<%= txtEmail.ClientID %>').value;
        var matKhau = document.getElementById('<%= txtMatKhau.ClientID %>').value;
        var diaChi = document.getElementById('<%= txtDiaChi.ClientID %>').value;

        var hoTenError = document.getElementById('hoTenError');
        var dienThoaiError = document.getElementById('dienThoaiError');
        var emailError = document.getElementById('emailError');
        var matKhauError = document.getElementById('matKhauError');
        var diaChiError = document.getElementById('diaChiError');

        if (!hoTen) {
            hoTenError.style.display = 'block';
            isValid = false;
        } else {
            hoTenError.style.display = 'none';
        }

        if (!dienThoai) {
            dienThoaiError.style.display = 'block';
            isValid = false;
        } else {
            dienThoaiError.style.display = 'none';
        }

        if (!email) {
            emailError.style.display = 'block';
            isValid = false;
        } else {
            emailError.style.display = 'none';
        }

        if (!matKhau) {
            matKhauError.style.display = 'block';
            isValid = false;
        } else {
            matKhauError.style.display = 'none';
        }

        if (!diaChi) {
            diaChiError.style.display = 'block';
            isValid = false;
        } else {
            diaChiError.style.display = 'none';
        }

        if (!isValid) {
            event.preventDefault();
        }
    }

    // hiện thông báo modal khi đăng ký thành công -----------------------------------------------------
    document.getElementsByClassName('loginButton_register')[0].onclick = function () {
        location.href = 'DangNhap.aspx';
    };

    document.getElementsByClassName('close_register')[0].onclick = function () {
        document.getElementById('successModal').style.display = 'none';
    };

    function showSuccessModal() {
        document.getElementById('successModal').style.display = 'block';
    }
</script>

 