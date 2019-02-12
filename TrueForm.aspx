<%@ Page Title="True Form" Language="C#" AutoEventWireup="true" MasterPageFile="~/OnlineSeries.Master" CodeFile="TrueForm.aspx.cs" Inherits="SuccessfulInput" %>

<asp:Content ID="SuccessfulInputContent" runat="server" ContentPlaceHolderID="MainContent">
    <br />
    <div style="height: 15px"></div>
    <div>
        <asp:LinkButton ID="BackButton" Text="Връщане Назад" runat="server" PostBackUrl="~/FillForm.aspx" />
    </div>
    <div class="jumbotron">

        Данните бяха съхранени в базата от данни!
    </div>

</asp:Content>