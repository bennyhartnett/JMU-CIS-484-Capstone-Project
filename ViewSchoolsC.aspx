<%@ Page Title="" Language="C#" MasterPageFile="~/coord.master" AutoEventWireup="true" CodeBehind="ViewSchoolsC.aspx.cs" Inherits="CapstoneFinal.ViewSchoolsC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="nestedFirst" runat="server"> <div>
        <br />
        <fieldset style="margin:20px; padding:20px; display:inline" >
            <legend style="color:#450084; font-size:x-large;">School Information </legend>
            <br />
            <asp:GridView
                runat="server"
                ID="grdOrderResults"
                AlternatingRowStyle-BackColor="#eaaaff"
                EmptyDataText="No Schools Found!">
            </asp:GridView>
        </fieldset>
    </div>
    <br />
    
    <asp:SqlDataSource runat="server"
        ID="dsSchool"
        ConnectionString="<%$ connectionStrings:lab4 %>"
        SelectCommand="SELECT * FROM School" />
    </>
</asp:Content>
