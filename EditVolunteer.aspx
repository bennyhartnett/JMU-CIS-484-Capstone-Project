<%@ Page Title="" Language="C#" MasterPageFile="~/coord.master" AutoEventWireup="true" CodeBehind="EditVolunteer.aspx.cs" Inherits="CapstoneFinal.EditVolunteer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="nestedFirst" runat="server">
    <fieldset style="margin:20px; padding:20px; display:inline" >
            <legend style="color:#450084; font-size:x-large;">View/Edit Personnel </legend>
    <asp:Label ID="lbSearch" runat="server" Text="Search:"></asp:Label>
    <asp:TextBox ID="tbSearch" runat="server"></asp:TextBox>

    <asp:Button ID="searchB" runat="server" Text="Search" OnClick="searchB_Click" />
    <br />
    <br />
    <asp:DetailsView ID="dvVolunteer" Height="400px" Width="200px"
        DataSourceID="srcVolunteer"
        DataKeyNames="PersonnelID"
        AllowPaging = "true"
        PageSize ="15"
        AutoGenerateEditButton="true"
        AutoGenerateRows="false"
        PagerSettings-Mode="NumericFirstLast"
        EmptyDataText="No Personnel Found"
        runat="server">

        <Fields>
            <asp:BoundField DataField="PersonnelID"
                HeaderText="Personnel ID"
                ReadOnly="true"
                InsertVisible="false" />
            <asp:BoundField DataField="FirstName"
                HeaderText="First Name" />
            <asp:BoundField DataField="LastName"
                HeaderText="Last Name" />
            <asp:BoundField DataField="EmailAddress"
                HeaderText="Email" />
            <asp:BoundField DataField="PhoneNumber"
                HeaderText="Phone Number" />
            <asp:BoundField DataField="PersonnelType"
                HeaderText="Personnel Type" />
            <asp:BoundField DataField="ShirtInfoID"
                HeaderText="Shirt Type" />
            

        </Fields>
    </asp:DetailsView>
</fieldset>
    <asp:SqlDataSource
        ID="srcVolunteer"
        ConnectionString="<%$ connectionStrings:lab4 %>"
        runat="server"
        SelectCommand="SELECT * FROM EventPersonnel WHERE PersonnelType='Volunteer'"
        FilterExpression="firstName like '%{0}%' OR lastName like '%{0}%'"
        UpdateCommand="UPDATE EventPersonnel SET FirstName=@FirstName, LastName=@LastName, EmailAddress=@EmailAddress, PhoneNumber=@PhoneNumber, PersonnelType=@PersonnelType, ShirtInfoID=@ShirtInfoID WHERE PersonnelID=@PersonnelID"
        DeleteCommand="DELETE EventPersonnel WHERE PersonnelID=@PersonnelID">

        <FilterParameters>
            <asp:ControlParameter
                Name="FirstOrLastName"
                ControlID="tbSearch" />

        </FilterParameters>
    </asp:SqlDataSource>
    <br />
    <br />

</asp:Content>
