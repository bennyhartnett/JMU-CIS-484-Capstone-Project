<%@ Page Title="" Language="C#" MasterPageFile="~/first.master" AutoEventWireup="true" CodeBehind="Verify.aspx.cs" Inherits="CapstoneFinal.Verify" %>
<asp:Content ID="Content1" ContentPlaceHolderID="nestedFirst" runat="server">
    
    <div style="text-align:center;  margin:auto;">
        <br />
        <br />
        <fieldset style="width:400px; margin:auto; border-color: #AD9C65">
            <legend style="color:#450084; font-size:x-large;">Verification</legend>
            <br />
            <br />
            

            <asp:Label ID="Label1" runat="server" Text="Verification codes for parents/students will be issued by your child's school or teacher. This code will allow you to register your child for CyberDay. Verification codes for teachers and volunteers will be issued by a CyberDay coordinator." ></asp:Label>

            <br />
            <br />

            <asp:Label ID="lblCode" runat="server" Text="Please Enter Verification Code Below: " ></asp:Label>
            <br />
            <br />
            <asp:TextBox ID="txtCode" runat="server" ForeColor="#450084" BackColor="#F4EFE1" BorderColor="#450084" placeholder=" Verification Code"></asp:TextBox>
            
            <asp:Button ID="btnSubmit" runat="server" Text=" Verify " OnClick="btnSubmit_Click"  BorderStyle="Solid" style="color:#450084; border-color: #450084"/>
            <br />
            <br />
            <asp:Label ID="lblStatus" runat="server" Text="" style="color:red"></asp:Label>
            <br />
            <br />
        </fieldset>
        <br />
        

    </div>

   


</asp:Content>
