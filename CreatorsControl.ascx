<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CreatorsControl.ascx.cs" Inherits="CreatorsControl" %>

<table style="width: 500px">
    <tr>
        <td>
            <asp:Label ID="CreatorNameLabel" runat="server" ForeColor="Green" AssociatedControlID="CreatorNameInput">Име:</asp:Label>
        </td>
        <td style="overflow: hidden; width: 180px; text-align: left;">
            <asp:TextBox runat="server" ID="CreatorNameInput" />
            <asp:RequiredFieldValidator
                ID="RequiredFieldValidatorName"
                ErrorMessage="* Задължително поле"
                ControlToValidate="CreatorNameInput"
                ForeColor="Red"
                Display="Dynamic"
                runat="server" />
        </td>
        <td>
            <asp:DropDownList ID="CreatorGenderInput" runat="server" ForeColor="Green">
                <asp:ListItem Text="Мъж" Selected="True" />
                <asp:ListItem Text="Жена" />
            </asp:DropDownList>
        </td>
    </tr>
</table>
<br />
