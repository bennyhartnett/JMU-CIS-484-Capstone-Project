<%@ Page Title="" Language="C#" MasterPageFile="~/teacher.master" AutoEventWireup="true" CodeBehind="PCodeT.aspx.cs" Inherits="CapstoneFinal.PCodeT" %>
<asp:Content ID="Content1" ContentPlaceHolderID="nestedFirst" runat="server">
     <asp:SqlDataSource ID="SqlDataSource1" runat="server"
        
        ConnectionString="<%$ connectionStrings:lab4 %>"
        SelectCommand="SELECT top (2) Code from [capstonedb2].[dbo].[Verify] right join teacher on SUBSTRING([Code], 1, 1) = @VCode"

        >        
    <SelectParameters>
        <asp:Parameter Name="VCode" />
    </SelectParameters>
        </asp:SqlDataSource>

    <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
    <div>
        <br />
        <fieldset style="margin:20px; padding:20px; display:inline" >
            <legend style="color:#450084; font-size:x-large;">My School's Verification Codes</legend>
            <br />
            <asp:Label ID="Label1" runat="server" Text="Give the code in the white box to parents in order for them to sign up their child for CyberDay. The code highlighted in purple is the teacher verification code for your school. You can give this teacher verification code to other teachers at your school that wish to enroll their class in CyberDay."></asp:Label>
            <br />
            <asp:GridView
                runat="server"
                ID="grdOrderResults"
                AlternatingRowStyle-BackColor="#eaaaff"
                EmptyDataText="No Parent Codes Found!"
                DataSourceID="SqlDataSource1">
            </asp:GridView>
        </fieldset>
    </div>
    <br />
    
    
        
        

    
</asp:Content>
