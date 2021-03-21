<%@ Page Title="" Language="C#" MasterPageFile="~/vol.master" AutoEventWireup="true" CodeBehind="VolunteerEvent.aspx.cs" Inherits="CapstoneFinal.VolunteerEvent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="nestedFirst" runat="server">
    <br />
    <br />
    <fieldset style="margin:20px; padding:20px; display:inline" >
            <legend style="color:#450084; font-size:x-large;">Volunteer for an Event </legend>
                
                <br />
                <asp:Label ID="lblEvent" runat="server" Text="Select an Event:"></asp:Label>
                <asp:DropDownList ID="ddlEvent" runat="server" DataSourceID="dtasrcEvent" DataTextField="Event" DataValueField="EventID"></asp:DropDownList>
                <br />
                <br />
                <asp:Button ID="btnVolEvent" runat="server" Text=" Sign Up for this Event " OnClick="btnVolEvent_Click" style="align-self:center;"/>
                <asp:Label ID="lblUpdate" runat="server" Text=""></asp:Label>
                <br />
                
                <asp:GridView ID="gvVol" runat="server"
                    BackColor="White" BorderColor="Black" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                    <%--Theme Properties--%>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="true" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <RowStyle ForeColor="#000066" />
                </asp:GridView>
            </fieldset>

    <%--<asp:SqlDataSource runat="server"
            ID="dtasrcVolunteer"
        ConnectionString="<%$ ConnectionStrings:lab4 %>"
            SelectCommand="Select PersonnelID, (FirstName + ' ' + LastName) as Name
            from EventPersonnel WHERE PersonnelType = 'Volunteer' Order By PersonnelID ASC" />--%>

    <asp:SqlDataSource runat="server"
            ID="dtasrcEvent"
        ConnectionString="<%$ ConnectionStrings:lab4 %>"
            SelectCommand="Select EventID, (EventTitle) as Event from Event Order By EventID" />



</asp:Content>
