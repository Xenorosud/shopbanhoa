<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LoaiHoaQua.ascx.cs" Inherits="shopbanhoa.Admin.UserAdmin.LoaiHoa" %>
<asp:ScriptManager ID="ScriptManager1" runat="server" />

<div class="titles-add_pr">
    <p class="titles-sm_pra">Quản lý loại hoa quả - Thêm loại hoa quả</p>
</div>

<div class="container__Loaihoa">
    <div class="creat_loaihoa">
        <div id="errorMessage" class="error-message fade-in" style="display:none;margin-top:1rem;background-color:red;color:#fff;padding:10px;text-align:center;"></div>
        <div id="successMessage" class="alert alert-success fade-in" style="display:none;margin-top:1rem;background-color:green;color:#fff;padding:10px;text-align:center;">Thêm loại sản phẩm thành công!</div>

        <p class="bg-titles-creat" style="margin-top:1rem;">Tạo mới loại hoa quả</p>

        <div class="add_part-pr">
            <label class="label_names">Nhập tên loại hoa quả</label>
            <asp:TextBox ID="txtTenLoai" runat="server" CssClass="input-creat" placeholder="Nhập tên loại hoa quả..."></asp:TextBox>
        </div>

        <div class="add_part-pr">
            <asp:Button ID="btnThemLoaiHoa" runat="server" Text="Thêm loại hoa quả" OnClick="btnThemLoaiHoa_Click" CssClass="btn-creat" />
        </div>
    </div>

    <div class="bg_loaihoa-all">
        <p class="bg-titles-creat">Bảng loại hoa quả</p>
        <div class="bg_list-loaihoa">
            <div class="bg-list_all">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="GridViewLoaiHoa" runat="server" AutoGenerateColumns="False" DataKeyNames="MaLoai" OnRowEditing="GridViewLoaiHoa_RowEditing" OnRowUpdating="GridViewLoaiHoa_RowUpdating" OnRowCancelingEdit="GridViewLoaiHoa_RowCancelingEdit" OnRowDeleting="GridViewLoaiHoa_RowDeleting" CssClass="table-loaihoa">
                            <Columns>
                                <asp:BoundField DataField="MaLoai" HeaderText="Mã Loại" ReadOnly="True" />
                                <asp:TemplateField HeaderText="Tên Loại">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTenLoai" runat="server" Text='<%# Eval("TenLoai") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtTenLoai" runat="server" Text='<%# Bind("TenLoai") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="GridViewLoaiHoa" EventName="RowEditing" />
                        <asp:AsyncPostBackTrigger ControlID="GridViewLoaiHoa" EventName="RowUpdating" />
                        <asp:AsyncPostBackTrigger ControlID="GridViewLoaiHoa" EventName="RowCancelingEdit" />
                        <asp:AsyncPostBackTrigger ControlID="GridViewLoaiHoa" EventName="RowDeleting" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</div>
