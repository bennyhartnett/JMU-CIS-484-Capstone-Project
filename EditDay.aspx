<%@ Page Title="" Language="C#" MasterPageFile="~/coord.master" AutoEventWireup="true" CodeBehind="EditDay.aspx.cs" Inherits="CapstoneFinal.EditDay" %>
<asp:Content ID="Content1" ContentPlaceHolderID="nestedFirst" runat="server">
    <fieldset style="margin:20px; padding:20px; display:inline" >
            <legend style="color:#450084; font-size:x-large;">View/Edit Event</legend>
    <asp:Label ID="lbSearch" runat="server" Text="Search:"></asp:Label>

    <asp:TextBox ID="tbSearch" runat="server"></asp:TextBox>

    <asp:Button ID="searchB" runat="server" Text="Search" OnClick="Search_Click" />
    <br />
    <br />
    <asp:DetailsView ID="dvStudent" Height="400px" Width="200px"
        DataSourceID="srcEvents"
        DataKeyNames="dayID"
        AllowPaging = "true"
        PageSize ="15"
        AutoGenerateEditButton="true"
        
        AutoGenerateRows="false"
        PagerSettings-Mode="NumericFirstLast"
        EmptyDataText="No CyberDays Found"
        runat="server">

        <Fields>
            <asp:BoundField DataField="dayID"
                HeaderText="CyberDay ID"
                ReadOnly="true"
                InsertVisible="false" />
            <asp:BoundField DataField="Title"
                HeaderText="Title" />
            <asp:BoundField headertext=" Date " dataformatstring="{0:M-dd-yyyy}" 
                    datafield="Date" HtmlEncode="false" />
            
           
        </Fields>
    </asp:DetailsView>
        </fieldset>
    <asp:SqlDataSource
        ID="srcEvents"
        ConnectionString="<%$ connectionStrings:lab4 %>"
        runat="server"
        SelectCommand="SELECT * FROM [day]"
        FilterExpression="Title like '%{0}%' OR [date] like '%{0}%'"
        UpdateCommand="UPDATE [day] SET Title=@Title, [Date]=@Date,  WHERE dayID=@dayID"
        DeleteCommand="DELETE [day] WHERE dayID=@dayID">

        <FilterParameters>
            <asp:ControlParameter
                Name="FirstOrLastName"
                ControlID="tbSearch" />

        </FilterParameters>
    </asp:SqlDataSource>
    <br />
    <br />
</asp:Content>
