<%@ Page Title="" Language="C#" MasterPageFile="~/coord.master" AutoEventWireup="true" CodeBehind="ViewStudentsC.aspx.cs" Inherits="CapstoneFinal.ViewStudentsC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="nestedFirst" runat="server">
    
    <div>

        <fieldset style="margin:20px; padding:20px; display:inline" >
            <legend style="color:#450084; font-size:x-large;">Students</legend>
            <label>Select Teacher: </label>
            <asp:DropDownList
                ID="ddlTeacher"
                runat="server"
                DataSourceID="dsViewStudents"
                DataTextField="LastName"
                DataValueField="TeacherID"
                AutoPostBack="true">
            </asp:DropDownList>
            <asp:Button
                ID="btnLoadStudent"
                runat="server"
                Text="Show Selected Teacher's Students"
                OnClick="BtnLoadStudents" />

            <asp:Button ID="BtnShowAll" runat="server" Text="Show All Students"
                OnClick="BtnShowAll_Click" />
        
        <br />
        <fieldset style="padding:10px; margin:10px;">
            <legend> Students: </legend>
            <asp:GridView
                runat="server"
                ID="grdOrderResults"
                AlternatingRowStyle-BackColor="#eaaaff"
                EmptyDataText="No Students Selected!">
            </asp:GridView>
        </fieldset>


</fieldset>
    </div>
    <br />
    

    <asp:SqlDataSource runat="server"
        ID="dsViewStudents"
        ConnectionString="<%$ connectionStrings:lab4 %>"
        SelectCommand="SELECT * FROM Teacher" />

</asp:Content>
