<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TinTucShop.ascx.cs" Inherits="shopbanhoa.Product.TinTucShop" %>



            <% for (int i = 0; i < listTinTuc.Count; i++) { %>
                <div class="bg_newpages-part" style="border-bottom:1px solid #dddddd;">
                  
                    <a  href="ChitietTinTuc.aspx?MaTT=<%= listTinTuc[i].MaTT %>"  class="cards-new" style="color:#333;font-weight:550;">
                        <img src="<%= ResolveUrl(listTinTuc[i].HinhAnh) %>" alt="<%= listTinTuc[i].TieuDe %>" />
                    </a>
                   <div class="bg_details-new" style="display:flex;flex-direction:column;">
                    <h4 class="titles-newpage"><a href="ChitietTinTuc.aspx?MaTT=<%= listTinTuc[i].MaTT %>"><%= listTinTuc[i].TieuDe %></a></h4>
                    <p style="margin-top:2rem;border:1px solid #333;padding:12px;border-radius:25px;text-align:center;"> <a href="ChitietTinTuc.aspx?MaTT=<%= listTinTuc[i].MaTT %>">Xem chi tiết</a><i class="fa-solid fa-chevron-right"></i></p>
                       </div>
                </div>
            <% } %>
       