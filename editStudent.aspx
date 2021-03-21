<%@ Page Title="" Language="C#" MasterPageFile="~/coord.master" AutoEventWireup="true" CodeBehind="editStudent.aspx.cs" Inherits="CapstoneFinal.editStudent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="nestedFirst" runat="server">
    <fieldset style="margin:20px; padding:20px; display:inline" >
            <legend style="color:#450084; font-size:x-large;"> View/Edit Student </legend>
    <asp:Label ID="lbSearch" runat="server" Text="Search:"></asp:Label>

    <asp:TextBox ID="tbSearch" runat="server"></asp:TextBox>

    <asp:Button ID="searchB" runat="server" Text="Search" OnClick="Search_Click" />
    <br />
    <br />
    <asp:DetailsView ID="dvStudent" Height="400px" Width="200px"
        DataSourceID="srcStudents"
        DataKeyNames="StudentID"
        AllowPaging="true"
        PageSize ="15"
        AutoGenerateEditButton="true"
       
        AutoGenerateRows="false"
        PagerSettings-Mode="NumericFirstLast"
        EmptyDataText="No Students Found"
        runat="server">

        <Fields>
            <asp:BoundField DataField="StudentID"
                HeaderText="Student ID"
                ReadOnly="true"
                InsertVisible="false" />
            <asp:BoundField DataField="FirstName"
                HeaderText="First Name" />
            <asp:BoundField DataField="LastName"
                HeaderText="Last Name" />
            <asp:BoundField DataField="Age"
                HeaderText="Age" />
            <asp:BoundField DataField="Notes"
                HeaderText="Notes" />
            
            <asp:BoundField DataField="TeacherID"
                HeaderText="Teacher ID" />
            <asp:BoundField DataField="Gender"
                HeaderText="Gender" />
            <asp:BoundField DataField="Dietary"
                HeaderText="Dietary Restrictions" />
            <asp:BoundField DataField="ParentComing"
                HeaderText="Parent attending?" />
            <asp:BoundField DataField="Permission"
                HeaderText="Parental Consent?" />
            <asp:BoundField DataField="TCheck"
                HeaderText="Added to Trip Roster?" />
            <asp:BoundField DataField="ParentName"
                HeaderText="Parent Name" />
            <asp:BoundField DataField="ParentEmail"
                HeaderText="Parent Email" />
        </Fields>
    </asp:DetailsView>
        </fieldset>
    <asp:SqlDataSource
        ID="srcStudents"
        ConnectionString="<%$ connectionStrings:lab4 %>"
        runat="server"
        SelectCommand="SELECT * FROM Student"
        FilterExpression="firstName like '%{0}%' OR lastName like '%{0}%'"
        UpdateCommand="UPDATE Student SET FirstName=@FirstName, LastName=@LastName, Age=@Age, Notes=@Notes, TeacherID=@TeacherID, Gender=@Gender, Dietary=@Dietary, ParentComing=@ParentComing, Permission=@Permission, TCheck=@TCheck WHERE StudentID=@StudentID"
        DeleteCommand="DELETE Student WHERE StudentID=@StudentID">

        <FilterParameters>
            <asp:ControlParameter
                Name="FirstOrLastName"
                ControlID="tbSearch" />

        </FilterParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    

</asp:Content>
