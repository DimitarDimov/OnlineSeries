<%@ Page Title="Validate and Add to DB" Language="C#" AutoEventWireup="true" MasterPageFile="~/OnlineSeries.Master" CodeFile="Transform.aspx.cs" Inherits="Upload" %>

<asp:Content ID="UploadContent" runat="server" ContentPlaceHolderID="MainContent">
    <div>
        <div style="height: 15px"></div>
        <asp:LinkButton ID="LinkButton1" Text="Връщане Назад" runat="server" PostBackUrl="~/Default.aspx" />
    </div>
    <div style="height: 60px"></div>
    <div class="form-group">
        <asp:Button id="inputButton"
                        text="Валидиране и добавяне."
                        ForeColor="Blue"
                        onClick="InputButton_OnClicked"
                        runat="server" />
        <br />
        <br />
        <br />
        <asp:Table ID="results" runat="server" CellPadding="20" Width="180px" Style="width:30%;" />
    </div>

</asp:Content>