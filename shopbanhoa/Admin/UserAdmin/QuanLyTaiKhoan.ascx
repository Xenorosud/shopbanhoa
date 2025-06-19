<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QuanLyTaiKhoan.ascx.cs" Inherits="shopbanhoa.Admin.UserAdmin.QuanLyTaiKhoan" %>

<asp:ScriptManager ID="ScriptManager1" runat="server" />

<div class="titles-add_pr">
    <p class="titles-sm_pra">Quản lý tài khoản - Thêm tài khoản</p>
</div>
  <!---------------------------------------------------------------->
<div class="container__TaiKhoan">
    <div class="creat_tintuc">
        <div id="errorMessage" class="error-message fade-in" style="display:none;margin-top:1rem;background-color:red;color:#fff;padding:10px;text-align:center;"></div>
        <div id="successMessage" class="alert alert-success fade-in" style="display:none;margin-top:1rem;background-color:green;color:#fff;padding:10px;text-align:center;">Thêm tài khoản thành công!</div>

        <p class="bg-titles-creat" style="margin-top:1rem;">Tạo thêm mới tài khoản</p>

        <div class="add_part-pr">
            <label class="label_names">Họ tên:</label>
            <asp:TextBox ID="txtHoTen" runat="server" CssClass="input-creat" placeholder="Nhập họ tên..."></asp:TextBox>
        </div>
        <div class="add_part-pr">
            <label class="label_names">Email:</label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="input-creat" placeholder="Nhập email..."></asp:TextBox>
        </div>
        <div class="add_part-pr">
            <label class="label_names">Điện thoại:</label>
            <asp:TextBox ID="txtDienThoai" runat="server" CssClass="input-creat" placeholder="Nhập điện thoại..."></asp:TextBox>
        </div>
        <div class="add_part-pr">
            <label class="label_names">Mật khẩu:</label>
            <asp:TextBox ID="txtMatKhau" runat="server" CssClass="input-creat" TextMode="Password" placeholder="Nhập mật khẩu..."></asp:TextBox>
        </div>
        <div class="add_part-pr">
            <label class="label_names">Quyền:</label>
            <asp:TextBox ID="txtIDQuyen" runat="server" CssClass="input-creat" placeholder="Nhập quyền..."></asp:TextBox>
        </div>

        <div class="add_part-pr">
            <asp:Button ID="btnThemTaiKhoan" runat="server" Text="Thêm tài khoản" OnClick="btnThemTaiKhoan_Click" CssClass="btn-creat" />
        </div>
    </div>
      <!---------------------------------------------------------------->
    <div class="bg_tintuc-all">
        <p class="bg-titles-creat">Bảng danh sách tài khoản</p>
        <div class="bg_list-tintuc">
            <div class="bg-list_all">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="GridViewTaiKhoan" runat="server" AutoGenerateColumns="False" DataKeyNames="MaNguoiDung" OnRowEditing="GridViewTaiKhoan_RowEditing" OnRowUpdating="GridViewTaiKhoan_RowUpdating" OnRowCancelingEdit="GridViewTaiKhoan_RowCancelingEdit" OnRowDeleting="GridViewTaiKhoan_RowDeleting" CssClass="table-tintuc">
                            <Columns>
                                <asp:BoundField DataField="MaNguoiDung" HeaderText="Mã ND" ReadOnly="True" />
                                <asp:BoundField DataField="HoTen" HeaderText="Họ tên" />
                                <asp:BoundField DataField="Email" HeaderText="Email" />
                                <asp:BoundField DataField="Matkhau" HeaderText="Mật khẩu" />
                                <asp:BoundField DataField="Dienthoai" HeaderText="Điện thoại" />
                                <asp:BoundField DataField="IDQuyen" HeaderText="Quyền" />
                                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="GridViewTaiKhoan" EventName="RowEditing" />
                        <asp:AsyncPostBackTrigger ControlID="GridViewTaiKhoan" EventName="RowUpdating" />
                        <asp:AsyncPostBackTrigger ControlID="GridViewTaiKhoan" EventName="RowCancelingEdit" />
                        <asp:AsyncPostBackTrigger ControlID="GridViewTaiKhoan" EventName="RowDeleting" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
      <!---------------------------------------------------------------->
</div>
