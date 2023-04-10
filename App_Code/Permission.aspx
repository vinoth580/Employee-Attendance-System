<%@ Page Language="C#" MasterPageFile="~/EmployeeMaster.master" AutoEventWireup="true"
    CodeFile="Permission.aspx.cs" Inherits="Permission" Title="Permission" %>

<script runat="server">

    protected void txtDescription_TextChanged(object sender, EventArgs e)
    {

    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">

        $(function () {
            $('#<%=txtPermissionDate.ClientID %>').datepicker({ dateFormat: 'yy-mm-dd' });
        });
    </script>
        <div align="center" style= "width:1300px; " >
            <table  cellspacing="10" >
                <tr>
                    <td style="width: 100px">
                        <asp:Label ID="lblCategories" runat="server" Text="Permission Date"></asp:Label></td>
                    <td style="width: 100px">
                        <asp:TextBox ID="txtPermissionDate" runat="server" Width="230px"></asp:TextBox></td>
                    <td style="width: 100px">
                        </td>
                </tr>
                <tr>
                    <td style="width: 100px">
                        <asp:Label ID="Label1" runat="server" Text="Permission Hour"></asp:Label></td>
                    <td style="width: 100px">
                        <asp:TextBox ID="txtPermissionHour" runat="server" Width="230px"></asp:TextBox></td>
                    <td style="width: 100px">
                        </td>
                </tr>
                <tr>
                    <td style="width: 100px">
                        <asp:Label ID="LblDescription" runat="server" Text="Reason"></asp:Label></td>
                    <td style="width: 100px">
                        <asp:TextBox ID="txtReason" runat="server" TextMode="MultiLine" Width="260px" Height="75px" OnTextChanged="txtDescription_TextChanged"></asp:TextBox></td>
                    <td style="width: 100px">
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px; height: 62px;" colspan="3">
                        <asp:Button ID="btnSave" runat="server" Text="Save" Height="30px" OnClick="btnSave_Click" Width="150px" ValidationGroup="g" />
                        <asp:Button ID="btnClear" runat="server" Height="30px" OnClick="btnClear_Click" Text="Clear"
                            Width="150px" />
                    </td>
                </tr>
                <tr>
                    <td colspan="3" style="width: 100px">
                        <asp:GridView ID="GridView" runat="server" AutoGenerateColumns="False" CellPadding="4"
                            ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True" OnPageIndexChanging="GridView_PageIndexChanging">
                            <RowStyle BackColor="#EFF3FB" />
                            <Columns>

                                <asp:BoundField DataField="PermissionDate" HeaderText="Permission Date" />
                                <asp:BoundField DataField="PermissionHour" HeaderText="Permission Hour" />
                                <asp:BoundField DataField="Reason" HeaderText="Reason" />

                                <asp:TemplateField HeaderText="Edit">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkbtnEdit" runat="server" CommandArgument='<%# Eval("Id") %>'
                                            OnCommand="lnkbtnEdit_Command">Edit</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Delete">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkbtnDelete" runat="server" CommandArgument='<%# Eval("Id") %>'
                                            OnCommand="lnkbtnDelete_Command">Delete</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <EditRowStyle BackColor="#2461BF" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>
                    </td>
                </tr>
            </table>
            <asp:HiddenField ID="hf" runat="server" />
        </div>
    
</asp:Content>