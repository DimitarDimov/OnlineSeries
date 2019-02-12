<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WriterControl.ascx.cs" Inherits="WriterControl" %>

<table style="width: 500px">
    <tr>
        <td>
            <asp:Label ID="WriterNameLabel" runat="server" ForeColor="Green" AssociatedControlID="WriterNameInput">Име:</asp:Label>
        </td>
        <td style="overflow: hidden; width: 280px; text-align: left;">
            <asp:TextBox runat="server" ID="WriterNameInput" />
            <asp:RequiredFieldValidator
                ID="RequiredFieldValidatorName"
                ErrorMessage="* Задължително поле"
                ControlToValidate="WriterNameInput"
                ForeColor="Red"
                Display="Dynamic"
                runat="server" />
        </td>
        <td>
            <asp:DropDownList ID="WriterGenderInput" runat="server" ForeColor="Green">
                <asp:ListItem Text="Мъж" Selected="True" />
                <asp:ListItem Text="Жена" />
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="EpisodesLabel" runat="server" ForeColor="Green" AssociatedControlID="EpisodesInput">Брой епизоди:</asp:Label>
        </td>
        <td style="overflow: hidden; width: 180px; text-align: left;">
            <asp:TextBox runat="server" ID="EpisodesInput" />
            <asp:RequiredFieldValidator
                ID="RequiredFieldValidator1"
                ErrorMessage="* Задължително поле"
                ControlToValidate="EpisodesInput"
                ForeColor="Red"
                Display="Dynamic"
                runat="server" />
        </td>
    </tr>
    
    <tr>
       
       <td>
            <asp:Label ID="YearDurationLabel" runat="server" ForeColor="Green" AssociatedControlID="FromInput">Работно времетраене в години:</asp:Label>
        </td>
        <td>
            <asp:TextBox runat="server" ID="FromInput" style="width: 100px;"/>
            <asp:Label ID="DashLabel" runat="server"> - </asp:Label>
            <asp:TextBox runat="server" ID="ToInput" style="width: 100px;"/>
            <asp:RequiredFieldValidator
                ID="RequiredFieldValidatorFromInput"
                ErrorMessage="* Задължително поле"
                ControlToValidate="FromInput"
                ForeColor="Red"
                Display="Dynamic"
                runat="server" />
            <asp:RequiredFieldValidator
                ID="RequiredFieldValidatorToInput"
                ErrorMessage="* Задължително поле"
                ControlToValidate="ToInput"
                ForeColor="Red"
                Display="Dynamic"
                runat="server" />
        </td>
    </tr>
</table>
<br />
