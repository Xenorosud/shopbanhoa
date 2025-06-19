<%@ Page Title="" Language="C#" MasterPageFile="~/HomeShop.Master" AutoEventWireup="true" CodeBehind="HoaQuaSale.aspx.cs" Inherits="shopbanhoa.HoaSale" %>

<%@ Register Src="~/Product/HoaQuaKhuyenMai.ascx" TagPrefix="uc1" TagName="HoaQuaKhuyenMai" %>

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
            
    <div class="bg_hoa-sale">
        <img src="img/1-6.png" class="img_sale-hoa"/> 
    </div>
            

     <marquee class="bg_run-text">      
         <p class="run_text">Fruits De Haute Qualité đang có chương trình đăng ký tài khoản nhận mã voucher giảm 10% tổng tiền thanh toán !<i class="fa-solid fa-gift"></i> <i class="fa-solid fa-gift"></i> <i class="fa-solid fa-gift"></i>    <span class="run_text" style="margin-left:2rem;">Fruits De Haute Qualité đang có chương trình đăng ký tài khoản nhận mã voucher giảm 10% tổng tiền thanh toán ! </span> <i class="fa-solid fa-gift"></i> <i class="fa-solid fa-gift"></i> <i class="fa-solid fa-gift"></i></p>         
     </marquee>
     








    <div class="sort-prs">
        <p class="titles-sort">SẮP XẾP THEO : </p>
 <select id="ddlSapXep" class="sort-ddlSortOptions">
            <option value="ASC">Giá tăng dần</option>
            <option value="DESC">Giá giảm dần</option>
        </select>
     </div>








 <div class="all-body-prs" style="margin-top:2rem;">

            
           
        <div class="body_parts">

         <div class="part_ones">
                 <button class="btn-parts"><a href="PAGEHCNK.aspx" class="link-part">Hoa quả nhập khẩu</a></button>
              <button class="btn-parts"><a href="PAGEHQMD.aspx" class="link-part">Hoa quả mùa đông</a></button>
             <button class="btn-parts"><a href="PAGEHQMH.aspx" class="link-part">Hoa quả mùa hè</a></button>
         </div>

           

 </div>


  <div class="body_parts">


    

    <uc1:HoaQuaKhuyenMai runat="server" id="HoaQuaKhuyenMai" />

    
        </div>
     </div>
</asp:Content>
