<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SanPhamYeuThich.ascx.cs" Inherits="shopbanhoa.Product.SanPhamYeuThich" %>


 <div class="bg_big-body">
  <div class="bg-all_table">
        <p class="table-title_like">Danh sách yêu thích </p>
      <div style="max-height: 600px; overflow-y: auto;margin-top:1.8rem;">
  <% if (listSP.Count == 0)
    { %>
        <p>Danh sách yêu thích của bạn hiện đang trống.</p>
    <% } else { %>
        <table border="1" class="table_bodys">
            <tr>
                <th>Mã SP</th>
                <th>Ảnh SP</th>
                <th>Tên SP</th>
                <th>Giá bán</th>
                <th>Giảm giá</th>
                <th>Xem mẫu hoa</th>
            </tr>
            <% for (int i = 0; i < listSP.Count; i++)
            { %>
                <tr style="max-height: 600px; overflow-y: auto;margin-top:1.8rem;">
                    <td><%= listSP[i].MaSP %></td>
                    <td><img src="<%= ResolveUrl(listSP[i].AnhSP) %>" alt="<%= listSP[i].AnhSP %>" width="60" height="60"/></td>
                    <td><%= listSP[i].TenSP %></td>
                      <td><%= string.Format("{0:#,##0} VNĐ", listSP[i].GiaBan) %></td>
                       <td><%= string.Format("{0:0.##} %", listSP[i].GiamGia) %></td>
                   
                    <td> 
                        <a  href='<%="ChiTietSP.aspx?MaSP="+listSP[i].MaSP.ToString()%>' style="color:#333;font-size:14px;border-bottom:1px solid #333;padding:3px 0;">Xem Mua Ngay</a>

                    </td>
                </tr>
            <% } %>
        </table>
    <% } %>
          </div>
    </div>


 <div class="bg-all_table">
        <div class="new-part_page" style="margin-top:2rem;">

             <p class="dm_or">Danh mục mẫu hoa quả</p>

              <div class="body_parts" style="margin-top:2.2rem;">

                    <div class="part_ones">
                            <button class="btn-parts"><a href="PageHCNK.aspx" class="link-part">Hoa quả nhập khẩu</a></button>
                         <button class="btn-parts"><a href="PageHQMD.aspx" class="link-part">Hoa quả mùa đông</a></button>
                         <button class="btn-parts"><a href="PageHQMH.aspx" class="link-part">Hoa quả mùa hè</a></button>
                    </div>
            </div>
       </div>
    </div>


</div>
    <style>
         .table_bodys img {
             border-radius:30px;
         }
       .table_bodys th {
           text-align:center;
           background-color:#333;
           color:#fff;
       }
       .table_bodys td {
           text-align:center;
       }
         .bg_big-body {
         display:grid;
         grid-template-columns:9fr 3fr;
         gap:1rem;
         padding:1rem 2rem;
       
     }
          .table-title_like {
            margin:1.4rem 0;
            text-align:center;
            background-color:#1a1c1e;
            padding:13px;
            color:#4fba69;
            text-transform:uppercase;
            font-weight:600;
            letter-spacing:1px;
        }
    </style>
   