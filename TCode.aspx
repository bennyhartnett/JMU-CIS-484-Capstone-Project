<%@ Page Title="" Language="C#" MasterPageFile="~/coord.master" AutoEventWireup="true" CodeBehind="TCode.aspx.cs" Inherits="CapstoneFinal.TCode" %>
<asp:Content ID="Content1" ContentPlaceHolderID="nestedFirst" runat="server">
         <div>
        <br />
        <fieldset style="margin:20px; padding:20px; display:inline" >
            <legend style="color:#450084; font-size:x-large;">Teacher Verification Codes</legend>
            <br />
            <asp:GridView
                runat="server"
                ID="grdOrderResults"
                AlternatingRowStyle-BackColor="#eaaaff"
                EmptyDataText="No Teacher Codes Found!"
                DataSourceID="tcodes">
            </asp:GridView>
        </fieldset>
    </div>
    <br />
    
    <asp:SqlDataSource runat="server"
        ID="tcodes"
        ConnectionString="<%$ connectionStrings:lab4 %>"
        SelectCommand="SELECT * from [capstonedb2].[dbo].[Verify] where Type=2" />
    </>

</asp:Content>
