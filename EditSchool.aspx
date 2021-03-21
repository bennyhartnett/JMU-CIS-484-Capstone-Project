<%@ Page Title="" Language="C#" MasterPageFile="~/coord.master" AutoEventWireup="true" CodeBehind="EditSchool.aspx.cs" Inherits="CapstoneFinal.EditSchool" %>
<asp:Content ID="Content1" ContentPlaceHolderID="nestedFirst" runat="server">
    <fieldset style="margin:20px; padding:20px; display:inline" >
            <legend style="color:#450084; font-size:x-large;">View/Edit School</legend>
    <asp:Label ID="lbSearch" runat="server" Text="Search:"></asp:Label>

    <asp:TextBox ID="tbSearch" runat="server"></asp:TextBox>

    <asp:Button ID="searchB" runat="server" Text="Search" OnClick="Search_Click" />
    <br />
    <br />
    <asp:DetailsView ID="dvSchool" Height="400px" Width="200px"
        DataSourceID="srcSchools"
        DataKeyNames="SchoolID"
        AllowPaging = "true"
        PageSize ="15"
        AutoGenerateEditButton="true"
        
        AutoGenerateRows="false"
        PagerSettings-Mode="NumericFirstLast"
        EmptyDataText="No Events Found"
        runat="server">

        <Fields>
            <asp:BoundField DataField="SchoolID"
                HeaderText="School ID"
                ReadOnly="true"
                InsertVisible="false" />
            <asp:BoundField DataField="Name"
                HeaderText="School Name" />
            <asp:BoundField DataField="PrimaryContactName"
                HeaderText="Primary Contact Name" />
            <asp:BoundField DataField="PhoneNumber"
                HeaderText="Phone Number" />
            <asp:BoundField DataField="Address1"
                HeaderText="Address 1" />
            <asp:BoundField DataField="Address2"
                HeaderText="Address 2" />
            <asp:BoundField DataField="City"
                HeaderText="City" />
            <asp:BoundField DataField="State"
                HeaderText="State" />
            <asp:BoundField DataField="Zip"
                HeaderText="ZIP Code" />


            
        </Fields>
    </asp:DetailsView>
        </fieldset>
    <asp:SqlDataSource
        ID="srcSchools"
        ConnectionString="<%$ connectionStrings:lab4 %>"
        runat="server"
        SelectCommand="SELECT * FROM School"
        FilterExpression="Name like '%{0}%' OR PrimaryContactName like '%{0}%'"
        UpdateCommand="UPDATE School SET Name=@Name, PhoneNumber=@PhoneNumber, PrimaryContactName=@PrimaryContactName, Address1=@Address1, Address2=@Address2, City=@City, State=@State, Zip=@Zip  WHERE SchoolID=@SchoolID"
        DeleteCommand="DELETE School WHERE SchoolID=@SchoolID">

        <FilterParameters>
            <asp:ControlParameter
                Name="FirstOrLastName"
                ControlID="tbSearch" />

        </FilterParameters>
    </asp:SqlDataSource>
    <br />
    <br />

</asp:Content>
