<%@ Page Title="" Language="C#" MasterPageFile="~/coord.master" AutoEventWireup="true" CodeBehind="Print.aspx.cs" Inherits="CapstoneFinal.Print" %>
<asp:Content ID="Content1" ContentPlaceHolderID="nestedFirst" runat="server">
    <div>

        <fieldset style="margin:20px; padding:20px; display:inline" >
            <legend style="color:#450084; font-size:x-large;">Attendants</legend>
            <label>Select Teacher: </label>
            <asp:DropDownList
                ID="ddlTeacher"
                runat="server"
                DataSourceID="dsViewStudents"
                DataTextField="Name"
                DataValueField="SchoolID"
                AutoPostBack="true">
            </asp:DropDownList>
            <asp:Button
                ID="btnLoadStudent"
                runat="server"
                Text="Show Selected School's Attendants"
                OnClick="BtnLoadStudents" />

            <asp:Button ID="BtnShowAll" runat="server" Text="Show All Attendants"
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
        <fieldset style="padding:10px; margin:10px;">
            <legend> Teachers: </legend>
            <asp:GridView
                runat="server"
                ID="grdOrderResults2"
                AlternatingRowStyle-BackColor="#eaaaff"
                EmptyDataText="No Teachers Selected!">
            </asp:GridView>
        </fieldset>
            <fieldset style="padding:10px; margin:10px;">
            <legend> Parents: </legend>
            <asp:GridView
                runat="server"
                ID="grdOrderResults3"
                AlternatingRowStyle-BackColor="#eaaaff"
                EmptyDataText="No Parents Selected!">
            </asp:GridView>
        </fieldset>

</fieldset>
    </div>
    <br />
    

    <asp:SqlDataSource runat="server"
        ID="dsViewStudents"
        ConnectionString="<%$ connectionStrings:lab4 %>"
        SelectCommand="SELECT * FROM School" />
</asp:Content>
