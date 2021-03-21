<%@ Page Title="" Language="C#" MasterPageFile="~/coord.master" AutoEventWireup="true" CodeBehind="editTeacher.aspx.cs" Inherits="CapstoneFinal.editTeacher" %>
<asp:Content ID="Content1" ContentPlaceHolderID="nestedFirst" runat="server">
    <fieldset style="margin:20px; padding:20px; display:inline" >
            <legend style="color:#450084; font-size:x-large;">View/Edit Teacher </legend>
    <asp:Label ID="lbSearch" runat="server" Text="Search:"></asp:Label>

    <asp:TextBox ID="tbSearch" runat="server"></asp:TextBox>

    <asp:Button ID="searchB" runat="server" Text="Search" OnClick="Search_Click" />
    <br />
    <br />
    <asp:DetailsView ID="dvStudent" Height="400px" Width="200px"
        DataSourceID="srcTeachers"
        DataKeyNames="TeacherID"
        AllowPaging = "true"
        PageSize ="15"
        AutoGenerateEditButton="true"
        AutoGenerateRows="false"
        PagerSettings-Mode="NumericFirstLast"
        EmptyDataText="No Teachers Found"
        runat="server">

        <Fields>
            <asp:BoundField DataField="TeacherID"
                HeaderText="Teacher ID"
                ReadOnly="true"
                InsertVisible="false" />
            <asp:BoundField DataField="FirstName"
                HeaderText="First Name" />
            <asp:BoundField DataField="LastName"
                HeaderText="Last Name" />
            <asp:BoundField DataField="EmailAddress"
                HeaderText="Email" />

            
            <asp:BoundField DataField="Grade"
                HeaderText="Grade" />

        </Fields>
    </asp:DetailsView>
        </fieldset>
    <asp:SqlDataSource
        ID="srcTeachers"
        ConnectionString="<%$ connectionStrings:lab4 %>"
        runat="server"
        SelectCommand="SELECT * FROM Teacher"
        FilterExpression="firstName like '%{0}%' OR lastName like '%{0}%'"
        UpdateCommand="UPDATE Teacher SET FirstName=@FirstName, LastName=@LastName, EmailAddress=@EmailAddress,   Grade=@Grade WHERE TeacherID=@TeacherID"
        DeleteCommand="DELETE Teacher WHERE TeacherID=@TeacherID">

        <FilterParameters>
            <asp:ControlParameter
                Name="FirstOrLastName"
                ControlID="tbSearch" />

        </FilterParameters>
    </asp:SqlDataSource>
    <br />
    <br />
</asp:Content>
