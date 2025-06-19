<%@ Page Title="" Language="C#" MasterPageFile="~/HomeShop.Master" AutoEventWireup="true" CodeBehind="PageTinTuc.aspx.cs" Inherits="shopbanhoa.PageTinTuc" %>



<%@ Register Src="~/Product/GoiYSP.ascx" TagPrefix="uc1" TagName="GoiYSP" %>
<%@ Register Src="~/Product/TinTucShop.ascx" TagPrefix="uc1" TagName="TinTucShop" %>









<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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




    <div class="all-bg_news">

       <div class="new-part_page">

           <div class="hot_page">
               <p class="title-sm-pages">
                   Hỗ trợ trực tuyến
               </p>
               <p class="title-sm_or">Hotline : 0123456789</p>
           </div>

            
            
            <!-- ====================== hoa khuyến mãi ================================== -->
              <div class="body_stand">
               
                  <div class="bg_noibat">
                       <p class="titles-st">Mẫu hoa quả khuyến mãi</p>
                  </div>
                   

                  <uc1:GoiYSP runat="server" ID="GoiYSP" />
                 

            </div>

             <!-- ======================================================== -->

       </div>



         <div class="new-part_page">

             <div class="bg-new_home">
                 <a href="Trangchu.aspx" class="link_home">Trang chủ</a>
                 <span>/</span>
                 <p class="title_home">Tin Tức</p>
             </div>


             
             <uc1:TinTucShop runat="server" id="TinTucShop" />



       </div>

         <div class="new-part_page">

             <p class="dm_or">Danh mục mẫu hoa quả</p>

              <div class="body_parts" style="margin-top:1rem;">

                    <div class="part_ones">
                            <button class="btn-parts"><a href="PageHCNK.aspx" class="link-part">Hoa quả nhập khẩu</a></button>
                         <button class="btn-parts"><a href="PageHQMD.aspx" class="link-part">Hoa quả mùa đông</a></button>
                         <button class="btn-parts"><a href="PageHQMH.aspx" class="link-part">Hoa quả mùa hè</a></button>

                    </div>
            </div>
       </div>




    </div>







</asp:Content>
