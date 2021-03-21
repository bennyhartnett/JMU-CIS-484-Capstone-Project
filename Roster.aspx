<%@ Page Title="" Language="C#" MasterPageFile="~/teacher.master" AutoEventWireup="true" CodeBehind="Roster.aspx.cs" Inherits="CapstoneFinal.Roster" %>
<asp:Content ID="Content1" ContentPlaceHolderID="nestedFirst" runat="server">
     <fieldset style="margin:20px; padding:20px; display:inline" >
            <legend style="color:#450084; font-size:x-large;">My Student Roster</legend>
                
                <br />
                <%--<asp:Label ID="lblRoster" runat="server" Text="Select a Roster:"></asp:Label>--%>
                <%--<asp:DropDownList ID="ddlChoice" runat="server">
                    <asp:ListItem Selected="True" Value="Students - Teacher Checked">Students - Teacher Checked</asp:ListItem>
                    <asp:ListItem Value="Students - Teacher Unchecked">Students - Teacher Unchecked</asp:ListItem>
                </asp:DropDownList>--%>
                <asp:Button ID="btnTC" runat="server" Text="Students - Teacher Unchecked" OnClick="btnTC_Click" />
                <asp:Button ID="btnTU" runat="server" Text="Students - Teacher Checked" OnClick="btnTU_Click" />
                <asp:Button ID="btnAll" runat="server" Text="All Students" OnClick="btnAll_Click" />
                <br />
                <br />
                <asp:Label ID="lblUpdate" runat="server" Text=""></asp:Label>
                <br />
        

                <asp:GridView ID="gvStudent" runat="server" 
        AutoGenerateColumns="false" AutoGenerateEditButton="true" EnableModelValidation="true"
        BackColor="White" BorderColor="Gold" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
        HeaderStyle-BackColor="Purple" HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="White" PagerStyle-HorizontalAlign="Center"
        OnRowEditing="gvStudent_RowEditing" OnRowUpdating="gvStudent_RowUpdating" OnRowCancelingEdit="gvStudent_RowCancelingEdit" >

                    <Columns>
            <asp:BoundField DataField="StudentID"
                HeaderText="Student ID"
                ReadOnly="true"
                InsertVisible="false" />
            <asp:BoundField DataField="FirstName"
                HeaderText="First Name"
                ReadOnly="true"
                InsertVisible="false" />
            <asp:BoundField DataField="LastName"
                HeaderText="Last Name"
                ReadOnly="true"
                InsertVisible="false" />
            <asp:BoundField DataField="Age"
                HeaderText="Age"
                ReadOnly="false"
                InsertVisible="false" />
            <asp:CheckBoxField DataField="ParentComing" HeaderText="Parent Attending?" InsertVisible="false" />
            <asp:CheckBoxField DataField="Permission" HeaderText="Parental Consent?" InsertVisible="false" />
            <asp:CheckBoxField DataField="TCheck" HeaderText="Added to Trip Roster?" InsertVisible="true"  />
                    </Columns>        
                </asp:GridView>
                   
     </fieldset>
</asp:Content>
