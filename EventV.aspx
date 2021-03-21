<%@ Page Title="" Language="C#" MasterPageFile="~/vol.master" AutoEventWireup="true" CodeBehind="EventV.aspx.cs" Inherits="CapstoneFinal.EventV" %>
<asp:Content ID="Content1" ContentPlaceHolderID="nestedFirst" runat="server">
    <fieldset style="margin:20px; padding:20px; display:inline;" >
            <legend style="color:#450084; font-size:x-large;">Event Information</legend>
    
        <label>Select Event: </label>
        <asp:DropDownList
            ID="ddlEvent"
            runat="server"
            DataSourceID="dsEvent"
            DataTextField="EventTitle"
            DataValueField="EventID"
            AutoPostBack="true">
        </asp:DropDownList>
        <asp:Button
            ID="btnEventpresent"
            runat="server"
            Text="Show Selected Event's Presenters"
            OnClick="BtnEventPresent" />
        <asp:Button
            ID="btnEventAttend"
            runat="server"
            Text="Show Selected Event's Attendents "
            OnClick="BtnEventAttend" />
    
    <br />
    <fieldset style="padding:10px; display:inline;">
        <legend id="legendEvent">People: </legend>
        <asp:GridView
            runat="server"
            ID="grdOrderResults"
            AlternatingRowStyle-BackColor="#eaaaff"
            EmptyDataText="No People Found!"
            AutoGenerateColumns="false"
            >

            <Columns>
                 
                 <asp:BoundField headertext=" Event Title " 
                    datafield="Event" HtmlEncode="false" />
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
    <br />
    

    <asp:SqlDataSource runat="server"
        ID="dsEvent"
        ConnectionString="<%$ connectionStrings:lab4 %>"
        SelectCommand="SELECT * FROM Event" />
</asp:Content>
