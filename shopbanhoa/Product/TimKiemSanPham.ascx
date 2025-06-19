<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TimKiemSanPham.ascx.cs" Inherits="shopbanhoa.Product.TimKiemSanPham" %>
<%@ Register Src="~/Product/GoiYSP.ascx" TagPrefix="uc1" TagName="GoiYSP" %>
 <div class="body_searchs">
        <div class="titles-serachs">
            <h2 class="sm-kq">Kết quả tìm kiếm cho từ khóa :  <%: Request.QueryString["keyword"] %></h2>           
        </div>
        <div class="sort-prs">
            <p class="titles-sort">SẮP XẾP THEO : </p>
            <select id="ddlSapXep" class="sort-ddlSortOptions">
                <option value="ASC">Giá tăng dần</option>
                <option value="DESC">Giá giảm dần</option>
            </select>
        </div>
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
        <div class="card_bodys-se">
 <% if (listSP.Count > 0) { %>
               <div class="bg-found-products">
                    <p class="found-products">Đã tìm thấy <%= listSP.Count %> sản phẩm</p>
               </div>
              
                <div class="card_bodyss">
                    <% for (int i = 0; i < listSP.Count; i++) { %>
                        <div class="product-item">
                            <div class="img-body">
                                <a class="text-sm block line-clamp-2" href='<%="ChiTietSP.aspx?MaSP="+listSP[i].MaSP.ToString()%>'>
                                    <img src="<%= ResolveUrl(listSP[i].AnhSP) %>" alt="<%= listSP[i].TenSP %>" />
                                </a>
                            </div>
                            <% if (listSP[i].GiamGia > 0) { %>
                                <span class="title-sales-sm"> <%= string.Format("{0:N0}", listSP[i].GiamGia) %>%</span>
                            <% } %>
                           <a class="text-sm block line-clamp-2" href='<%="ChiTietSP.aspx?MaSP="+listSP[i].MaSP.ToString()%>'>
                                <span> <%= listSP[i].TenSP %></span>
                            </a>
                            <% if (listSP[i].GiamGia > 0) { %>
                                <p style="text-align:center;margin-top:15px;color:grey;">Giá: <del><%= string.Format("{0:N0} đ", listSP[i].GiaBan) %></del></p>
                                <% var giaSauGiam = listSP[i].GiaBan - (listSP[i].GiaBan * listSP[i].GiamGia / 100); %>
                                <p class="prices-prducts">Giá giảm: <%= string.Format("{0:N0} đ", giaSauGiam) %></p>
                            <% } else { %>
                                <p class="prices-prducts" style="color:red;">Giá: <%= string.Format("{0:N0} đ", listSP[i].GiaBan) %></p>
                            <% } %>
                        </div>
                    <% } %>
                </div>
            <% } else { %>
                <!-- Hiển thị thông báo khi không có kết quả -->
                <p>Sản phẩm bạn tìm kiếm hiện không có</p>
            <% } %>

            </div>
    </div>