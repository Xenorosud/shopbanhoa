<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QuanLySlider.ascx.cs" Inherits="shopbanhoa.Admin.UserAdmin.QuanLySlider" %>

<asp:ScriptManager ID="ScriptManager1" runat="server" />

<div class="add-slider">
    <div id="errorMessage" class="error-message fade-in" style="display:none;margin-top:1rem;background-color:red;color:#fff;padding:10px;text-align:center;"></div>
    <div id="successMessage" class="alert alert-success fade-in" style="display:none;margin-top:1rem;background-color:green;color:#fff;padding:10px;text-align:center;">Thêm ảnh thành công!</div>
    <p class="bg-titles-creat">Thêm mới ảnh slider</p>

    <div class="bg_slider-all">
        <asp:FileUpload ID="fileUploadSlider" runat="server" />
        <asp:Button ID="btnUpload" runat="server" Text="Thêm Ảnh" OnClick="UploadSliderImage" CssClass="btn-creat" />
    </div>
</div>

<p class="bg-titles-creat" style="margin-top:5rem;">Danh sách ảnh slider</p>
<div class="slider">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:GridView ID="GridViewSlider" runat="server" AutoGenerateColumns="False" DataKeyNames="MaSlider" OnRowEditing="GridViewSlider_RowEditing" OnRowUpdating="GridViewSlider_RowUpdating" OnRowCancelingEdit="GridViewSlider_RowCancelingEdit" OnRowDeleting="GridViewSlider_RowDeleting" CssClass="table-slider">
                <Columns>
                    <asp:BoundField DataField="MaSlider" HeaderText="Mã Slider" ReadOnly="True" />
                    <asp:TemplateField HeaderText="Hình Ảnh">
                        <ItemTemplate>
                            <img src='<%# ResolveUrl(Eval("AnhSlider").ToString()) %>' alt='<%# Eval("MaSlider") %>' style="width:600px;height:300px;" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:FileUpload ID="fuAnhSliderEdit" runat="server" />
                            <asp:HiddenField ID="hfAnhHienTai" runat="server" Value='<%# Eval("AnhSlider") %>' />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="GridViewSlider" EventName="RowEditing" />
            <asp:AsyncPostBackTrigger ControlID="GridViewSlider" EventName="RowUpdating" />
            <asp:AsyncPostBackTrigger ControlID="GridViewSlider" EventName="RowCancelingEdit" />
            <asp:AsyncPostBackTrigger ControlID="GridViewSlider" EventName="RowDeleting" />
        </Triggers>
    </asp:UpdatePanel>
</div>
