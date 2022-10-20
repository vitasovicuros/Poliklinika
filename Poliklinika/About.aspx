<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Poliklinika.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Dodavanje novog termina:</h1>
    <asp:Label ID="Label1" runat="server" Text="Broj knjizice:"></asp:Label>
    &nbsp;&nbsp;
    <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
    <br />
    <br />
    <asp:Label ID="Label2" runat="server" Text="ID doktora:"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <asp:DropDownList ID="DropDownList2" runat="server"></asp:DropDownList>
    <br />
    <br />
    <asp:Label ID="Label3" runat="server" Text="Datum:"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="Label4" runat="server" Text="Vreme:"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    <br />
    <br />
    <asp:Button ID="Button1" runat="server" Text="Dodaj" />
</asp:Content>
