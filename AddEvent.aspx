<%@ Page Title="" Language="C#" MasterPageFile="~/coord.master" AutoEventWireup="true" CodeBehind="AddEvent.aspx.cs" Inherits="CapstoneFinal.AddEvent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="nestedFirst" runat="server">
    
    <div>
        <br />
        <fieldset style="margin:20px; padding:20px; display:inline" >
            <legend style="color:#450084; font-size:x-large;"> Add Event </legend>
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
            
            <br />
            <br />
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblTime" runat="server" Text="Start Time: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtTime" runat="server" Text=""></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorAge" runat="server" ControlToValidate="txtTime" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" Text="* This field is required" ErrorMessage="Error: Time Field is Blank"></asp:RequiredFieldValidator>
                   
                </asp:TableCell>
            </asp:TableRow>

            <br />
            <br />
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="Label1" runat="server" Text="End Time: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtEnd" runat="server" Text=""></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEnd" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" Text="* This field is required" ErrorMessage="Error: Time Field is Blank"></asp:RequiredFieldValidator>
                   
                </asp:TableCell>
            </asp:TableRow>
            <br />
            <br />
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblLocation" runat="server" Text="Location: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtLocation" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Select a CyberDay Date: "></asp:Label>
            <br />
            <asp:ListBox
             ID="ListBox1"
             runat="server"
             
             
             DataSourceID="dsDay"
             DataTextField="Date" 
             DataValueField="dayID"
             >
        </asp:ListBox>
            <br />
            <br />


     <asp:Button ID="butClear" runat="server" Text=" Start Over " OnClick="ButClear_Click" CausesValidation="false" BorderStyle="Solid" style="color:red; border-color: #450084"/>
     <asp:Button ID="butInsert" runat="server" Text=" Register Event " OnClick="ButInsert_Click" Message="Success! Event Added." BorderStyle="Solid" style="color:#450084; border-color: #450084" />

        </fieldset>
    </div>
    <br />
    

    <asp:SqlDataSource runat="server"
        ID="dsDay"
        ConnectionString="<%$ connectionStrings:lab4 %>"
        SelectCommand="Select [dayid], FORMAT ([date], 'dd-MM-yy') as [date] FROM [Day]" />

</asp:Content>
