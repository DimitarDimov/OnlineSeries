<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ActorControl.ascx.cs" Inherits="ActorControl" %>


<table style="width: 500px">
    <tr>
        <td>
            <asp:Label ID="ActorNameLabel" runat="server" ForeColor="Green" AssociatedControlID="ActorNameInput">Име:</asp:Label>
        </td>
        <td style="overflow: hidden; width: 180px; text-align: left;">
            <asp:TextBox runat="server" ID="ActorNameInput" />
            <asp:RequiredFieldValidator
                ID="RequiredFieldValidatorName"
                ErrorMessage="* Задължително поле"
                ControlToValidate="ActorNameInput"
                ForeColor="Red"
                Display="Dynamic"
                runat="server" />
        </td>
        <td>
            <asp:DropDownList ID="ActorGenderInput" runat="server" ForeColor="Green">
                <asp:ListItem Text="Мъж" Selected="True" />
                <asp:ListItem Text="Жена" />
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="ActorRoleLabel" runat="server" ForeColor="Green" AssociatedControlID="ActorRoleInput">Участва като:</asp:Label>
        </td>
        <td>
            <asp:TextBox runat="server" ID="ActorRoleInput" />
            <asp:RequiredFieldValidator
                ID="RequiredFieldValidatorActorRole"
                ErrorMessage="* Задължително поле"
                ControlToValidate="ActorRoleInput"
                ForeColor="Red"
                Display="Dynamic"
                runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="EpisodesLabel" runat="server" ForeColor="Green" AssociatedControlID="EpisodesInput">Брой епизоди:</asp:Label>
        </td>
        <td>
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
</table>
<br />
