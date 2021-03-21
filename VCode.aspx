<%@ Page Title="" Language="C#" MasterPageFile="~/coord.master" AutoEventWireup="true" CodeBehind="VCode.aspx.cs" Inherits="CapstoneFinal.VCode" %>
<asp:Content ID="Content1" ContentPlaceHolderID="nestedFirst" runat="server">
         <div>
        <br />
        <fieldset style="margin:20px; padding:20px; display:inline" >
            <legend style="color:#450084; font-size:x-large;">Volunteer Verification Codes</legend>
            <br />
            <asp:GridView
                runat="server"
                ID="grdOrderResults"
                AlternatingRowStyle-BackColor="#eaaaff"
                EmptyDataText="No Volunteer Codes Found!"
                DataSourceID="vcodes">
            </asp:GridView>
        </fieldset>
    </div>
    <br />
    
    <asp:SqlDataSource runat="server"
        ID="vcodes"
        ConnectionString="<%$ connectionStrings:lab4 %>"
        SelectCommand="SELECT * from [capstonedb2].[dbo].[Verify] where Type=3" />
    </>

</asp:Content>
