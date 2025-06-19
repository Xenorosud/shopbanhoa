<%@ Page Title="" Language="C#" MasterPageFile="~/HomeShop.Master" AutoEventWireup="true" CodeBehind="TatCaHoa.aspx.cs" Inherits="shopbanhoa.TatCaHoa" %>

<%@ Register Src="~/Product/TatCaHoaQua.ascx" TagPrefix="uc1" TagName="TatCaHoas" %>
<%@ Register Src="~/Product/GoiYSP.ascx" TagPrefix="uc1" TagName="GoiYSP" %>


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
                 <button class="btn-parts"><a href="PageHCNK.aspx" class="link-part">Hoa quả nhập khẩu</a></button>
              <button class="btn-parts"><a href="PageHQMD.aspx" class="link-part">Hoa quả mùa đông</a></button>
             <button class="btn-parts"><a href="PageHQMH.aspx" class="link-part">Hoa quả mùa hè</a></button>
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




 

         <div class="body_parts">
    <uc1:TatCaHoas runat="server" ID="TatCaHoas" />
             </div>

      
               

                </div>
   
</asp:Content>
