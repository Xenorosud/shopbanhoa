<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DanhGiaNguoiMua.ascx.cs" Inherits="shopbanhoa.Admin.UserAdmin.DanhGiaNguoiMua" %>

<asp:ScriptManager ID="ScriptManager1" runat="server" />

<div class="titles-add_pr">
    <p class="titles-sm_pra">Quản lý đánh giá</p>
</div>
  <!---------------------------------------------------------------->
<div class="container__DanhGia">
    <div class="bg_danhgia-all">
        <p class="bg-titles-creat">Bảng danh sách đánh giá</p>
        <div class="bg_list-tintuc">
            <div class="bg-list_all">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="GridViewDanhGia" runat="server" AutoGenerateColumns="False" DataKeyNames="ReviewId" OnRowDeleting="GridViewDanhGia_RowDeleting" CssClass="table-tintuc">
    <Columns>
        <asp:BoundField DataField="ReviewId" HeaderText="ID" ReadOnly="True" />
        <asp:BoundField DataField="NgayDanhGia" HeaderText="Ngày Đánh Giá" />
        <asp:BoundField DataField="UserName" HeaderText="Tên Người Đánh Giá" />
        <asp:BoundField DataField="Email" HeaderText="Email" />
        <asp:BoundField DataField="Comment" HeaderText="Nội Dung Đánh Giá" />
        <asp:TemplateField HeaderText="Hành Động">
            <ItemTemplate>
                <asp:ImageButton ID="btnDelete" CssClass="delete_ic" runat ="server" ImageUrl="~/Admin/img/delete.png" CommandName="Delete" CommandArgument='<%# Eval("ReviewId") %>' ToolTip="Xóa" OnClientClick="return confirm('Bạn có chắc chắn muốn xóa đánh giá này không?');" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>

                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="GridViewDanhGia" EventName="RowEditing" />
                        <asp:AsyncPostBackTrigger ControlID="GridViewDanhGia" EventName="RowUpdating" />
                        <asp:AsyncPostBackTrigger ControlID="GridViewDanhGia" EventName="RowCancelingEdit" />
                        <asp:AsyncPostBackTrigger ControlID="GridViewDanhGia" EventName="RowDeleting" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</div>
  <!---------------------------------------------------------------->
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
