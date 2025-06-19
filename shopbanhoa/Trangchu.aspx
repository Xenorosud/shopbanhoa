<%@ Page Title="" Language="C#" MasterPageFile="~/HomeShop.Master" AutoEventWireup="true" CodeBehind="Trangchu.aspx.cs" Inherits="shopbanhoa.Trangchu" %>

<%@ Register Src="~/Product/HQMDNB.ascx" TagPrefix="uc" TagName="HoaQuaMDNB" %>
<%@ Register Src="~/Product/BanChayNB.ascx" TagPrefix="uc" TagName="BanChayNB" %>
<%@ Register Src="~/Product/KhuyenMaiNB.ascx" TagPrefix="uc" TagName="KhuyenMaiNB" %>
<%@ Register Src="~/Product/HQMHNB.ascx" TagPrefix="uc" TagName="HoaQuaMHNB" %>
<%@ Register Src="~/Product/HQNKNB.ascx" TagPrefix="uc" TagName="HoaQuaNKNB" %>
<%@ Register Src="~/Product/TinTucNB.ascx" TagPrefix="uc" TagName="TinTucNB" %>





<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css">


     <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
        <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  
     <link href="css/Animation1.css" rel="stylesheet" />
    <link href="css/Style.css" rel="stylesheet" />
    <script src="js/JavaScript1.js"></script>

        <meta charset="UTF-8" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  

  



     <div class="body-bg-all">
             
            <div class="body_parts">

                    <div class="part_ones">
                            <button class="btn-parts"><a href="PAGEHCNK.aspx" class="link-part">Hoa quả nhập khẩu</a></button>
                         <button class="btn-parts"><a href="PAGEHQMD.aspx" class="link-part">Hoa quả mùa đông</a></button>
                         <button class="btn-parts"><a href="PAGEHQMH.aspx" class="link-part">Hoa quả mùa hè</a></button>
                    </div>
            </div>

             <div class="body_parts">
                   
                 <div class="slider">


                     <!---->
                     
<% for (int i = 0; i < SliderImages.Count; i++)
{ %>
     <div class="slide">
        
           <img src="<%= ResolveUrl(SliderImages[i].AnhSlider) %>" alt="<%= SliderImages[i].MaSlider %>" class="img-parts"/>
</div>
       
<% } %>
                     <!---->
 <button class="prev">&#10094;</button>
    <button class="next">&#10095;</button>

                   
</div>

             </div>

        </div>

   
   
      <!--==============   modal ================-->   
   
      <div id="loginSuccessModal" class="modal_sale-sm">
  <div class="modal-content_same slide-in-top">
    <span class="close_sale">&times;</span>
    <p id="loginSuccessMessage"></p>
  </div>
</div>



    <!-- Modal -->
<div id="myModal" class="modal">
  <div class="modal-content">
    <span class="close">&times;</span>
    <p id="successMessage"></p>
  </div>
</div>

          <!--==============================-->   
   




            <div class="body-all_sales">
                
                <div class="all-twos">
                     <h4 class="titles-sale">CÁC LOẠI HOA QUẢ NỔI BẬT</h4>

 <button class="btn-page-alls"><a href="TatCaHoa.aspx" class="link-page-all">XEM TẤT CẢ</a></button>
                </div>

                <div class="body-stanđout">

                      <div class="part-std">
                         <a href="PAGEHCNK.aspx">  <img src="img/thongtinTC.png" class="img-std" /></a>
                          <p class="title-sales">HOA QUẢ NHẬP KHẨU</p>
                      </div>

                     <div class="part-std">
      <a href="PAGEHQMD.aspx">  <img src="img/traicaymuadong.jpg" class="img-std" /></a>
                          <p class="title-sales">HOA QUẢ MÙA ĐÔNG</p>
 </div>

                                       <div class="part-std">
      <a href="PAGEHQMH.aspx">  <img src="img/traicaymuahe.jpg" class="img-std" /></a>
                                            <p class="title-sales">HOA QUẢ MÙA HÈ</p>
</div>

   

                </div>
            </div>
         <!--==============================-->
     <!-- phân loại giảm giá   -->
   
      <h4 class="body-hoa" style="text-align:center;text-transform:uppercase;background:linear-gradient(0deg, rgba(34,193,195,1) 18%, rgba(252, 186, 3, 1) 84%);color:white;padding:1rem;text-transform:uppercase;">LOẠI HOA QUẢ ĐANG CÓ CHươnG TRình GIẢM GIÁ</h4>
 
    
    <div class="card_body_sliders" style="margin-top:3rem;">
    <div class="additional-slider" data-slick='{"slidesToShow": 4, "slidesToScroll": 1}'>
              
    <uc:KhuyenMaiNB runat="server" ID="KhuyenMaiNB" />
             
        </div>
    
    <button id="prev" class="pres">&#10094;</button>
    <button id="next" class="nexts">&#10095;</button>

</div>



     <div class="btn_bg">
        <button class="btn_more-pr">
            <a href="HoaQuaSale.aspx" class="link_more-pr">Xem thêm</a>
    </button>
   </div>
        <!-- phân loại bán chạy  -->

         <h4 class="body-hoa" style="text-align:center;text-transform:uppercase;background:linear-gradient(0deg, rgba(34,193,195,1) 18%, rgba(252, 186, 3, 1) 84%);color:white;padding:1rem;">LOẠI HOA QUẢ BÁN CHẠY TRONG TUẦN</h4>
   
    
      <div class="card_body_sliders" style="margin-top:3rem;">
     <div class="additional-slider" data-slick='{"slidesToShow": 4, "slidesToScroll": 1}'>
             
    <uc:BanChayNB runat="server" ID="BanChayNB" />




</div>
           <button id="prevs" class="pres" >&#10094;</button>
            <button id="nexts" class="nexts" >&#10095;</button>
</div>

   <div class="btn_bg">
        <button class="btn_more-pr">
            <a href="TatCaHoa.aspx" class="link_more-pr">Xem thêm</a>
    </button>
   </div>
<!--==============================--> 
          <div class="bg-phu">
               <img src="img/egwosfrimnudijkonudfgrzjnkidrfeg.png" class="img-phu" />
          </div>
      <!--==============================-->



<!-- phân loại 1  ==> Hoa quả mùa hè -->

<div class="all-pr">
    <h4 class="body-hoa" style="margin-top:3rem;text-transform:uppercase;font-size:1.5rem;color:grey;">Các loại hoa quả mùa hè</h4>
    <a href="PAGEHQMH.aspx" class="all-links-pr" style="margin-top:3rem;">XEM TẤT CẢ <i class="fa-solid fa-chevron-right"></i></a>
</div>


      <div class="card_body_sliders" style="margin-top:3rem;">
  <div class="additional-slider" data-slick='{"slidesToShow": 4, "slidesToScroll": 1}'>
        <!-- 1 card -->
    <uc:HoaQuaMHNB runat="server" id="HoaLyNB" />


</div>
          <button  class="pres" >&#10094;</button>
            <button  class="nexts" >&#10095;</button>
          </div>
       <!--==============================-->


<!-- phân loại 2  ==> Hoa quả nhập khẩu -->
<div class="all-pr">
    <h4 class="body-hoa" style="margin-top:3rem;text-transform:uppercase;font-size:1.5rem;color:grey;">Các loại hoa quả nhập khẩu</h4>
    <a href="PAGEHCNK.aspx" class="all-links-pr" style="margin-top:3rem;">XEM TẤT CẢ <i class="fa-solid fa-chevron-right"></i></a>
</div>


      <div class="card_body_sliders" style="margin-top:3rem;">
  <div class="additional-slider" data-slick='{"slidesToShow": 4, "slidesToScroll": 1}'>



        <!-- 1 card -->
    <uc:HoaQuaNKNB runat="server" id="HoaHongNB" />




    </div>
           <button  class="pres" >&#10094;</button>
            <button  class="nexts" >&#10095;</button>
</div>
<!--==============================-->
        <!-- phân loại 3  ==> Hoa quả mùa đông -->
<div class="all-pr">
    <h4 class="body-hoa" style="margin-top:3rem;text-transform:uppercase;font-size:1.5rem;color:grey;">Các loại hoa quả mùa đông</h4>
    <a href="PAGEHQMD.aspx" class="all-links-pr" style="margin-top:3rem;">XEM TẤT CẢ <i class="fa-solid fa-chevron-right"></i></a>
</div>


       <div class="card_body_sliders" style="margin-top:3rem;">
  <div class="additional-slider" data-slick='{"slidesToShow": 4, "slidesToScroll": 1}'>
        <!-- 1 card -->
                   
    <uc:HoaQuaMDNB runat="server" id="HoaSenNB" />

</div>
     <button  class="pres" >&#10094;</button>
            <button  class="nexts" >&#10095;</button>
    </div>




            <div class="all-pr">
    <h4 class="body-hoa" style="margin-top:4.5rem;text-transform:uppercase;font-size:1.5rem;color:grey;">TIN TỨC CỬA HÀNG</h4>
    <a href="PageTinTuc.aspx" class="all-links-pr" style="margin-top:3rem;">XEM TẤT CẢ <i class="fa-solid fa-chevron-right"></i></a>
</div>
            <div class="body-newspaper">
                 
            
               
                <uc:TinTucNB runat="server" ID="TinTucNB" />
                
               

   

            </div>

    <!-- JS nhận thông báo khi người dùng đăng nhập vào   -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
    <script>
        var modal = document.getElementById("myModal");
        var span = document.getElementsByClassName("close")[0];

        window.onload = function () {
      <% if(Session["SuccessMessage"] != null) { %>
            modal.style.display = "block";
            document.getElementById("successMessage").innerHTML = "<%= Session["SuccessMessage"] %>";
      <% } %>
        }

        span.onclick = function () {
            modal.style.display = "none";
        }

        window.onclick = function (event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }



        //=================================

        window.onload = function () {
            // Kiểm tra xem có thông báo từ URL không
            var urlParams = new URLSearchParams(window.location.search);
            var loginSuccess = urlParams.get('loginSuccess');
            var voucher = urlParams.get('voucher');
            var discountCode = urlParams.get('discountCode');

            if (loginSuccess === 'true') {
                var modalsale = document.getElementById('loginSuccessModal');
                var messagesale = document.getElementById('loginSuccessMessage');
                messagesale.innerHTML = "Chúc mừng bạn đã đăng nhập thành công và nhận voucher " + voucher + "%. <span class='discount-code'>Mã giảm giá của bạn là: " + discountCode + "</span>";
                modalsale.style.display = "block";

                // Khi người dùng nhấp vào nút đóng modal==============
                var span = document.getElementsByClassName("close_sale")[0];
                span.onclick = function () {
                    modalsale.style.display = "none";
                }

                // Khi người dùng nhấp bất kỳ đâu bên ngoài modal, nó sẽ đóng===================
                window.onclick = function (event) {
                    if (event.target == modalsale) {
                        modalsale.style.display = "none";
                    }
                }
            }
        }




        //================================
</script>





    <style>
.modal {
  display: none; 
  position: fixed; 
  z-index: 1000; 
  right: 0;
  top: 0;
  width: 380px;
  height: 100%; 
  overflow: hidden;
    transition: transform 0.5s ease-out;

}


.modal-content {
  background-color: #FF5A5F;
  margin-top: 23%; 
  margin-right: -380px; 
  padding: 20px;
  width: 80%; 
  animation: slideFromRight 0.5s cubic-bezier(0.23, 1, 0.32, 1) forwards; 

}

@keyframes slideFromRight {
  from { margin-right: -300px; } 
  to { margin-right: 0; } 
}


.close {
  color: #fff;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}

#successMessage{
  color: #fff; 
  text-align: center; 
  letter-spacing:1px;
}


.slider {
    width: 100%;
    overflow: hidden;
    position: relative;
}

.slide {
    width: 100%;
    display: none;
    transition: opacity 0.5s ease-in-out;
}

.slide.active {
    display: block;
}

.slide img {
    width: 100%;
}

/* Nút điều hướng */
.prev,
.next {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    background-color: rgba(0, 0, 0, 0.5);
    color: white;
    font-size: 20px;
    border: none;
    cursor: pointer;
    padding: 10px;
    z-index: 100;
}

.prev {
    left: 0;
}

.next {
    right: 0;
}


.prev:hover,
.next:hover {
    background-color: rgba(0, 0, 0, 0.8);
}

 .modal_run {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100vh;
            background: rgba(0, 0, 0, 0.5);
            display: flex;
            justify-content: center;
            align-items: center;
            opacity: 0;
            visibility: hidden;
            pointer-events: none;
            z-index: 9999;
            animation: popup 1s ease-in-out 5s forwards;
        }

        @keyframes popup {
            0% {
                opacity: 0;
                visibility: hidden;
                pointer-events: none;
            }

            100% {
                opacity: 1;
                visibility: visible;
                pointer-events: all;
            }
        }

        .modal_run.closed {
            display: none;
        }

        .modal-close-overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 9999;
        }

        .newsletter-img {
            display: none;
        }

        .modal-content_run {
            position: relative;
            max-width: 600px;
            margin: 20px;
            background: #ffffff;
            border-radius: 8px;
            overflow: hidden;
            z-index: 9999;
            animation: scaleUp 0.5s ease-in-out 5s forwards;
        }

        @keyframes scaleUp {
            0% {
                transform: scale(0.9);
            }

            100% {
                transform: scale(1);
            }
        }

        .modal-close-btn {
            position: absolute;
            top: 15px;
            right: 15px;
            background: black;
            border: none;
            color: #fff;
            font-size: 16px;
            padding: 2px 4px;
            border-radius: 4px;
            cursor: pointer;
            transition: opacity all 0.3s ease-in-out;
        }

      

        .modal-close-btn ion-icon {
            --ionicon-stroke-width: 70px;
        }

        .newsletter {
            padding: 50px 30px;
            text-align: center;
        }

        .newsletter-header {
            margin-bottom: 20px;
        }

        .newsletter-title {
            color: #3C3744;
            font-size: 24px;
            font-weight: 600;
            margin-bottom: 10px;
            text-transform:uppercase;
        }

        .newsletter-desc {
            color: #757575;
            font-size:14px ;
            line-height: 1.6;
        }

        .email-field {
            font-size: 14px;
            padding: 8px 16px;
            border-radius: 4px;
            border: 1px solid #f5f5f5;
            margin-bottom: 16px;
            width: 100%;
            box-sizing: border-box;
        }

        .btn-newsletter {
            background: #1C1C1C;
            color: #fff;
            font-size: 14px;
            font-weight: 600;
            text-transform: uppercase;
            padding: 10px 15px;
            border-radius: 4px;
            margin: auto;
            transition: all 0.3s ease-in-out;
            cursor: pointer;
            border: none;
        }

        .btn-newsletter:hover {
           background-color: transparent;
           color: black;
           border: 1px solid black;
        }
</style>
   

   

</asp:Content>



