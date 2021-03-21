<%@ Page Title="" Language="C#" MasterPageFile="~/coord.master" AutoEventWireup="true" CodeBehind="AddVolunteerC.aspx.cs" Inherits="CapstoneFinal.AddVolunteerC" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="nestedFirst" runat="server">
    <div>
        <asp:ScriptManager 
            ID="ScriptManager1"
            runat="server"
            >
        </asp:ScriptManager>
        <br />
        <fieldset style="margin:20px; padding:20px; width:900px;">
            <legend style="color:#450084; font-size:x-large;">Volunteer Registration</legend>
            <br />
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblFirstName" runat="server" Text="First Name:"></asp:Label>

                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtFirstName" runat="server" Text="" Value=""></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorFN" runat="server" ControlToValidate="txtFirstName" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" Text="* This field is required" ErrorMessage="Error: First Name Field is Blank"></asp:RequiredFieldValidator>

                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>

                    <asp:Label ID="lblLastName" runat="server" Text="Last Name:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>

                    <asp:TextBox ID="txtLastName" runat="server" Text="" Value=""></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorLN" runat="server" ControlToValidate="txtLastName" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" Text="* This field is required" ErrorMessage="Error: Last Name Field is Blank"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <br />

            <br />
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblEmail" runat="server" Text="Email:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtEmail" runat="server" Text=""></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" Text="* This field is required" ErrorMessage="Error: Email Field is Blank"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="txtEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail" ErrorMessage="Error: Invalid Email Format" ForeColor="Red"></asp:RegularExpressionValidator>
                </asp:TableCell>
            </asp:TableRow>
            <br />
            <br />
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblPassword" runat="server" Text="Password:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPassword" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" Text="* This field is required" ErrorMessage="Error: Password Field is Blank"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <br />
            <br />


            <asp:TableRow>
                <asp:TableCell>
                    

                    
                    <asp:Label ID="Label4" runat="server" Text="Phone Number:"></asp:Label>
                  
                    <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                    <asp:MaskedEditExtender ID="MaskedEditExtender1" runat="server" TargetControlID="txtPhone"
            Mask="(999)-999-9999" MessageValidatorTip="true" ErrorTooltipEnabled="True" ></asp:MaskedEditExtender>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="* Required Field" ControlToValidate="txtPhone" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" Text="* This field is required"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <br />


            <br />
            <asp:Label ID="Label1" runat="server" Text="Shirt: "></asp:Label>
            <br />
            <asp:ListBox
             ID="ListBox1"
             runat="server"
             
             
             DataSourceID="dsShirt"
             DataTextField="Combo" 
             DataValueField="ShirtInfoId"
             >
        </asp:ListBox>
            <br />
            <br />
            <br />

             <asp:Button ID="butClear" runat="server" Text=" Start Over " OnClick="butClear_Click" CausesValidation="false" BorderStyle="Solid" style="color:red; border-color: #450084"/>
            <asp:Button ID="butInsert" runat="server" Text=" Create Account " OnClick="butCreate_Click" Message="Success! Volunteer Added." BorderStyle="Solid" style="color:#450084; border-color: #450084" />


        </fieldset>
    </div>
    <br />
    <asp:SqlDataSource runat="server"
        ID="dsShirt"
        ConnectionString="<%$ connectionStrings:lab4 %>"
        SelectCommand="Select (ShirtSize + ' ' + ShirtColor) As Combo, ShirtInfoID from TShirtConfigurations" />

    
</asp:Content>

