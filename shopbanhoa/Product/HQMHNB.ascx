<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HQMHNB.ascx.cs" Inherits="shopbanhoa.Product.HoaLyNB" %>



 <% for (int i = 0; i < listSP.Count; i++) { %>

    <div class="product-item_sliders">
        <div class="img-body_sliders">
            <a class="text-sm block line-clamp-2" href='<%="ChiTietSP.aspx?MaSP="+listSP[i].MaSP.ToString()%>'>
                <img src="<%= ResolveUrl(listSP[i].AnhSP) %>" alt="<%= listSP[i].TenSP %>" />
            </a>
        </div>
        <% if (listSP[i].GiamGia > 0) { %>
            <span class="title-sales-sm"> <%= string.Format("{0:N0}", listSP[i].GiamGia) %>%</span>
        <% } %>
        <a class="text-sm block line-clamp-2" href='<%="ChiTietSP.aspx?MaSP="+listSP[i].MaSP.ToString()%>'>
            <span class="Product_title-sm"> <%= listSP[i].TenSP %></span>
        </a>
        <% if (listSP[i].GiamGia > 0) { %>
            <p style="text-align:center;margin-top:15px;color:grey;">Giá: <del><%= string.Format("{0:N0} đ", listSP[i].GiaBan) %></del></p>
            <% var giaSauGiam = listSP[i].GiaBan - (listSP[i].GiaBan * listSP[i].GiamGia / 100); %>
            <p class="prices-prducts_sliders">Giá giảm: <%= string.Format("{0:N0} đ", giaSauGiam) %></p>
        <% } else { %>
            <p class="prices-prducts_sliders" style="color:red;">Giá: <%= string.Format("{0:N0} đ", listSP[i].GiaBan) %></p>
        <% } %>
    </div>

<% } %>
