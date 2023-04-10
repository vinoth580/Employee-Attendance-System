<%@ Page Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="StudentAttandance.aspx.cs"
 Inherits="StudentAttandance" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    
    
    <script src="js/jquery-1.12.4.js"></script>
  <script src="js/jquery-ui.js"></script>
   <link rel="stylesheet" href="css/jquery-ui.css">
    <script>
          $( function() {
            $( "#<%=TextBox1.ClientID %>" ).datepicker();
          } );
          
         
  </script>
  <script type="text/javascript" language="javascript">
   function CheckAllEmp1(Checkbox) {
            
            var GvStudentAttendance = document.getElementById("<%=GvStudentAttendance.ClientID %>");
            for (i = 1; i < GvStudentAttendance.rows.length; i++) {
                GvStudentAttendance.rows[i].cells[2].getElementsByTagName("INPUT")[0].checked = Checkbox.checked;
            }
        }
        function CheckAllEmp2(Checkbox) {
            
            var GvStudentAttendance = document.getElementById("<%=GvStudentAttendance.ClientID %>");
            for (i = 1; i < GvStudentAttendance.rows.length; i++) {
                GvStudentAttendance.rows[i].cells[3].getElementsByTagName("INPUT")[0].checked = Checkbox.checked;
            }
        }
        function CheckAllEmp3(Checkbox) {
            
            var GvStudentAttendance = document.getElementById("<%=GvStudentAttendance.ClientID %>");
            for (i = 1; i < GvStudentAttendance.rows.length; i++) {
                GvStudentAttendance.rows[i].cells[4].getElementsByTagName("INPUT")[0].checked = Checkbox.checked;
            }
        }
        function CheckAllEmp4(Checkbox) {
            
            var GvStudentAttendance = document.getElementById("<%=GvStudentAttendance.ClientID %>");
            for (i = 1; i < GvStudentAttendance.rows.length; i++) {
                GvStudentAttendance.rows[i].cells[5].getElementsByTagName("INPUT")[0].checked = Checkbox.checked;
            }
        }
        function CheckAllEmp5(Checkbox) {
            
            var GvStudentAttendance = document.getElementById("<%=GvStudentAttendance.ClientID %>");
            for (i = 1; i < GvStudentAttendance.rows.length; i++) {
                GvStudentAttendance.rows[i].cells[6].getElementsByTagName("INPUT")[0].checked = Checkbox.checked;
            }
        }
        function CheckAllEmp6(Checkbox) {
            
            var GvStudentAttendance = document.getElementById("<%=GvStudentAttendance.ClientID %>");
            for (i = 1; i < GvStudentAttendance.rows.length; i++) {
                GvStudentAttendance.rows[i].cells[7].getElementsByTagName("INPUT")[0].checked = Checkbox.checked;
            }
        }
        function CheckAllEmp7(Checkbox) {
            
            var GvStudentAttendance = document.getElementById("<%=GvStudentAttendance.ClientID %>");
            for (i = 1; i < GvStudentAttendance.rows.length; i++) {
                GvStudentAttendance.rows[i].cells[8].getElementsByTagName("INPUT")[0].checked = Checkbox.checked;
            }
        }
        function CheckAllEmp8(Checkbox) {
            
            var GvStudentAttendance = document.getElementById("<%=GvStudentAttendance.ClientID %>");
            for (i = 1; i < GvStudentAttendance.rows.length; i++) {
                GvStudentAttendance.rows[i].cells[9].getElementsByTagName("INPUT")[0].checked = Checkbox.checked;
            }
        }
  </script>
    
    <table width="100%">
        <tr>
            <td>
               <h1>Student Attendance</h1> 
            </td>
        </tr>
        <tr>
        <td>
             <asp:Label ID="Label1" runat="server" Text="Date Of Attendance : "></asp:Label>
             <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        &nbsp;<asp:Label ID="Label2" runat="server" Text="Subject"></asp:Label>
             <asp:DropDownList ID="cboSubject" runat="server">
             </asp:DropDownList>
        </td>
        </tr>
        <tr>
        <td>
             &nbsp;</td>
        </tr>
        <td>
             <asp:GridView ID="GvStudentAttendance" runat="server" 
                 AutoGenerateColumns="False" CellPadding="4"
                            ForeColor="#333333" GridLines="None" 
                 AllowSorting="True" >
                            <RowStyle BackColor="#EFF3FB" />
                            <Columns>
                             <asp:BoundField DataField="FirstName" HeaderText="FirstName" />
                                <asp:BoundField DataField="EmailId" HeaderText="EmailId" />
                            <asp:TemplateField HeaderText="P1">
                                <HeaderTemplate >
                                     <asp:CheckBox ID="chkboxSelectAllP1" runat="server" Text="P1" onclick="CheckAllEmp1(this);" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkstudent1" runat="server" />
                                    <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("Id") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>    
                            <asp:TemplateField HeaderText="P2">
                            <HeaderTemplate >
                                     <asp:CheckBox ID="chkboxSelectAllP2" runat="server" Text="P2" onclick="CheckAllEmp2(this);" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkstudent2" runat="server" />
                                    <asp:HiddenField ID="HiddenField2" runat="server" Value='<%# Eval("Id") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>    
                            <asp:TemplateField HeaderText="P3">
                            <HeaderTemplate >
                                     <asp:CheckBox ID="chkboxSelectAllP3" runat="server" Text="P3" onclick="CheckAllEmp3(this);" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkstudent3" runat="server" />
                                    <asp:HiddenField ID="HiddenField3" runat="server" Value='<%# Eval("Id") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>    
                            <asp:TemplateField HeaderText="P4">
                            <HeaderTemplate >
                                     <asp:CheckBox ID="chkboxSelectAllP4" runat="server" Text="P4" onclick="CheckAllEmp4(this);" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkstudent4" runat="server" />
                                    <asp:HiddenField ID="HiddenField4" runat="server" Value='<%# Eval("Id") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>    
                            <asp:TemplateField HeaderText="P5">
                            <HeaderTemplate >
                                     <asp:CheckBox ID="chkboxSelectAllP5" runat="server" Text="P5" onclick="CheckAllEmp5(this);" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkstudent5" runat="server" />
                                    <asp:HiddenField ID="HiddenField5" runat="server" Value='<%# Eval("Id") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>    
                            <asp:TemplateField HeaderText="P6">
                            <HeaderTemplate >
                                     <asp:CheckBox ID="chkboxSelectAllP6" runat="server" Text="P6" onclick="CheckAllEmp6(this);" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkstudent6" runat="server" />
                                    <asp:HiddenField ID="HiddenField6" runat="server" Value='<%# Eval("Id") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>    
                            <asp:TemplateField HeaderText="P7">
                            <HeaderTemplate >
                                     <asp:CheckBox ID="chkboxSelectAllP7" runat="server" Text="P7" onclick="CheckAllEmp7(this);" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkstudent7" runat="server" />
                                    <asp:HiddenField ID="HiddenField7" runat="server" Value='<%# Eval("Id") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>    
                            <asp:TemplateField HeaderText="P8">
                            <HeaderTemplate >
                                     <asp:CheckBox ID="chkboxSelectAllP8" runat="server" Text="P8" onclick="CheckAllEmp8(this);" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkstudent8" runat="server" />
                                    <asp:HiddenField ID="HiddenField8" runat="server" Value='<%# Eval("Id") %>' />
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
        <tr>
        <td>
             &nbsp;</td>
        </tr>
        <tr>
        <td>
             <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                 Text="Submit Attendance" />
        </td>
        </tr>
    </table>
    


</asp:Content>

