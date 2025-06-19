<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ThemTinTucMoi.ascx.cs" Inherits="shopbanhoa.Admin.UserAdmin.ThemTinTucMoi" %>
<asp:ScriptManager ID="ScriptManager1" runat="server" />
  <!---------------------------------------------------------------->
<div class="titles-add_pr">
    <p class="titles-sm_pra">Quản lý tin tức - Thêm tin tức</p>
</div>

<div class="container__TinTuc">
    <div class="creat_tintuc">
        <div id="errorMessage" class="error-message fade-in" style="display:none;margin-top:1rem;background-color:red;color:#fff;padding:10px;text-align:center;"></div>
        <div id="successMessage" class="alert alert-success fade-in" style="display:none;margin-top:1rem;background-color:green;color:#fff;padding:10px;text-align:center;">Thêm tin tức thành công!</div>

        <p class="bg-titles-creat" style="margin-top:1rem;">Tạo mới tin tức</p>

        <div class="add_part-pr">
            <label class="label_names">Ảnh tin tức:</label>
            <asp:FileUpload ID="fuAnhSanPhamtintuc" runat="server" CssClass="input-creat" />
        </div>

        <div class="add_part-pr">
            <label class="label_names">Tiêu đề:</label>
            <asp:TextBox ID="txtTieuDe" runat="server" CssClass="input-creat" placeholder="Nhập tiêu đề tin tức..."></asp:TextBox>
        </div>

        <div class="add_part-pr">
            <label class="label_names">Nội dung:</label>
            <asp:TextBox ID="txtNoiDung" runat="server" CssClass="input-creats" TextMode="MultiLine" placeholder="Nhập nội dung tin tức..."></asp:TextBox>
        </div>

        <div class="add_part-pr">
            <asp:Button ID="btnThemTinTuc" runat="server" Text="Thêm tin tức" OnClick="btnThemTinTuc_Click" CssClass="btn-creat" />
        </div>
    </div>
      <!---------------------------------------------------------------->
    <div class="bg_tintuc-all">
        <p class="bg-titles-creat">Bảng tin tức</p>
        <div class="bg_list-tintuc">
            <div class="bg-list_all">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="GridViewTinTuc" runat="server" AutoGenerateColumns="False" DataKeyNames="MaTT" OnRowEditing="GridViewTinTuc_RowEditing" OnRowUpdating="GridViewTinTuc_RowUpdating" OnRowCancelingEdit="GridViewTinTuc_RowCancelingEdit" OnRowDeleting="GridViewTinTuc_RowDeleting" CssClass="table-tintuc">
                            <Columns>
                                <asp:BoundField DataField="MaTT" HeaderText="Mã TT" ReadOnly="True" />
                                <asp:TemplateField HeaderText="Hình Ảnh">
                                    <ItemTemplate>
                                        <img src='<%# ResolveUrl(Eval("HinhAnh").ToString()) %>' alt='<%# Eval("TieuDe") %>' style="width:100px;height:100px;" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:FileUpload ID="fuAnhSanPhamEdit" runat="server" />
                                        <asp:HiddenField ID="hfAnhHienTai" runat="server" Value='<%# Eval("HinhAnh") %>' />
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Tiêu Đề">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTieuDe" runat="server" Text='<%# Eval("TieuDe") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtTieuDeEdit" runat="server" Text='<%# Bind("TieuDe") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Nội Dung">
                                    <ItemTemplate>
                                        <asp:Label ID="lblNoiDung" runat="server" Text='<%# Eval("NoiDung") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtNoiDungEdit" runat="server" Text='<%# Bind("NoiDung") %>' TextMode="MultiLine"></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="GridViewTinTuc" EventName="RowEditing" />
                        <asp:AsyncPostBackTrigger ControlID="GridViewTinTuc" EventName="RowUpdating" />
                        <asp:AsyncPostBackTrigger ControlID="GridViewTinTuc" EventName="RowCancelingEdit" />
                        <asp:AsyncPostBackTrigger ControlID="GridViewTinTuc" EventName="RowDeleting" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</div>
  <!---------------------------------------------------------------->