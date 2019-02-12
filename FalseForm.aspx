<%@ Page Title="False Form" Language="C#" MasterPageFile="~/OnlineSeries.Master" AutoEventWireup="true" CodeFile="FalseForm.aspx.cs" Inherits="UnSuccessfulInput" %>

<asp:Content ID="UnSuccessfulInputContent" runat="server" ContentPlaceHolderID="MainContent">
    <br />
    <div style="height: 15px"></div>
    <div>
        <asp:LinkButton ID="BackButton" Text="Връщане Назад" runat="server" PostBackUrl="~/FillForm.aspx" />
    </div>
    <div class="jumbotron">
        Данните не са валидни!
        <br />
    </div>
</asp:Content>