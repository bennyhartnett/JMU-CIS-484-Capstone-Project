<%@ Page Title="" Language="C#" MasterPageFile="~/vol.master" AutoEventWireup="true" CodeBehind="Personnel.aspx.cs" Inherits="CapstoneFinal.Personnel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="nestedFirst" runat="server">

    <div>
        <fieldset style="margin:20px; padding:20px; display:inline" >
            <legend style="color:#450084; font-size:x-large;">Personnel</legend>
            <asp:DropDownList
                ID="ddlVolunteer"
                runat="server"
                DataSourceID="dsEventPersonnel"
                DataTextField="LastName"
                DataValueField="PersonnelID"
                AutoPostBack="true">
            </asp:DropDownList>
            <asp:Button
                ID="btnLoadPersonnel"
                runat="server"
                Text="Show Personnel's Events"
                OnClick="BtnPersonnelEvent" />
            <asp:Button ID="BtnShowAll" runat="server" Text="Show All Personnel' Events"
                OnClick="BtnShowAll_Click" />
        
        <br />
        <fieldset style="padding:10px; margin:10px;">
            <legend>Events for Selected Personnel: </legend>
            <asp:GridView
                runat="server"
                ID="grdOrderResults"
                AlternatingRowStyle-BackColor="#eaaaff"
                EmptyDataText="No Event Personnel Selected!"
                AutoGenerateColumns="false">


                <Columns>
                 
                 <asp:BoundField headertext=" Event Title " 
                    datafield="EventTitle" HtmlEncode="false" />
                 <asp:BoundField headertext="Start Time " DataFormatString="{0:hh\:mm}"
                    datafield="Time" HtmlEncode="false" />
                <asp:BoundField headertext="End Time " DataFormatString="{0:hh\:mm}"
                    datafield="End" HtmlEncode="false" />
                <asp:BoundField headertext=" First Name " 
                    datafield="FirstName" HtmlEncode="false" />
                <asp:BoundField headertext=" Last Name " 
                    datafield="LastName" HtmlEncode="false" />
                <asp:BoundField headertext=" Location " 
                    datafield="Location" HtmlEncode="false" />
                <asp:BoundField headertext=" Date " dataformatstring="{0:M-dd-yyyy}" 
                    datafield="Date" HtmlEncode="false" />
            </Columns>
            </asp:GridView>
        </fieldset>
            </fieldset>
    </div>
    <br />
    


    <asp:SqlDataSource runat="server"
        ID="dsEventPersonnel"
        ConnectionString="<%$ connectionStrings:lab4 %>"
        SelectCommand="SELECT * FROM EventPersonnel" />




</asp:Content>
