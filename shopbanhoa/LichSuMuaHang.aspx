<%@ Page Title="" Language="C#" MasterPageFile="~/HomeShop.Master" AutoEventWireup="true" CodeBehind="LichSuMuaHang.aspx.cs" Inherits="shopbanhoa.LichSuMuaHang" %>

<%@ Register Src="~/Product/LichSuDonHang.ascx" TagPrefix="uc1" TagName="LichSuDonHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
        <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link href="css/Animation1.css" rel="stylesheet" />
    <link href="css/Style.css" rel="stylesheet" />
    <script src="js/JavaScript1.js"></script>
        <meta charset="UTF-8" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:LichSuDonHang runat="server" id="LichSuDonHang" />
</asp:Content>
