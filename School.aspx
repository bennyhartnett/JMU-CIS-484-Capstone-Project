<%@ Page Title="" Language="C#" MasterPageFile="~/teacher.master" AutoEventWireup="true" CodeBehind="School.aspx.cs" Inherits="CapstoneFinal.School" %>
<asp:Content ID="Content1" ContentPlaceHolderID="nestedFirst" runat="server">
    <div>
        <fieldset style="margin:20px; padding:20px; display:inline" >
            <legend style="color:#450084; font-size:x-large;">Teachers by School </legend>
            <asp:DropDownList
                ID="ddlSchool"
                runat="server"
                DataSourceID="dsSchool"
                DataTextField="Name"
                DataValueField="SchoolID"
                AutoPostBack="true">
            </asp:DropDownList>
            <asp:Button
                ID="btnLoadTeacher"
                runat="server"
                Text="Show Selected School's Teachers"
                OnClick="BtnLoadTeachers" />
            <asp:Button ID="BtnShowAll"
                runat="server"
                Text="Show All Teachers"
                OnClick="BtnShowAll_Click" />
        
        <br />
        <fieldset style="padding:10px; margin:10px; display:inline;">
            <legend>Teachers: </legend>
            <asp:GridView
                runat="server"
                ID="grdOrderResults"
                AlternatingRowStyle-BackColor="#eaaaff"
                EmptyDataText="No Teachers Selected!">
            </asp:GridView>
        </fieldset>
            </fieldset>
    </div>
    <br />
    
    <asp:SqlDataSource runat="server"
        ID="dsSchool"
        ConnectionString="<%$ connectionStrings:lab4 %>"
        SelectCommand="SELECT * FROM School" />

</asp:Content>
