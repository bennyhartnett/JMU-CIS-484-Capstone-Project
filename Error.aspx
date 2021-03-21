<%@ Page Title="" Language="C#" MasterPageFile="~/first.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="CapstoneFinal.Error" %>
<asp:Content ID="Content1" ContentPlaceHolderID="nestedFirst" runat="server">
        <asp:ScriptManager 
            ID="ScriptManager1"
            runat="server"
            >
        </asp:ScriptManager>

    
        <fieldset style="margin:20px; padding:20px; display:inline" >
            <legend style="color:#450084; font-size:x-large;">Incorrect Data Format</legend>
     
    
    <br />
    <p>The values you inserted are not valid. Please ensure that the fields you are modifying stay the same datatype.</p>
    <p>You will be redirected in 5 seconds to the homepage...</p>

    <asp:Timer ID="Timer1" runat="server"
        Interval="5000"
        OnTick="Timer1_Tick">
    </asp:Timer>
    <br />

    

            </fieldset>
</asp:Content>
