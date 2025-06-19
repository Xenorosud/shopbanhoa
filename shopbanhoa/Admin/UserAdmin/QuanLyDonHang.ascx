<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QuanLyDonHang.ascx.cs" Inherits="shopbanhoa.Admin.UserAdmin.QuanLyDonHang" %>

<asp:ScriptManager ID="ScriptManager1" runat="server" />

<div class="titles-add_pr">
    <p class="titles-sm_pra">Quản lý đơn hàng</p>
</div>

<div class="container__DonHang">
    <div class="bg_donhang-all">
      
        <p class="bg-titles-creat">Bảng danh sách đơn hàng người mua</p>
        <div class="bg_list-tintuc">
            <div class="bg-list_all">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                       <asp:GridView ID="GridViewDonHang" runat="server" AutoGenerateColumns="False" DataKeyNames="idDatHang" OnRowDeleting="GridViewDonHang_RowDeleting" CssClass="table-tintuc">
    <Columns>
        <asp:BoundField DataField="idDatHang" HeaderText="ID" ReadOnly="True" />
        <asp:BoundField DataField="NgayDat" HeaderText="Ngày Đặt" />
        <asp:TemplateField HeaderText="Thanh Toán">
            <ItemTemplate>
                <%# 
                    (Eval("PhuongThucThanhToan").ToString() == "1") ? "Thanh toán khi nhận hàng" : 
                    (Eval("PhuongThucThanhToan").ToString() == "2") ? "Chuyển khoản ngân hàng" : "Không xác định"
                %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="TenSP" HeaderText="Tên SP" />
        <asp:BoundField DataField="SoLuong" HeaderText="Số Lượng" />      
        <asp:BoundField DataField="ThanhTien" HeaderText="Thành Tiền" DataFormatString="{0:#,##0} VNĐ" />
        <asp:BoundField DataField="HoTen" HeaderText="Họ Tên" />
        <asp:BoundField DataField="Dienthoai" HeaderText="Điện Thoại" />
        <asp:BoundField DataField="Email" HeaderText="Email" />
        <asp:BoundField DataField="Diachi" HeaderText="Địa Chỉ" />
        <asp:TemplateField HeaderText="Hành Động">
            <ItemTemplate>
                <asp:ImageButton ID="btnDelete" CssClass="delete_ic" runat ="server" ImageUrl="~/Admin/img/delete.png" CommandName="Delete" CommandArgument='<%# Eval("idDatHang") %>' ToolTip="Xóa" OnClientClick="return confirm('Bạn có chắc chắn muốn xóa đơn hàng này không?');" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>

                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="GridViewDonHang" EventName="RowDeleting" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</div>

<style>
    table th, td {
        font-size: 13px;
    }
     .delete_ic {
    width: 30px; 
    height: auto; 
    background-color:orange;
    border-radius:50%;
}

</style>

