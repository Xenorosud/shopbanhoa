<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ThemSanPham.ascx.cs" Inherits="shopbanhoa.Admin.UserAdmin.ThemSanPham" %>

<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
  <!---------------------------------------------------------------->
<div class="bg_add-pr">
    <div class="titles-add_pr">
        <p class="titles-sm_pra">Thêm sản phẩm</p>
    </div>
    <div class="bg-add_all">
        <div class="pr_all-one">
            <div id="errorMessage" class="error-message fade-in" style="display:none;margin-top:1rem;background-color:red;color:#fff;padding:10px;text-align:center;">
                Vui lòng điền đủ thông tin sản phẩm và ảnh!
            </div>
            <div id="successMessage" class="alert alert-success fade-in" style="display:none;margin-top:1rem;background-color:red;color:#fff;padding:10px;text-align:center;">
                Thêm sản phẩm thành công!
            </div>
            <p class="bg-titles-creat" style="margin-top:1rem;">Nhập thông tin sản phẩm</p>
            <div class="add_part-pr">
                <label for="fuAnhSanPham" class="label_add">Ảnh sản phẩm:</label>
                <asp:FileUpload ID="fuAnhSanPham" runat="server" CssClass="Add-pr_product" />
            </div>
            <div class="add_part-pr">
                <label for="txtTenSanPham" class="label_add">Tên sản phẩm:</label>
                <asp:TextBox ID="txtTenSanPham" runat="server" CssClass="add-pr_product" placeholder="Nhập tên sản phẩm..."></asp:TextBox>
            </div>
            <div class="add_part-pr">
                <label for="txtGia" class="label_add">Giá:</label>
                <asp:TextBox ID="txtGia" runat="server" CssClass="add-pr_product" placeholder="Nhập giá..."></asp:TextBox>
            </div>
            <div class="add_part-pr">
                <label for="txtGiamGia" class="label_add">Giảm giá:</label>
                <asp:TextBox ID="txtGiamGia" runat="server" CssClass="add-pr_product" placeholder="Nhập giảm giá..."></asp:TextBox>
            </div>
            <div class="add_part-pr">
                <label for="txtSoLuong" class="label_add">Số lượng:</label>
                <asp:TextBox ID="txtSoLuong" runat="server" CssClass="add-pr_product" placeholder="Nhập số lượng..."></asp:TextBox>
            </div>
            <div class="add_part-pr">
                <label for="txtMoTa" class="label_add">Mô tả:</label>
                <asp:TextBox ID="txtMoTa" runat="server" TextMode="MultiLine" CssClass="add-pr_products" placeholder="Nhập mô tả..."></asp:TextBox>
            </div>
            <div class="add_part-pr">
                <label for="ddlLoaiHoa" class="label_add">Loại hoa quả:</label>
                <asp:DropDownList ID="ddlLoaiHoa" runat="server" CssClass="loai-pr_product"></asp:DropDownList>
            </div>
            <asp:Button ID="btnThemSanPham" runat="server" Text="Thêm sản phẩm" OnClick="btnThemSanPham_Click" CssClass="btn-pr_product" />
       <button id="openSidebar" class="btn-pr_product" style="background-color:#12B76A;">Xem tất cả sản phẩm</button>
             </div>
        <div class="pr_all-one">
            <img src="img/thongtinTC.png" class="img_add" />
        </div>
    </div>
</div>
  <!---------------------------------------------------------------->



<!------------------   code sidebar hiện thông tin sản phẩm trong shop ------------------------->
<div class="sidebar">
    <div class="head">
        <p style="text-transform:uppercase;">danh sách sản phẩm đã thêm vào shop - Fruits De Haute Qualité</p>
        <button id="closeSidebar" style="background-color:red;padding:10px;color:#fff;border-radius:20px;">Đóng</button>
    </div>

  
    <div class="bg_list-tintuc" style="max-height: 520px; overflow-y: auto;">
    <div class="bg-list_all">
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <asp:GridView ID="GridViewSanPham" runat="server" AutoGenerateColumns="False" DataKeyNames="MaSP" OnRowEditing="GridViewSanPham_RowEditing" OnRowUpdating="GridViewSanPham_RowUpdating" OnRowCancelingEdit="GridViewSanPham_RowCancelingEdit" OnRowDeleting="GridViewSanPham_RowDeleting" CssClass="table-tintuc">
                    <Columns>
                        <asp:BoundField DataField="MaSP" HeaderText="Mã SP" ReadOnly="True" ItemStyle-CssClass="gridview-cell" />
                        <asp:TemplateField HeaderText="Tên hoa quả">
                                    <ItemTemplate>
                                        <asp:Label ID="txtTenSP" runat="server" Text='<%# Eval("TenSP") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtTenSP" runat="server" Text='<%# Bind("TenSP") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>

                         <asp:TemplateField HeaderText="Giá">
                                     <ItemTemplate>
                                  <asp:Label ID="lblGiaBan" CssClass="price-pr_admin" runat="server" Text='<%# Eval("GiaBan", "{0:N0} VNĐ") %>'></asp:Label>
                                     </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtGiaBan" runat="server" Text='<%# Bind("GiaBan") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>


                         <asp:TemplateField HeaderText="Số lượng">
                                    <ItemTemplate>
                                        <asp:Label ID="txtSoLuong" runat="server" Text='<%# Eval("SoLuong") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtSoLuong" runat="server" Text='<%# Bind("SoLuong") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>

                         <asp:TemplateField HeaderText="Mô tả">
                                    <ItemTemplate>
                                        <asp:Label ID="txtMoTa" runat="server" Text='<%# Eval("MoTa") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtMoTa" runat="server" Text='<%# Bind("MoTa") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                     
                       
                       

                        <asp:TemplateField HeaderText="Loại hoa quả" HeaderStyle-CssClass="small-header">
                            <ItemTemplate>
                                <%# GetLoaiHoaName(Convert.ToInt32(Eval("MaLoai"))) %>
                            </ItemTemplate>
                        </asp:TemplateField>

                         <asp:TemplateField HeaderText="Giảm giá">
                                    <ItemTemplate>
                                     <asp:Label ID="lblGiamGia" CssClass="sale_pr-admin" runat="server" Text='<%# Eval("GiamGia", "{0:N0} %") %>'></asp:Label>
                                       </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtGiamGia" runat="server" Text='<%# Bind("GiamGia") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                     

                      
                        <asp:BoundField DataField="Giakhuyenmai" HeaderText="Giá khuyến mãi" ItemStyle-CssClass="gridview-cell-price" DataFormatString="{0:N0} VNĐ" />
                        <asp:TemplateField HeaderText="Ảnh sản phẩm" HeaderStyle-CssClass="small-header">
                            <ItemTemplate>
                                <asp:Image ID="imgAnhSP" runat="server" ImageUrl='<%# Eval("AnhSP") %>' CssClass="product-image" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" HeaderText="Thao tác" />
                    </Columns>
                </asp:GridView>

            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="GridViewSanPham" EventName="RowEditing" />
                <asp:AsyncPostBackTrigger ControlID="GridViewSanPham" EventName="RowUpdating" />
                <asp:AsyncPostBackTrigger ControlID="GridViewSanPham" EventName="RowCancelingEdit" />
                <asp:AsyncPostBackTrigger ControlID="GridViewSanPham" EventName="RowDeleting" />
            </Triggers>
        </asp:UpdatePanel>
    </div>
</div>

    
</div>





<!------------------------------------------------------------------------------------------------->



<style>
    .price-pr_admin {
        color:red;
    }
    .sale_pr-admin {
        background-color:red;
        color:#fff;
        padding:6px;
        border-radius:50%;
        font-weight:600;
    }
    .table-tintuc {
        font-size:12px;
    }
    .product-image {
        width:100px;
        height:100px;
    }

   .gridview-cell {
       font-size:12px;
   }
   .gridview-cell-price {
       font-size:12px;
       color:red;
   }
   .small-header {
       font-size:12px;
   }
</style>
<style>
    .product-image {
        width: 60px;
        height: 60px;
    }

    .sidebar {
        position: fixed;
        top: 0;
        right: -980px;
        width: 980px;
        height: 100%;
        background-color: #fff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        transition: right 0.3s ease;
        z-index: 999;
    }

    .sidebar.show {
        right: 0;
    }

    .head {
        background-color: #333;
        color: #fff;
        padding: 1rem;
        text-align: center;
    }

    #closeSidebar {
        background-color: transparent;
        border: none;
        color: #fff;
        cursor: pointer;
        position: absolute;
        top: 10px;
        right: 10px;
    }

    .cartItemList-wrapper {
        padding: 20px;
    }
    .tab-content {
    display: none;
}
.tab-content.active {
    display: block;
}

.link_category a {
    display:flex;
    flex-direction:column;
    color:#333;
}

</style>

<script>
    $(document).ready(function () {
        $('#openSidebar').click(function (event) {
            event.preventDefault(); // ngăn chặn load lại trang ==========
            $('.sidebar').addClass('show');
        });

        $('#closeSidebar').click(function (event) {
            event.preventDefault(); 
            $('.sidebar').removeClass('show');
        });
    });

   


   
</script>


