<%@ Page Title="" Language="C#" MasterPageFile="~/coord.master" AutoEventWireup="true" CodeBehind="PCode.aspx.cs" Inherits="CapstoneFinal.PCode" %>
<asp:Content ID="Content1" ContentPlaceHolderID="nestedFirst" runat="server">
     <div>
        <br />
        <fieldset style="margin:20px; padding:20px; display:inline" >
            <legend style="color:#450084; font-size:x-large;">Parent Verification Codes</legend>
            <br />
            <asp:GridView
                runat="server"
                ID="grdOrderResults"
                AlternatingRowStyle-BackColor="#eaaaff"
                EmptyDataText="No Parent Codes Found!"
                DataSourceID="pcodes">
            </asp:GridView>
        </fieldset>
    </div>
    <br />
    
    <asp:SqlDataSource runat="server"
        ID="pcodes"
        ConnectionString="<%$ connectionStrings:lab4 %>"
        SelectCommand="SELECT * from [capstonedb2].[dbo].[Verify] where Type=1" />
    </>

</asp:Content>
