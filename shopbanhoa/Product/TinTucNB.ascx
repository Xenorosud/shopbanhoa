<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TinTucNB.ascx.cs" Inherits="shopbanhoa.Product.TinTucNB" %>



 <% for (int i = 0; i < listTinTuc.Count; i++) { %>
                <div class="bg_home-tintuc">
                  
                    <a  href="ChitietTinTuc.aspx?MaTT=<%= listTinTuc[i].MaTT %>"  class="cards-new" style="color:#333;font-weight:550;">
                        <img src="<%= ResolveUrl(listTinTuc[i].HinhAnh) %>" alt="<%= listTinTuc[i].TieuDe %>" />
                    </a>
                   
                    <h4 class="titles-newp" style="color:#333;"><a href="ChitietTinTuc.aspx?MaTT=<%= listTinTuc[i].MaTT %>"><%= listTinTuc[i].TieuDe %></a></h4>
                </div>
            <% } %>