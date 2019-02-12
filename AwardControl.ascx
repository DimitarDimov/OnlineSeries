<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AwardControl.ascx.cs" Inherits="AwardControl" %>

<table style="width: 500px">
    <tr>
        <td>
            <asp:Label ID="AwardNameLabel" runat="server" ForeColor="Green" AssociatedControlID="AwardNameInput">Наименование:</asp:Label>
        </td>
        <td>
            <asp:TextBox runat="server" ID="AwardNameInput" />
            <asp:RequiredFieldValidator
                ID="RequiredFieldValidatorName"
                ErrorMessage="* Задължително поле"
                ControlToValidate="AwardNameInput"
                ForeColor="Red"
                Display="Dynamic"
                runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="AwardYearLabel" runat="server" ForeColor="Green" AssociatedControlID="AwardYearInput">Година:</asp:Label>
        </td>
        <td>
            <asp:TextBox runat="server" ID="AwardYearInput" />
            <asp:RequiredFieldValidator
                ID="RequiredFieldValidatorActorRole"
                ErrorMessage="* Задължително поле"
                ControlToValidate="AwardYearInput"
                ForeColor="Red"
                Display="Dynamic"
                runat="server" />
            <asp:CompareValidator
                runat="server"
                ControlToValidate="AwardYearInput"
                Operator="GreaterThanEqual"
                Type="Integer"
                ValueToCompare="1900"
                ForeColor="Red"
                Display="Dynamic"
                ErrorMessage="* Стойността трябва да e цяло положително число." />
        </td>
    </tr>
    <tr>
         <td style="vertical-align:top">
            <asp:Label ID="AwardCategoriesLabel" runat="server" ForeColor="Green" AssociatedControlID="AwardCategoriesUpdatePanel">Категория:</asp:Label>
        </td>
        <td>
            <asp:UpdatePanel ID="AwardCategoriesUpdatePanel" runat="server" style="width: 230px">
                <ContentTemplate>
                    <asp:Panel runat="server" ID="AwardCategoryPanel" />
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="AddCategoryButton" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
            <br />
            <asp:Button ID="AddCategoryButton" runat="server" ForeColor="Green" Text="Добави категория" OnClick="AddCategoryButton_Click"
                CausesValidation="false" />
        </td>
    </tr>
</table>
<br />
