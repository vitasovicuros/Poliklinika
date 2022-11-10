﻿<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Poliklinika._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <br /><br />

    <h1>Prikaz pregleda</h1>
    <br /><br />

    &nbsp;&nbsp;

    <asp:Label ID="lblPacijent" runat="server" Text="Pacijent:"></asp:Label>
    &nbsp;
    <asp:DropDownList ID="ddlPacijent" runat="server"></asp:DropDownList>
    <br /><br />

    &nbsp;&nbsp;

    <asp:Label ID="lblDoktor" runat="server" Text="Doktor:"></asp:Label>
    &nbsp;&nbsp;&nbsp;
    <asp:DropDownList ID="ddlDoktor" runat="server"></asp:DropDownList>
    <br /><br />

    <asp:Button ID="btnPrikaz" runat="server" Text="Prikaz" OnClick="btnPrikaz_Click" Width="94px" />
    <br /><br />

    <asp:GridView ID="GridView1" runat="server"></asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EvidencijaPutnikaConnectionString %>" SelectCommand="SELECT * FROM [Doktor]"></asp:SqlDataSource>
</asp:Content>
