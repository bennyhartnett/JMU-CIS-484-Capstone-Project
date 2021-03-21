<%@ Page Title="" Language="C#" MasterPageFile="~/first.master" AutoEventWireup="true" CodeBehind="Student1.aspx.cs" Inherits="CapstoneFinal.Student1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="nestedFirst" runat="server">
        <div>
   
        <br />
        <fieldset style="margin:20px; padding:20px; display:inline" >
            <legend style="color:#450084; font-size:x-large;">Student Registration </legend>
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
                    <asp:Label ID="lblAge" runat="server" Text="Age: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtAge" runat="server" Text=""></asp:TextBox>
                    <asp:Label ID="Label2" runat="server" Text="Gender: "></asp:Label>
                
                    <asp:TextBox ID="txtGender" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorAge" runat="server" ControlToValidate="txtAge" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" Text="* This field is required" ErrorMessage="Error: Age Field is Blank"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidatorAge" runat="server" ControlToValidate="txtAge" SetFocusOnError="false" Operator="DataTypeCheck" Type="Integer" ForeColor="Red" Text="Age must be a whole integer" ErrorMessage="Error: Please enter a whole number of years for age"></asp:CompareValidator>
                
                    
                </asp:TableCell>
           
            </asp:TableRow>
            <br />
            <br />
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblNotes" runat="server" Text="Notes: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtNotes" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            
            <br />
            <br />
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="Label6" runat="server" Text="Dietary Restrictions: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtDiet" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <br />
            <br />
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="Label7" runat="server" Text="Parent or Guardian's Full Name: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtParent" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label8" runat="server" Text="Parent or Guardian's Email Address: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <br />
            <br />
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="Label3" runat="server" Text="Please check this box if the student's parent will attend: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:CheckBox ID="CheckBox1" runat="server" />
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell>
                    <br />

                    <br />
                    <asp:Label ID="Label4" runat="server" Text="Teacher:"></asp:Label>
                    <br />
                </asp:TableCell>

                <asp:TableCell>

                    <asp:ListBox ID="teachers" runat="server"></asp:ListBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="* Required Field" ControlToValidate="teachers" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" Text="* This field is required"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
           
            
            
            <br />
            <br />

            
            
            <asp:TableCell>
                <asp:Label ID="Label5" runat="server" Text="Consent Form:"></asp:Label>
                <br />
            </asp:TableCell>

            <asp:TableCell>
                <asp:TableRow>
                <asp:TableCell>
       
                    <asp:Label ID="Label1" runat="server" Text="By checking this box, I consent to my child attending Cyberday and the public use of photographs of my child: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:CheckBox ID="CheckBox2" runat="server" />
               <asp:CustomValidator ID="CustomValidator1" runat="server" 
        ErrorMessage="Parental Consent Required. Please Check Box to Proceed." 
        onservervalidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
                </asp:TableCell>
                    </asp:TableRow>
                    </asp:TableCell>
            <br />
                

            
            <asp:Button ID="butClear" runat="server" Text=" Start Over " OnClick="ButClear_Click" CausesValidation="false" BorderStyle="Solid" style="color:red; border-color: #450084"/>
            <asp:Button ID="butInsert" runat="server" Text=" Register Student " OnClick="ButInsert_Click" Message="Success! Student Added." BorderStyle="Solid" style="color:#450084; border-color: #450084"/>

        </fieldset>
    </div>
    <br />
    
    <asp:SqlDataSource runat="server"
        ID="dsEvent"
        ConnectionString="<%$ connectionStrings:lab4 %>"
        SelectCommand="Select * FROM Event" />

</asp:Content>
