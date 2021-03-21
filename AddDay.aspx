<%@ Page Title="" Language="C#" MasterPageFile="~/coord.master" AutoEventWireup="true" CodeBehind="AddDay.aspx.cs" Inherits="CapstoneFinal.AddDay" %>
<asp:Content ID="Content1" ContentPlaceHolderID="nestedFirst" runat="server">
<div>
        <fieldset style="margin:20px; padding:20px; display:inline" >
            <legend style="color:#450084; font-size:x-large;">Create a CyberDay </legend>
            <br />
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblFirstName" runat="server" Text="Event Title:"></asp:Label>
                    
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtEventTitle" runat="server" Text="" Value=""></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorFN" runat="server" ControlToValidate="txtEventTitle" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" Text="* This field is required" ErrorMessage="Error: Event Name Field is Blank"></asp:RequiredFieldValidator>

                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <br />
                    <br />
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Calendar ID="Calendar1" runat="server" SelectedDate="<%# DateTime.Today %>" ></asp:Calendar>

                    
                </asp:TableCell>
                </asp:TableRow>
            
            <br />
            <br />
            


            <asp:Button ID="butClear" runat="server" Text=" Start Over " OnClick="ButClear_Click" CausesValidation="false" BorderStyle="Solid" style="color:red; border-color: #450084"/>
            <asp:Button ID="butInsert" runat="server" Text=" Create CyberDay " OnClick="ButInsert_Click" Message="Success! School Added." BorderStyle="Solid" style="color:#450084; border-color: #450084" />

        </fieldset>
    </div>
    <br />
   

    <asp:SqlDataSource runat="server"
        ID="dsEvent"
        ConnectionString="<%$ connectionStrings:lab4 %>"
        SelectCommand="Select * FROM Event" />

</asp:Content>
