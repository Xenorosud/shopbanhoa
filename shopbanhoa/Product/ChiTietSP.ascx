<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ChiTietSP.ascx.cs" Inherits="shopbanhoa.Product.ChiTietSP" %>

<%@ Register Src="~/Product/HoaQuaNgauNhien.ascx" TagPrefix="uc1" TagName="HoaQuaNgauNhien" %>
<%@ Register Src="~/Product/GoiYSP.ascx" TagPrefix="uc1" TagName="GoiYSP" %>


<marquee class="bg_run-text">      
         <p class="run_text">Fruits De Haute Qualité đang có chương trình giảm giá các loại hoa quả ngon và tươi!!<i class="fa-solid fa-gift"></i> <i class="fa-solid fa-gift"></i> <i class="fa-solid fa-gift"></i>    <span class="run_text" style="margin-left:2rem;">Fruits De Haute Qualité đang có chương trình giảm giá các loại hoa quả ngon và tươi!!</span> <i class="fa-solid fa-gift"></i> <i class="fa-solid fa-gift"></i> <i class="fa-solid fa-gift"></i></p>         
     </marquee>


 <p class="sm-detalis" style="text-align:center;margin-top:1.5rem;font-size:1.3rem;color:grey;">CHI TIẾT MẪU HOA QUẢ</p>



 <div class="product-details">
    <div class="img-body_details">
        <img src="<%= ResolveUrl(sanPham != null ? sanPham.AnhSP : "") %>" alt="<%= sanPham != null ? sanPham.TenSP : "" %>" />
    </div>
    <div class="info-body_details">
        <div class="product-info">
            <% if (sanPham != null) { %>
                <div class="titles-sm_linkst">
                    <a href="Trangchu.aspx" class="link_a">Trang chủ</a>
                    <span>/</span>
                    <p class="name_prs"> <%= sanPham.TenSP %> </p>
                </div>

                <h2 class="title-products-details"> <%= sanPham.TenSP %> </h2>
                <p class="mota-title-sm">Mã sản phẩm: <%= sanPham.MaSP %> </p>
                <%
                decimal giaBan = sanPham.GiaBan ?? 0;
                decimal giamGia = sanPham.GiamGia ?? 0;
                decimal giaSauGiam = giaBan - (giaBan * giamGia / 100);
                %>
                <% if (giamGia > 0) { %>
                    <p class="prices-prduct-details">Giá: <%= giaBan.ToString("N0") %> đ</p>
                    <div class="bg_discout">
                        <p class="discount-price-sms">Giảm giá: <%= giamGia.ToString("N0") %> %</p>
                        <img src="img/chitietsanpham.png" />
                    </div>
                    <p class="prices-New-details">Giá khuyến mãi: <%= giaSauGiam.ToString("N0") %> đ</p>
                <% } else { %>
                    <p class="prices-prduct-details">Giá: <%= giaBan.ToString("N0") %> đ</p>
                <% } %>
                <div class="label_Amount" style="display:none;">
                    <label for="quantity">Số lượng:</label>
                   <asp:TextBox ID="txtQuantity" runat="server" Text="1" CssClass="input_amount"></asp:TextBox>
                </div>
                <p class="mota-title-sm">Số lượng còn lại: <%= sanPham.SoLuong %></p>
                <p class="mota-title-sm">Mô tả: <%= sanPham.MoTa %></p>
            <% } else { %>
                <p class="error-message">Không tìm thấy sản phẩm.</p>
            <% } %>


            <p class="mo-ta_details"><i class="fa-solid fa-circle-check"></i> Hoa quả tươi là sản phẩm tự nhiên, đặc thù nghệ thuật.</p>
            <p class="mo-ta_details"><i class="fa-solid fa-circle-check"></i> Một số hoa quả tùy thuộc vào môi trường ở nơi hoa quả được trồng.</p>
            <p class="mo-ta_details"><i class="fa-solid fa-circle-check"></i> Màu sắc của hoa quả thực tế có thể thay đổi chút ít so với hình ảnh (Màu sắc hiển thị khác nhau trên từng màn hình thiết bị, góc chụp, ánh sáng)</p>
            <div class="bg_type_fl">
                <p class="title_type">Các loại hoa khác tham khảo</p>
                <div class="all_type-fl">
                    <% for (int i = 0; i < listLoaiHang.Count; i++) { %>
                        <a href="#" class="link_types-fl" onclick="redirectToLoaiHang('<%= listLoaiHang[i].MaLoai %>'); return false;"><%= listLoaiHang[i].TenLoai %></a> 
                    <% } %>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="bg_btn-adds">

   <a href='<%= "ChiTietDatHang.aspx?MaSP=" + (sanPham != null ? sanPham.MaSP.ToString() : "") + "&quantity=" + txtQuantity.Text %>' class="btn_addcart-now" style="text-align:center;">Đặt hàng ngay</a>

      <a href='<%= "YeuThichHoaQua.aspx?MaSP=" + (sanPham != null ? sanPham.MaSP.ToString() : "") + "&quantity=" + txtQuantity.Text %>' class="btn_addcart-nows" style="text-align:center;">Thêm vào yêu thích</a>
    
     
</div>




  <div class="bg_details-bodys">

         <div class="body_stand" style="padding:0 2rem;margin-top:2rem;">
               
                  <div class="bg_noibat">
                       <p class="titles-st">Mẫu hoa quả khuyến mãi</p>
                  </div>
                   

             <uc1:GoiYSP runat="server" ID="GoiYSP" />


            </div>


         <div class="body_stands">
              <div class="info_pay">
        <p class="titles-pays">thông tin thanh toán</p>
        <p class="titles-sm-info"><span>Fruits De Haute Qualité</span>cung cấp cho quý khách nhiều phương thức thanh toán khác nhau để dễ dàng lựa chọn phương thức phù hợp nhất:</p>
        <p class="pay_withs">Đối với khách hàng:</p>
        <p class="titles-sm-info"><span>Chuyển khoản ngân hàng:</span>Quý khách có thể lựa chọn một trong những tài khoản ngân hàng cửa hàng hỗ trợ để thanh toán cho đơn hàng của mình.</p>
        <p class="titles-sm-info"><span>Ví điện tử MoMo – Zalo Pay:</span>Quý khách vui lòng thanh toán đơn hàng thông qua ví 0123456789 – SAVE VI THUAN</p>
        <p class="titles-sm-info"><span>Thu tiền mặt (COD):</span> Quý khách thanh toán đơn hàng của mình trực tiếp cho nhân viên giao hàng khi đơn hàng được giao đến nơi.</p>
    </div>



    <!-- ============================================================================================== -->

<div class="bg_all-option">
    <p class="pr-goiy" style="margin-top:3rem;text-align:center;">Nhập đánh giá của bạn</p>

    <div class="review-section">
        <div class="body_input-rewiu">
            <div class="input_rv">
                <label class="label_rv">Nhập Họ và Tên</label>
                <input type="text" id="txtUserName" class="review-input" placeholder="Nhập tên của bạn..." runat="server" />
                <span id="userNameError" class="error-message" style="color: red; display: none;">Vui lòng nhập Họ và Tên</span>
            </div>
            <div class="input_rv">
                <label class="label_rv">Nhập Email</label>
                <input type="email" id="txtUserEmail" class="review-input" placeholder="Nhập Email của bạn..." runat="server" />
                <span id="userEmailError" class="error-message" style="color: red; display: none;">Vui lòng nhập Email hợp lệ</span>
            </div>
        </div>

        <div class="input_text-rv">
            <label class="label_rv">Nhập Nội Dung Đánh Giá</label>
            <textarea id="txtComment" class="review-textarea" rows="4" cols="50" placeholder="Nhập đánh giá của bạn" runat="server"></textarea>
            <span id="commentError" class="error-message" style="color: red; display: none;">Vui lòng nhập Nội Dung Đánh Giá</span>
        </div>

        <asp:Button runat="server" ID="btnDathang" CssClass="btn-submit-review" OnClick="btnClick" Text="Gửi đánh giá"/>
    </div>
</div>




  


       <!-- ============================================================================================== -->
         </div>



    </div>


   





     <!-- ============================================================================================== -->


    <p class="pr-goiy">THAM KHẢO MẪU HOA QUẢ GỢI Ý</p>
    <div class="card_body" style="padding:3rem 1rem;margin-top:2rem;" >
        <!-- Repeater cho mẫu hoa gợi ý -->
       

        <uc1:HoaQuaNgauNhien runat="server" ID="HoaNgauNhien" />


    </div>
     <!-- ============================================================================================== -->
  
   <script type="text/javascript">


       function UpdateCartItemCount(totalQuantity) {
           document.getElementById('cartItemCount').innerText = totalQuantity;


       }

       function hideModal() {
           document.getElementById('myModal').style.display = 'none';
       }

       function showModal() {
           document.getElementById('myModal').style.display = 'block';

       }


       //=================================================== modal thông báo danh sách yêu thích 

       var modals = document.getElementById("favoriteModal");


       var closeButton = document.getElementsByClassName("close_like")[0];


       function showModal() {
           modals.style.display = "block";
       }


       closeButton.onclick = function () {
           modals.style.display = "none";
       }


       window.onclick = function (event) {
           if (event.target == modals) {
               modals.style.display = "none";
           }
       }
       //

       //=========================================================
</script>
<script>
    document.getElementById('<%= btnDathang.ClientID %>').addEventListener('click', function (event) {
        var isValid = true;

        var userName = document.getElementById('<%= txtUserName.ClientID %>').value;
        var userEmail = document.getElementById('<%= txtUserEmail.ClientID %>').value;
        var comment = document.getElementById('<%= txtComment.ClientID %>').value;

        var userNameError = document.getElementById('userNameError');
        var userEmailError = document.getElementById('userEmailError');
        var commentError = document.getElementById('commentError');

        if (!userName) {
            userNameError.style.display = 'block';
            isValid = false;
        } else {
            userNameError.style.display = 'none';
        }

        if (!userEmail || !validateEmail(userEmail)) {
            userEmailError.style.display = 'block';
            isValid = false;
        } else {
            userEmailError.style.display = 'none';
        }

        if (!comment) {
            commentError.style.display = 'block';
            isValid = false;
        } else {
            commentError.style.display = 'none';
        }

        if (!isValid) {
            event.preventDefault();
        }
    });

    function validateEmail(email) {
        var re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return re.test(email);
    }
</script>

   
    <style>
       .bg_detail-note {
           display:flex;
           gap:1rem;
           align-items:center;

       }
         .bg_detail-note img {
             width:100px;
             height:100px;
         }
        .bg_detail-note  .img_add-like {
             width:60px;
             height:60px;
        }





        /* CSS cho modal */
.modal_like {
  display: none; 
  position: fixed;
  z-index: 1;
  left: 0;
  top: 0;
  width: 100%; 
  height: 100%; 
  overflow: auto; 
  background-color: rgba(0,0,0,0.4); 

}


.modal-content_like {
  background-color: #fefefe; 
  margin: 0 auto;
  padding: 20px;
  border: 1px solid #888;
  width: 50%;
  margin-top:2.3rem;
    border-radius:20px;
}


.close_like {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close_like:hover,
.close_like:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}

    </style>





        <!-- ============================================================================================== -->
<style>
    .bg_type_fl {
        margin-top:1.4rem;
    }
    .title_type {
        color:#333;
        font-weight:550;

    }
    .all_type-fl {
        margin-top:1rem;
        display:flex;
        gap:1rem;
        flex-wrap:wrap;
    }
     .all_type-fl .link_types-fl {
         color:#333;
         padding:5px 5px;
         border:1px solid #333;
         border-radius:20px;
         font-size:15px;
         transition:.4s;
     }
         .all_type-fl .link_types-fl:hover {
           
             background-color:#1BBC9B;
             color:#fff;
             border:none;
         }
</style>

       