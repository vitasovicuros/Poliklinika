<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Poliklinika.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Dodavanje novog termina:</h1>
    <asp:Label ID="Label1" runat="server" Text="Broj knjizice:"></asp:Label>
    &nbsp;&nbsp;
    <asp:DropDownList ID="ddlBrojKnjizice" runat="server"></asp:DropDownList>
    <br />
    <br />
    <asp:Label ID="Label2" runat="server" Text="ID doktora:"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <asp:DropDownList ID="ddlIDdoktora" runat="server"></asp:DropDownList>
    <br />
    <br />
    <asp:Button ID="btnDodaj" runat="server" Text="Dodaj" />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PoliklinkaConnectionString %>" SelectCommand="SELECT * FROM [Doktor]"></asp:SqlDataSource>
</asp:Content>
