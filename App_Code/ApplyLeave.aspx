<%@ Page Language="C#" MasterPageFile="~/EmployeeMaster.master" AutoEventWireup="true" CodeFile="ApplyLeave.aspx.cs" Inherits="ApplyLeave" Title="Product" %>

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
            $('#<%=txtFromDate.ClientID %>').datepicker({ dateFormat: 'yy-mm-dd' });
            $('#<%=txtToDate.ClientID %>').datepicker({ dateFormat: 'yy-mm-dd' });
        });
    </script>
        <div align="center" style= "width:1300px; " >
            <table  cellspacing="10" >
                <tr>
                    <td style="width: 100px">
                        <asp:Label ID="lblImageUpload0" runat="server" Text="Leave Type"></asp:Label></td>
                    <td style="width: 100px">
                        <asp:DropDownList ID="cboLeaveType" runat="server" Width="200px">
                            <asp:ListItem>Fever</asp:ListItem>
                            <asp:ListItem>Injury</asp:ListItem>
                            <asp:ListItem>Others</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px">
                        <asp:Label ID="lblCategories" runat="server" Text="FromDate"></asp:Label></td>
                    <td style="width: 100px">
                        <asp:TextBox ID="txtFromDate" runat="server" Width="230px"></asp:TextBox></td>
                    <td style="width: 100px">
                        </td>
                </tr>
                <tr>
                    <td style="width: 100px">
                        <asp:Label ID="Label1" runat="server" Text="ToDate"></asp:Label></td>
                    <td style="width: 100px">
                        <asp:TextBox ID="txtToDate" runat="server" Width="230px"></asp:TextBox></td>
                    <td style="width: 100px">
                        </td>
                </tr>
                <tr>
                    <td style="width: 100px">
                        <asp:Label ID="LblDescription" runat="server" Text="Description"></asp:Label></td>
                    <td style="width: 100px">
                        <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Width="260px" Height="75px" OnTextChanged="txtDescription_TextChanged"></asp:TextBox></td>
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

                                <asp:BoundField DataField="LeaveType" HeaderText="Leave Type" />
                                <asp:BoundField DataField="FromDate" HeaderText="FromDate" />
                                <asp:BoundField DataField="ToDate" HeaderText="ToDate" />
                                <asp:BoundField DataField="Description" HeaderText="Description" />

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