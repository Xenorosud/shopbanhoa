<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DatHangCT.ascx.cs" Inherits="shopbanhoa.Product.DatHangCT" %>
<%@ Register Src="~/Product/HoaQuaNgauNhien.ascx" TagPrefix="uc1" TagName="HoaQuaNgauNhien" %>

<div class="titles-cart">

    <p class="titles-cart-sm">Giỏ hàng của bạn</p>
    <a href="ChiTietDonHang.aspx" class="bg_detail-cart">Xem đơn hàng của bạn <i class="fa-solid fa-arrow-right"></i></a>
</div>

<div class="body_carts">
    <div class="body-all_cart">
        <p style="text-align:center;text-transform:uppercase;padding:12px;background: linear-gradient(0deg, rgba(34,193,195,1) 18%, rgba(252, 186, 3, 1) 84%);color:#fff;font-weight:550;">
            Danh sách sản phẩm
        </p>

        <div style="max-height: 600px; overflow-y: auto;margin-top:1.8rem;">

            <asp:GridView ID="gvCart" runat="server" AutoGenerateColumns="False" CssClass="table_bodys" OnRowCommand="gvCart_RowCommand">
                <Columns>
                    <asp:BoundField DataField="MaSP" HeaderText="Mã SP" />
                    <asp:TemplateField HeaderText="Ảnh SP">
                        <ItemTemplate>
                            <img src='<%# ResolveUrl(Eval("AnhSP").ToString()) %>' alt='<%# Eval("AnhSP") %>' width="100" height="100" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="TenSP" HeaderText="Tên SP" />
                    <asp:TemplateField HeaderText="Số lượng">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkDecrease" runat="server" CommandName="DecreaseQuantity" CommandArgument='<%# Eval("MaSP") %>' Text="-" CssClass="btn-quantity" />
                            <%# Eval("SoLuong") %>
                            <asp:LinkButton ID="lnkIncrease" runat="server" CommandName="IncreaseQuantity" CommandArgument='<%# Eval("MaSP") %>' Text="+" CssClass="btn-quantity" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="GiaBan" HeaderText="Đơn giá" DataFormatString="{0:#,##0} VNĐ" />
                    <asp:BoundField DataField="GiamGia" HeaderText="Giảm giá (%)" DataFormatString="{0:0.##} %" />
                   
                    <asp:TemplateField HeaderText="Thao tác">
                        <ItemTemplate>
                            <asp:Button ID="btnXoa" runat="server" Text="Xóa" CommandArgument='<%# Eval("MaSP") %>' CommandName="DeleteProduct" CssClass="btn-deletes-pr" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
           
        </div>

    
         <asp:Label ID="emptyCartMessage" runat="server" Text="Giỏ hàng của bạn đang trống." Visible="False" CssClass="label_empty-cart"></asp:Label>

        <div class="sum_loai">Tổng số lượng: <asp:Label ID="lblTotalQuantity" runat="server" Text="0"></asp:Label></div>
        <div class="sum_pr" style="display:flex;gap:1rem;">
            <p>Tổng tiền :</p>
            <asp:Label ID="lblTotalAmount" runat="server" Text="0 VNĐ" CssClass="sum_number-pr"></asp:Label>
        </div>
        <div class="btn-again">
            <a href="TatCaHoa.aspx" class="btn_link-again"><i class="fa-solid fa-chevron-left"></i> Tiếp tục mua sắm</a>
        </div>
    </div>

    <div class="body_info-user">
        <div id="errorMessage" class="error-message fade-in" style="display:none;margin-top:1rem;background-color:red;color:#fff;padding:10px;text-align:center;">
            Vui lòng điền đủ thông tin thanh toán!
        </div>
        <div id="successMessage" class="alert alert-success fade-in" style="display:none;margin-top:1rem;background-color:red;color:#fff;padding:10px;text-align:center;">
            Đặt hàng thành công!
        </div>
        <div class="body_pay-cart">
            <p class="titles-pay">Thông tin thanh toán</p>
            <p class="pay-sm">Vui lòng điền đủ thông tin thanh toán !</p>
        </div>
        <div class="form-input_user">
            <div class="part_input-user">
                <label class="label-user">Họ và tên</label>
                <asp:TextBox ID="txtHoten" runat="server" CssClass="input_pay"  placeholder="Nhập họ tên...."></asp:TextBox>
            </div>
            <div class="part_input-user">
                <label class="label-user">Số điện thoại</label>
                <asp:TextBox ID="txtsdt" runat="server" CssClass="input_pay"  placeholder="Nhập số điện thoại...."></asp:TextBox>
            </div>
            <div class="part_input-user">
                <label class="label-user">Nhập Email</label>
                <asp:TextBox ID="txtemail" runat="server" CssClass="input_pay"  placeholder="Nhập Email...."></asp:TextBox>
            </div>
            <div class="part_input-user">
                <label class="label-user">Địa chỉ</label>
                <asp:TextBox ID="txtdiachi" runat="server" CssClass="input_pay"  placeholder="Nhập Ấp / xã...."></asp:TextBox>
            </div>
            <div class="part_input-user">
                <label class="label-user">Tên Thành Phố</label>
                <asp:TextBox ID="txtTenThanhPho" runat="server" CssClass="input_pay"  placeholder="Nhập tên tỉnh / Thành phố...."></asp:TextBox>
            </div>
            <asp:DropDownList ID="ddlPaymentMethod" runat="server" CssClass="choice_pay">
                <asp:ListItem Value="1">Thanh toán tiền mặt</asp:ListItem>
                <asp:ListItem Value="2">Thanh toán chuyển khoản</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="info-pay_s">
            <span class="sum_title-pr">Tổng Thanh Toán :</span>
            <asp:Label ID="lblTotalAmounts" runat="server" Text="0 VNĐ" CssClass="sum_number-pr"></asp:Label>
        </div>
        <asp:Button runat="server" ID="btnDathang" Text="Đặt hàng" CssClass="btn_pays" OnClick="btnDathang_Click" />
    </div>
</div>

<p class="pr-goiy">THAM KHẢO MẪU HOA QUẢ GỢI Ý</p>
<div class="card_body" style="padding:3rem 1rem;margin-top:2rem;">
    <uc1:HoaQuaNgauNhien runat="server" ID="HoaNgauNhien" />
</div>

<style>
    .btn-deletes-pr {
        background-color: red;
        border: none;
        border-radius: 7px;
        padding: 5px;
        color: #fff;
        cursor: pointer;
    }
    .btn-quantity {
        background-color: #1BBC9B;
        border: none;
        border-radius: 5px;
        padding: 5px 10px;
        color: #fff;
        cursor: pointer;
    }
    .table_bodys th {
        font-size: 13px;
        text-align: center;
    }
    .table_bodys td {
        text-align: center;
        font-size: 14px;
    }
    .table_bodys {
        width: 100%;
        border-collapse: collapse;
    }
    .label_empty-cart {
        color:grey;
        font-weight:550;
        padding:20px;
        border:1px solid grey;
       display:flex;
       justify-content:center;
       align-items:center;
    }


   
</style>

<script type="text/javascript">
    function showErrorMessage(message) {
        var errorMessageDiv = document.getElementById("errorMessage");
        errorMessageDiv.innerText = message;
        errorMessageDiv.style.display = "block";
        setTimeout(function () {
            errorMessageDiv.style.display = "none";
        }, 3000);
    }

    function showSuccessMessage() {
        var successMessageDiv = document.getElementById("successMessage");
        successMessageDiv.style.display = "block";
        setTimeout(function () {
            successMessageDiv.style.display = "none";
        }, 3000);
    }
</script>
