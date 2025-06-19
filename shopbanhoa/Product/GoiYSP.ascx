<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GoiYSP.ascx.cs" Inherits="shopbanhoa.Product.GoiYSP" %>


 <% for (int i = 0; i < listSP.Count; i++) { %>

    <div class="product-item-st">
         <a class="menu-item-link" href="#" onclick="redirectToDetail('<%= listSP[i].MaSP %>');">
         <div class="img-body-st">
             <a class="text-sm block line-clamp-2" href='<%="ChiTietSP.aspx?MaSP="+listSP[i].MaSP.ToString()%>'>
                <img src="<%= ResolveUrl(listSP[i].AnhSP) %>" alt="<%= listSP[i].TenSP %>" />
            </a>
        </div>

          <div class="info-body-st">
       
         <a class="text-sm block line-clamp-2" href='<%="ChiTietSP.aspx?MaSP="+listSP[i].MaSP.ToString()%>'>
            <span style="font-size:13px;"> <%= listSP[i].TenSP %></span>
        </a>
        <% if (listSP[i].GiamGia > 0) { %>
            <p style="text-align:center;margin-top:15px;color:grey;"> <del><%= string.Format("{0:N0} đ", listSP[i].GiaBan) %></del></p>
            <% var giaSauGiam = listSP[i].GiaBan - (listSP[i].GiaBan * listSP[i].GiamGia / 100); %>
            <p class="prices-prducts"> <%= string.Format("{0:N0} đ", giaSauGiam) %></p>
        <% } else { %>
            <p class="prices-prducts" style="color:red;"> <%= string.Format("{0:N0} đ", listSP[i].GiaBan) %></p>
        <% } %>
              </div>
              </a>
    </div>
    
<% } %>