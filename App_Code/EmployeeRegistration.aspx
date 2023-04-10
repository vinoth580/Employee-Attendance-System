﻿<%@ Page Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" 
CodeFile="EmployeeRegistration.aspx.cs" Inherits="EmployeeRegistration" Title="Employee Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
          <table>
          <tr>
                    <td colspan="3">
                        <asp:LinkButton ID="ltbnAddNew" runat="server" onclick="ltbnAddNew_Click" >Add New</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" >
                        <asp:GridView ID="GridView" runat="server" AutoGenerateColumns="False" CellPadding="4"
                            ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True" OnPageIndexChanging="GridView_PageIndexChanging">
                            <RowStyle BackColor="#EFF3FB" />
                            <Columns>
                                <asp:TemplateField HeaderText="Image">
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" runat="server" Height="100px" ImageUrl='<%# Eval("ImagePath") %>'
                                            Width="100px" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="FirstName" HeaderText="FirstName" />
                                <asp:BoundField DataField="Initial" HeaderText="Initial" />
                                       <asp:BoundField DataField="Gender" HeaderText="Gender" />
                                <asp:BoundField DataField="EmailId" HeaderText="EmailId" />
                                       <asp:BoundField DataField="Address" HeaderText="Address" />
                     
                                       <asp:BoundField DataField="UserName" HeaderText="Employee Id" />
                                <asp:BoundField DataField="Password" HeaderText="Password" />
                                 
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
        </asp:View>
        <asp:View ID="View2" runat="server">
                <table  cellspacing="10" >
                <tr>
                    <td colspan="2">
                        <asp:LinkButton ID="ltbnViewList" runat="server" onclick="ltbnViewList_Click" >View List</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td >
                        <asp:Label ID="Label7" runat="server" Text="Employee Id"></asp:Label></td>
                    <td >
                        <asp:TextBox ID="txtUserName" runat="server" Width="230px"></asp:TextBox></td>
                    
                </tr>
                <tr>
                    <td >
                        <asp:Label ID="Label2" runat="server" Text="Name"></asp:Label></td>
                    <td >
                        <asp:TextBox ID="txtName" runat="server" Width="230px"></asp:TextBox></td>
                    
                </tr>
                <tr>
                    <td >
                        <asp:Label ID="Initial" runat="server" Text="Initial"></asp:Label></td>
                    <td >
                        <asp:DropDownList ID="cboInitial" runat="server">
                            <asp:ListItem>Mr.</asp:ListItem>
                            <asp:ListItem>Mrs.</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    
                </tr>
                
                <tr>
                    <td >
                        <asp:Label ID="Label4" runat="server" Text="Gender"></asp:Label></td>
                    <td >
                        <asp:RadioButton ID="rbtnMale" GroupName="sa" Text="Male" runat="server" />
                        <asp:RadioButton ID="rbtnFemale" GroupName="sa" Text="FeMale" runat="server" />    
                        </td>
                    
                </tr>
                <tr>
                    <td >
                        <asp:Label ID="Label5" runat="server" Text="EmailId"></asp:Label></td>
                    <td >
                        <asp:TextBox ID="txtEmialId" runat="server" Width="230px"></asp:TextBox></td>
                    <td >
                        </td>
                </tr>
                <tr>
                    <td >
                        <asp:Label ID="Label6" runat="server" Text="Address"></asp:Label></td>
                    <td >
                        <asp:TextBox ID="txtAddress" TextMode="MultiLine" runat="server" Width="230px"></asp:TextBox></td>
                    <td >
                        </td>
                </tr>
                <tr>
                    <td >
                        <asp:Label ID="lblImageUpload" runat="server" Text="Your Picture "></asp:Label></td>
                    <td >
                        <asp:FileUpload ID="fuImage" runat="server" /></td>
                </tr>
                <tr>
                    <td >
                        <asp:Label ID="lblCategories" runat="server" Text="Mobile No"></asp:Label></td>
                    <td >
                        <asp:TextBox ID="txtMobileNo" runat="server" Width="230px"></asp:TextBox></td>
                    <td >
                        </td>
                </tr>
                
                <tr>
                    <td >
                        <asp:Label ID="Initial2" runat="server" Text="DOB"></asp:Label></td>
                    <td >
                        <asp:TextBox ID="txtDOB" runat="server" Width="230px"></asp:TextBox>
                        </td>
                    <td >
                        &nbsp;</td>
                </tr>
                
                <tr>
                    <td >
                        <asp:Label ID="Initial3" runat="server" Text="Blood Group"></asp:Label></td>
                    <td >
                        <asp:TextBox ID="txtBloodGroup" runat="server" Width="230px"></asp:TextBox>
                        </td>
                    <td >
                        &nbsp;</td>
                </tr>
                
                <tr>
                    <td >
                        <asp:Label ID="Initial4" runat="server" Text="Year Of Joining"></asp:Label></td>
                    <td >
                        <asp:TextBox ID="txtYearOfJoining" runat="server" Width="230px"></asp:TextBox>
                        </td>
                    <td >
                        &nbsp;</td>
                </tr>
                <tr>
                    <td >
                        <asp:Label ID="Label1" runat="server" Text="Fathers Name"></asp:Label></td>
                    <td >
                        <asp:TextBox ID="txtFathersName" runat="server" Width="230px"></asp:TextBox></td>
                    
                </tr>
                <tr>
                    <td >
                        <asp:Label ID="Label3" runat="server" Text="Address1"></asp:Label></td>
                    <td >
                        <asp:TextBox ID="txtAddress1" runat="server" Width="230px"></asp:TextBox></td>
                    
                </tr>
                <tr>
                    <td >
                        <asp:Label ID="Label8" runat="server" Text="Address2"></asp:Label></td>
                    <td >
                        <asp:TextBox ID="txtAddress2" runat="server" Width="230px"></asp:TextBox></td>
                    
                </tr>
                <tr>
                    <td >
                        <asp:Label ID="Label9" runat="server" Text="Address3"></asp:Label></td>
                    <td >
                        <asp:TextBox ID="txtAddress3" runat="server" Width="230px"></asp:TextBox></td>
                    
                </tr>
                
                <tr>
                    <td style="width: 100px; height: 62px;" colspan="3">
                        <asp:Button ID="btnSave" runat="server" Text="Save" Height="30px" OnClick="btnSave_Click" Width="150px" ValidationGroup="g" />
                        <asp:Button ID="btnClear" runat="server" Height="30px" OnClick="btnClear_Click" Text="Clear"
                            Width="150px" />
                    </td>
                </tr>
                </table>
        </asp:View>
    </asp:MultiView>

    
    <div align="center" style= "width:1300px; " >
    
              
            <asp:HiddenField ID="hf" runat="server" />
        </div>
    

    
</asp:Content>

