<%@ Page Title="" Language="C#" MasterPageFile="~/first.master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CapstoneFinal.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="nestedFirst" runat="server">
    <br />
    <br />
    <asp:Table ID="Table1" runat="server" HorizontalAlign="Center"  style=" text-align:center; background-image: url(login.png); margin-top: 25px; padding:25px; background-position:center; background-size:cover; padding-left:-30px; margin: auto;"  ForeColor="#9900CC">
        
        <asp:TableRow>

            <asp:TableCell>
                
                <asp:Label ID="Label3" runat="server" Text="Sign In" Font-Size="Large" ForeColor="White" Font-Bold="true"></asp:Label>

            </asp:TableCell>
            <asp:TableCell><br /></asp:TableCell>
            

        </asp:TableRow>
        <asp:TableRow>


            <asp:TableCell><asp:Label ID="Label1" runat="server" Text="Username or Email:" style="color:white;" HorizontalAlign="Center"></asp:Label>
</asp:TableCell>
            </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell><asp:TextBox ID="txtEmail" runat="server"  HorizontalAlign="Center" style="" BorderStyle="Solid" ForeColor="#450084" BackColor="#F4EFE1" BorderColor="#450084" placeholder="Username or Email"></asp:TextBox>
<asp:Panel ID="Panel1" runat="server" Height="1" Width="250" ></asp:Panel>
</asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell><asp:Label ID="Label2" runat="server" Text="Password: " style="color:WHITE;"></asp:Label>
</asp:TableCell>
            </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell><asp:TextBox ID="txtPassword" runat="server" placeholder="Password" TextMode="Password" BorderStyle="Solid" ForeColor="#450084" BorderColor="#450084" BackColor="#F4EFE1"></asp:TextBox>
</asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell><asp:Button ID="btnLogin" runat="server" Text="Login ­>" OnClick="btnLogin_Click" />
</asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            
            

            
        </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell>
          
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <br />
    <br />
    <br />
   <asp:Label ID="lblIncorrectLogin" runat="server" Text="" ForeColor="Red" Font-Bold="true" style="text-align:center; margin:auto; align-self:center;"></asp:Label>
</asp:Content>
