<%@ Page Title="" Language="C#" MasterPageFile="~/coord.master" AutoEventWireup="true" CodeBehind="EditEvent.aspx.cs" Inherits="CapstoneFinal.EditEvent" %>
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
        DataKeyNames="EventID"
        AllowPaging = "true"
        PageSize ="15"
        AutoGenerateEditButton="true"
        
        AutoGenerateRows="false"
        PagerSettings-Mode="NumericFirstLast"
        EmptyDataText="No Events Found"
        runat="server">

        <Fields>
            <asp:BoundField DataField="EventID"
                HeaderText="Event ID"
                ReadOnly="true"
                InsertVisible="false" />
            <asp:BoundField DataField="EventTitle"
                HeaderText="Event Title" />
            
            <asp:BoundField headertext="Start Time " DataFormatString="{0:hh\:mm}"
                    datafield="Time" HtmlEncode="false" />
            <asp:BoundField headertext="End Time " DataFormatString="{0:hh\:mm}"
                    datafield="End" HtmlEncode="false" />
            <asp:BoundField DataField="Location"
                HeaderText="Location" />
            
        </Fields>
    </asp:DetailsView>
        </fieldset>
    <asp:SqlDataSource
        ID="srcEvents"
        ConnectionString="<%$ connectionStrings:lab4 %>"
        runat="server"
        SelectCommand="SELECT * FROM Event"
        FilterExpression="EventTitle like '%{0}%' OR Location like '%{0}%'"
        UpdateCommand="UPDATE Event SET EventTitle=@EventTitle, Time=@Time, [end]=@end Location=@Location  WHERE EventID=@EventID"
        DeleteCommand="DELETE Event WHERE EventID=@EventID">

        <FilterParameters>
            <asp:ControlParameter
                Name="FirstOrLastName"
                ControlID="tbSearch" />

        </FilterParameters>
    </asp:SqlDataSource>
    <br />
    <br />
</asp:Content>
