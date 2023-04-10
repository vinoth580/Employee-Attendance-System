<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="Report.aspx.cs" Inherits="Report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     
     <table  cellspacing="10" >
         <tr>
             <td colspan="2">
                 <h2>Report</h2>
             </td>
         </tr>
                <tr>
                    <td style="width: 100px">
                        <asp:Label ID="lblImageUpload0" runat="server" Text="Month"></asp:Label></td>
                    <td style="width: 100px">
                        <asp:DropDownList ID="cboLeaveType" runat="server" Width="200px">
                            <asp:ListItem Value="1">January</asp:ListItem>
                            <asp:ListItem Value="2">February</asp:ListItem>
                            <asp:ListItem Value="3">March</asp:ListItem>
                            <asp:ListItem Value="4">April</asp:ListItem>
                            <asp:ListItem Value="5">May</asp:ListItem>
                            <asp:ListItem Value="6">June</asp:ListItem>
                            <asp:ListItem Value="7">July</asp:ListItem>
                            <asp:ListItem Value="8">August</asp:ListItem>
                            <asp:ListItem Value="9">September</asp:ListItem>
                            <asp:ListItem Value="10">October</asp:ListItem>
                            <asp:ListItem Value="11">November</asp:ListItem>
                            <asp:ListItem Value="12">December</asp:ListItem>
                        </asp:DropDownList>
                    &nbsp;
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" />

                    </td>
                </tr>
         <tr>
             <td colspan="2">
                 <h2>Attendance</h2>
             </td>
         </tr>
         <tr>
            <td colspan="2">
                &nbsp;<asp:Button ID="Button2" runat="server" Text="Export Attendance In Excel" OnClick="Button2_Click" /> <br />
                <asp:GridView ID="GvAttendance" runat="server" AutoGenerateColumns="False" CellPadding="4"
                            ForeColor="#333333" GridLines="None" >
                            <RowStyle BackColor="#EFF3FB" />
                            <Columns>
                                <asp:BoundField DataField="FirstName" HeaderText="First Name" />
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
         <tr>
             <td colspan="2">
                 <h2>Leave</h2>
             </td>
         </tr>
         
                <tr>
                    <td colspan="2" >
                        &nbsp;<asp:Button ID="Button3" runat="server" Text="Export Leave In Excel" OnClick="Button3_Click"  /> <br />
                        <asp:GridView ID="GvLeave" runat="server" AutoGenerateColumns="False" CellPadding="4"
                            ForeColor="#333333" GridLines="None" >
                            <RowStyle BackColor="#EFF3FB" />
                            <Columns>
                                <asp:BoundField DataField="FirstName" HeaderText="First Name" />
                                <asp:BoundField DataField="LeaveType" HeaderText="Leave Type" />
                                <asp:BoundField DataField="FromDate" HeaderText="FromDate" />
                                <asp:BoundField DataField="ToDate" HeaderText="ToDate" />
                                <asp:BoundField DataField="Description" HeaderText="Description" />

                     
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
         <tr>
             <td colspan="2">
                 <h2>Permission</h2>
             </td>
         </tr>
           <tr>
                    <td colspan="2" >
                        &nbsp;<asp:Button ID="Button4" runat="server" Text="Export Permission In Excel" OnClick="Button4_Click" /> <br />
                        <asp:GridView ID="GvPermission" runat="server" AutoGenerateColumns="False" CellPadding="4"
                            ForeColor="#333333" GridLines="None" >
                            <RowStyle BackColor="#EFF3FB" />
                            <Columns>
                                <asp:BoundField DataField="FirstName" HeaderText="First Name" />
                                <asp:BoundField DataField="PermissionDate" HeaderText="Permission Date" />
                                <asp:BoundField DataField="PermissionHour" HeaderText="Permission Hour" />
                                <asp:BoundField DataField="Reason" HeaderText="Reason" />

                     
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

