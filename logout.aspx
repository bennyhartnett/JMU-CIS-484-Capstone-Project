﻿<%@ Page Title="" Language="C#" MasterPageFile="~/first.master" AutoEventWireup="true" CodeBehind="logout.aspx.cs" Inherits="CapstoneFinal.logout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="nestedFirst" runat="server">
    <asp:ScriptManager 
            ID="ScriptManager1"
            runat="server"
            >
        </asp:ScriptManager>
    <div style="text-align:center;  margin:auto;">
        <br />
        <br />
        <fieldset style="width:400px; margin:auto; border-color: #AD9C65">
            <legend style="color:#450084; font-size:x-large;">Logged Out</legend>
            
            <br />
            <asp:Label ID="lblCode" runat="server" Text="Success! User Logged Out" style="color:#450084; font-size:larger;"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="Redirecting to Sign In Page..."></asp:Label>
            <asp:Timer ID="Timer1" runat="server"
                Interval="2500"
                OnTick="Timer1_Tick">
            </asp:Timer>
            <br />
            <br />
        </fieldset>
        <br />
        

    </div>


</asp:Content>
