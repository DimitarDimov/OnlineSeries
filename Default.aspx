<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/OnlineSeries.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div style="height: 30px"></div>
    <div class ="jumbotron">
        <div style="height: 40px"></div>
        <asp:Button id="uploadButton"
                    text="Валидиране и добавяне в БД"
                    ForeColor="Black"
                    class="btn btn-primary btn-lg"
                    postBackUrl="Transform.aspx"
                    runat="server" Width="450px"/>
        <br />
        <div style="height: 30px"></div>
        <asp:Button id="inputButton"
                    text="Попълване на форма."
                    ForeColor="Black"
                    class="btn btn-primary btn-lg"
                    postBackUrl="FillForm.aspx"
                    runat="server" Width="450px"/>
        <br />
        <br />
        
       
    </div>

</asp:Content>

