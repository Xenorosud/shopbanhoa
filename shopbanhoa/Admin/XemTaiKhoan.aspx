<%@ Page Title="" Language="C#" MasterPageFile="~/AdminHome.Master" AutoEventWireup="true" CodeBehind="XemTaiKhoan.aspx.cs" Inherits="shopbanhoa.Admin.XemTaiKhoan" %>

<%@ Register Src="~/Admin/UserAdmin/QuanLyTaiKhoan.ascx" TagPrefix="uc1" TagName="QuanLyTaiKhoan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
     <link href="css/StyleSheet1.css" rel="stylesheet" />
    <link href="css/StyleSheet2.css" rel="stylesheet" />
    <script src="js/JavaScript1.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:QuanLyTaiKhoan runat="server" id="QuanLyTaiKhoan" />
</asp:Content>
