<%@ Page Title="" Language="C#" MasterPageFile="~/coord.master" AutoEventWireup="true" CodeBehind="AddSchool.aspx.cs" Inherits="CapstoneFinal.AddSchool" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="nestedFirst" runat="server">

     <div>
        <asp:ScriptManager 
            ID="ScriptManager1"
            runat="server"
            >
        </asp:ScriptManager>
        
        <br />
        <fieldset style="margin:20px; padding:20px; display:inline" >
            <legend style="color:#450084; font-size:x-large;">Add School </legend>
            <br />

            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblSchoolName" runat="server" Text="School Name:"></asp:Label>

                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtSchoolName" runat="server" Text="" Value=""></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorFN" runat="server" ControlToValidate="txtSchoolName" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" Text="* This field is required" ErrorMessage="Error: School Name Field is Blank"></asp:RequiredFieldValidator>

                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>

                    <%--<br />--%>
                </asp:TableCell>
                <asp:TableCell>
                  
                </asp:TableCell>
            <%--</asp:TableRow>

            <br />
            <asp:TableRow>--%>
                <asp:TableCell>
                    <asp:Label ID="Label6" runat="server" Text="Phone Number: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                    <asp:MaskedEditExtender ID="MaskedEditExtender1" runat="server" TargetControlID="txtPhone"
            Mask="(999)-999-9999" MessageValidatorTip="true" ErrorTooltipEnabled="True" >
        </asp:MaskedEditExtender>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidatorP" runat="server" ControlToValidate="txtPhone" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" Text="* This field is required" ErrorMessage="Error: Phone Number Field is Blank"></asp:RequiredFieldValidator>
                </asp:TableCell>
            <%--</asp:TableRow>
            <br />
            <br />
            <asp:TableRow>--%>
                <asp:TableCell>
                    <asp:Label ID="lblPCN" runat="server" Text="Primary Contact Name: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtPCN" runat="server" Text=""></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPCN" runat="server" ControlToValidate="txtPCN" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" Text="* This field is required" ErrorMessage="Error: Primary Contact Name Field is Blank"></asp:RequiredFieldValidator>
                    <%--<asp:CompareValidator ID="CompareValidatorAge" runat="server" ControlToValidate="txtAge" SetFocusOnError="false" Operator="DataTypeCheck" Type="Double" ForeColor="Red" Text="Age must be a whole integer" ErrorMessage="Error: Please enter a whole number of years for age"></asp:CompareValidator>--%>
                </asp:TableCell>
            </asp:TableRow>
            <br />
            <br />
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblLocation" runat="server" Text="Address 1: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtAddress1" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorAd" runat="server" ControlToValidate="txtAddress1" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" Text="* This field is required" ErrorMessage="Error:Address 1 Field is Blank"></asp:RequiredFieldValidator>
                </asp:TableCell>
                 
                <%--</asp:TableRow>

            <br />
            <br />
            <asp:TableRow>--%>
                <asp:TableCell>
                    <asp:Label ID="Label2" runat="server" Text="Address 2: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtAddress2" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <br />
            <br />
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="Label3" runat="server" Text="City: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCity" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" Text="* This field is required" ErrorMessage="Error: City Field is Blank"></asp:RequiredFieldValidator>
                </asp:TableCell>
            <%--</asp:TableRow>
            <br />
            <br />
            <asp:TableRow>--%>
                <asp:TableCell>
                    <asp:Label ID="Label4" runat="server" Text="State: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <%--<asp:TextBox ID="txtS" runat="server"></asp:TextBox>--%>
                    <asp:DropDownList ID="ddlStates" runat="server"></asp:DropDownList>
                </asp:TableCell>
            <%--</asp:TableRow>
            <br />
            <br />
            <asp:TableRow>--%>
                <asp:TableCell>
                    <asp:Label ID="Label5" runat="server" Text="ZIP Code: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtZip" runat="server"></asp:TextBox>
                    <asp:MaskedEditExtender ID="MaskedEditExtender2" runat="server" TargetControlID="txtZip"
            Mask="99999" MessageValidatorTip="true" ErrorTooltipEnabled="True" >
                    </asp:MaskedEditExtender>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtZip" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" Text="* This field is required" ErrorMessage="Error:Address 1 Field is Blank"></asp:RequiredFieldValidator>
                </asp:TableCell>

            </asp:TableRow>
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="Select CyberDay Date: "></asp:Label>
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
            <asp:Button ID="butInsert" runat="server" Text=" Register School " OnClick="ButInsert_Click" Message="Success! School Added." BorderStyle="Solid" style="color:#450084; border-color: #450084" />


        </fieldset>
    </div>
    <br />
  
    <asp:SqlDataSource runat="server"
        ID="dsEvent"
        ConnectionString="<%$ connectionStrings:lab4 %>"
        SelectCommand="Select * FROM Event" />
    <asp:SqlDataSource runat="server"
        ID="dsDay"
        ConnectionString="<%$ connectionStrings:lab4 %>"
        SelectCommand="Select [dayid], FORMAT ([date], 'dd-MM-yy') as [date] FROM [Day]" />

</asp:Content>
