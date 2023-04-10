<%@ Page Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="ExportAttendance.aspx.cs" Inherits="ExportAttendance" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" CellPadding="4" 
    ForeColor="#333333" GridLines="None">
        <RowStyle BackColor="#EFF3FB" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:Button ID="btnExport" runat="server" Text="Export" 
    onclick="btnExport_Click" />
</asp:Content>

