<%@ Page Title="" Language="C#" MasterPageFile="~/coord.master" AutoEventWireup="true" CodeBehind="AddCode.aspx.cs" Inherits="CapstoneFinal.AddCode" %>
<asp:Content ID="Content1" ContentPlaceHolderID="nestedFirst" runat="server">
    <div>
   
        <br />
        <fieldset style="margin:20px; padding:20px; display:inline" >
            <legend style="color:#450084; font-size:x-large;">Create New Verification Code</legend>
            <br />
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblNewCode" runat="server" Text="New Code: "></asp:Label>

                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtCode" runat="server" Text="" Value=""></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorFN" runat="server" ControlToValidate="txtCode" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" Text="* This field is required" ErrorMessage="Error: First Name Field is Blank"></asp:RequiredFieldValidator>

                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>

                    <asp:Label ID="lblCodeType" runat="server" Text="Code Type:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>

                    <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorLN" runat="server" ControlToValidate="txtLastName" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" Text="* This field is required" ErrorMessage="Error: Last Name Field is Blank"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <br />
            <br />
           
            
            <asp:Button ID="butClear" runat="server" Text=" Start Over " OnClick="ButClear_Click" CausesValidation="false" BorderStyle="Solid" style="color:red; border-color: #450084"/>
            <asp:Button ID="butInsert" runat="server" Text=" Create Verification Code " OnClick="ButInsert_Click" Message="Success! Student Added." BorderStyle="Solid" style="color:#450084; border-color: #450084"/>

        </fieldset>
    </div>
    <br />
    
    <asp:SqlDataSource runat="server"
        ID="dsEvent"
        ConnectionString="<%$ connectionStrings:lab4 %>"
        SelectCommand="Select * FROM Event" />
</asp:Content>
