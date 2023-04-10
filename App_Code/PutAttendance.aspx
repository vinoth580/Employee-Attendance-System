<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeMaster.master" AutoEventWireup="true" CodeFile="PutAttendance.aspx.cs" Inherits="PutAttendance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table  width="100%">
        
        <tr>
            <td colspan="3">
                <h1>PUT ATTANDANCE</h1>
             </td>
            
        </tr>
        <tr>

            <td>
                <div>
                    <asp:Button ID="btnCheckin" runat="server" Text="Check In" Font-Bold="true" ForeColor="White"  BackColor="Orange" Font-Size="24" OnClick="btnCheckin_Click"/>
                </div>
            </td>
            <td>
                <div>
                    <asp:Button ID="btnCheckOut" runat="server" Text="Check Out" Font-Bold="true" ForeColor="White"  BackColor="Orange" Font-Size="24" OnClick="btnCheckOut_Click"/>
                </div>
            </td>
            <td rowspan="3">
                <asp:Image ID="Image1" runat="server" ImageUrl="images/checkin.jpg" Width="500px" />
            </td>
        </tr>
        <tr>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="GridView" runat="server" AutoGenerateColumns="False" CellPadding="4"
                            ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True" OnPageIndexChanging="GridView_PageIndexChanging">
                            <RowStyle BackColor="#EFF3FB" />
                            <Columns>
                                <asp:BoundField DataField="AttendanceDate" HeaderText="Attendance Date" />
                                <asp:BoundField DataField="CheckInTime" HeaderText="CheckIn Time" />
                                <asp:BoundField DataField="CheckOutTime" HeaderText="CheckOut Time" />
                                
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
</asp:Content>

