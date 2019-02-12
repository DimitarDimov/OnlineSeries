<%@ Page Title="Fill Form" Language="C#" AutoEventWireup="true" MasterPageFile="~/OnlineSeries.Master" CodeFile="FillForm.aspx.cs" Inherits="Input" %>

<%@ Register TagPrefix="custom" TagName="CreatorsControl" Src="~/CreatorsControl.ascx" %>
<%@ Register TagPrefix="custom" TagName="WriterControl" Src="~/WriterControl.ascx" %>
<%@ Register TagPrefix="custom" TagName="ActorControl" Src="~/ActorControl.ascx" %>
<%@ Register TagPrefix="custom" TagName="AwardControl" Src="~/AwardControl.ascx" %>

<asp:Content ID="InputContent" runat="server" ContentPlaceHolderID="MainContent">
    <br />
    <br />
    <div runat="server" id="div">
        <fieldset>
            <legend>Обща информация</legend>
            <table>
                <tr>
                    <td>
                        <asp:Label ID="TitleLabel" runat="server"  ForeColor="Green" AssociatedControlID="TitleInput">Име на филма: 
                           
                        </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="TitleInput" />
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidatorTitle"
                            ErrorMessage="* Задължително поле"
                            ControlToValidate="TitleInput"
                            ForeColor="Red"
                            Display="Dynamic"
                            runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="CountryLabel" runat="server" ForeColor="Green" AssociatedControlID="CountryInput">Държава: </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="CountryInput" />
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidatorCountry"
                            ErrorMessage="* Задължително поле"
                            ControlToValidate="CountryInput"
                            ForeColor="Red"
                            Display="Dynamic"
                            runat="server" />
                        <asp:RegularExpressionValidator
                            ID="AlphabetValidator" runat="server"
                            ControlToValidate="CountryInput"
                            ErrorMessage="* Въвеждането трябва да бъде на кирилица!"
                            ValidationExpression="^[A-Zа-яА-Я.\s]{1,50}$" 
                            ForeColor="Red"
                            Display="Dynamic"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="NumberOfSeasonsLabel" runat="server" ForeColor="Green" AssociatedControlID="NumberOfSeasonsInput">Брой сезони: </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="NumberOfSeasonsInput" />
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidatorNumberOfSeasons"
                            ErrorMessage="* Задължително поле"
                            ControlToValidate="NumberOfSeasonsInput"
                            ForeColor="Red"
                            Display="Dynamic"
                            runat="server" />
                        <asp:CompareValidator
                            runat="server"
                            ControlToValidate="NumberOfSeasonsInput"
                            Operator="GreaterThanEqual"
                            Type="Integer"
                            ValueToCompare="0"
                            ForeColor="Red"
                            Display="Dynamic"
                            ErrorMessage="* Стойността трябва да e цяло неотрицателно число." />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="NumberOfEpisodesLabel" runat="server" ForeColor="Green" AssociatedControlID="NumberOfEpisodesInput">Брой части:</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="NumberOfEpisodesInput" />
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidatorNumberOfEpisodes"
                            ErrorMessage="* Задължително поле"
                            ControlToValidate="NumberOfEpisodesInput"
                            ForeColor="Red"
                            Display="Dynamic"
                            runat="server" />
                        <asp:CompareValidator
                            runat="server"
                            ControlToValidate="NumberOfEpisodesInput"
                            Operator="GreaterThanEqual"
                            Type="Integer"
                            ValueToCompare="1"
                            ForeColor="Red"
                            Display="Dynamic"
                            ErrorMessage="* Стойността трябва да e цяло положително число." />
                    </td>
                </tr>
                <tr>
                    <td>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="RunningTimeLabel" runat="server" ForeColor="Green" AssociatedControlID="RunningTimeInput">Продължителност:</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="RunningTimeInput" />
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidatorRunningTime"
                            ErrorMessage="* Задължително поле"
                            ControlToValidate="RunningTimeInput"
                            ForeColor="Red"
                            Display="Dynamic"
                            runat="server" />
                        <asp:CompareValidator
                            runat="server"
                            ControlToValidate="RunningTimeInput"
                            Operator="GreaterThanEqual"
                            Type="Double"
                            ValueToCompare="1"
                            ForeColor="Red"
                            Display="Dynamic"
                            ErrorMessage="* Стойността трябва да e положително число." />
                        <asp:DropDownList ID="RunningTimeFormatInput" runat="server" ForeColor="Green">
                            <asp:ListItem Text="Минути" Selected="True" />
                            <asp:ListItem Text="Часове" />
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="ReleaseDateLabel" ForeColor="Green" runat="server" AssociatedControlID="ReleaseDateInput">Начална дата: </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="ReleaseDateInput" />
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidatorReleaseDate"
                            ErrorMessage="* Задължително поле"
                            ControlToValidate="ReleaseDateInput"
                            ForeColor="Red"
                            Display="Dynamic"
                            runat="server" />
                        <asp:RegularExpressionValidator
                            ID="dateValidator" runat="server"
                            ControlToValidate="ReleaseDateInput"
                            ErrorMessage="* Датата трябва да е във формат (дд/мм/гггг)"
                            ValidationExpression="^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d$" 
                            ForeColor="Red"
                            Display="Dynamic"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="EndDateLabel" runat="server" ForeColor="Green" AssociatedControlID="EndDateInput">Крайна дата: </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="EndDateInput" />
                        <asp:RegularExpressionValidator
                            ID="RegularExpressionValidator1" runat="server"
                            ControlToValidate="EndDateInput"
                            ErrorMessage="* Датата трябва да е във формат (дд/мм/гггг)"
                            ValidationExpression="^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d$" 
                            ForeColor="Red"
                            Display="Dynamic"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="ImdbRatingLabel" runat="server" ForeColor="Green" AssociatedControlID="ImdbRatingInput">Рейтинг:</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="ImdbRatingInput" />
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidatorImdbRating"
                            ErrorMessage="* Задължително поле"
                            ControlToValidate="ImdbRatingInput"
                            ForeColor="Red"
                            Display="Dynamic"
                            runat="server" />
                        <asp:RangeValidator
                            runat="server"
                            ControlToValidate="ImdbRatingInput"
                            Type="Double"
                            MinimumValue="0"
                            MaximumValue="10"
                            ForeColor="Red"
                            Display="Dynamic"
                            ErrorMessage="* Стойността трябва да e в интервала 0-10." />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="ImdbRatingVotesLabel" runat="server" ForeColor="Green" AssociatedControlID="ImdbRatingVotesInput">Брой гласове:</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="ImdbRatingVotesInput" />
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidatorImdbRatingVotes"
                            ErrorMessage="* Задължително поле"
                            ControlToValidate="ImdbRatingVotesInput"
                            ForeColor="Red"
                            Display="Dynamic"
                            runat="server" />
                        <asp:CompareValidator
                            runat="server"
                            ControlToValidate="ImdbRatingVotesInput"
                            Operator="GreaterThanEqual"
                            Type="Integer"
                            ValueToCompare="1"
                            ForeColor="Red"
                            Display="Dynamic"
                            ErrorMessage="* Стойността трябва да e цяло положително число." />
                    </td>
                </tr>
                <tr>
                    <td>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="DescriptionLabel" runat="server" ForeColor="Green" AssociatedControlID="DescriptionInput">Резюме:</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="DescriptionInput" TextMode="multiline" Columns="50" Rows="2" runat="server" />
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidatorDescription"
                            ErrorMessage="* Задължително поле"
                            ControlToValidate="DescriptionInput"
                            ForeColor="Red"
                            Display="Dynamic"
                            runat="server" />
                        
                    </td>
                </tr>
            </table>
        </fieldset>
        <br />
        <fieldset>
            <legend>Уебсайт</legend>
            <table>
                 <tr>
                    <td>
                        <asp:Label ID="WebsiteNameLabel" runat="server" ForeColor="Green" AssociatedControlID="WebsiteNameInput">Име на сайта: </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="WebsiteNameInput" />
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidatorWebsiteName"
                            ErrorMessage="* Задължително поле"
                            ControlToValidate="WebsiteNameInput"
                            ForeColor="Red"
                            Display="Dynamic"
                            runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="WebsiteCountryLabel" runat="server" ForeColor="Green" AssociatedControlID="WebsiteCountryInput">Държава: </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="WebsiteCountryInput" />
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidatorWebsiteCountry"
                            ErrorMessage="* Задължително поле"
                            ControlToValidate="WebsiteCountryInput"
                            ForeColor="Red"
                            Display="Dynamic"
                            runat="server" />
                        <asp:RegularExpressionValidator
                            ID="RegularExpressionValidator" runat="server"
                            ControlToValidate="WebsiteCountryInput"
                            ErrorMessage="* Въвеждането трябва да бъде на кирилица!"
                            ValidationExpression="^[A-Zа-яА-Я.\s]{1,50}$" 
                            ForeColor="Red"
                            Display="Dynamic"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="WebsiteLanguageLabel" runat="server" ForeColor="Green" AssociatedControlID="WebsiteLanguageInput">Език: </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="WebsiteLanguageInput" />
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidatorLanguage"
                            ErrorMessage="* Задължително поле"
                            ControlToValidate="WebsiteLanguageInput"
                            ForeColor="Red"
                            Display="Dynamic"
                            runat="server" />
                        <asp:RegularExpressionValidator
                            ID="RegularExpressionValidator3" runat="server"
                            ControlToValidate="WebsiteLanguageInput"
                            ErrorMessage="* Въвеждането трябва да бъде на кирилица!"
                            ValidationExpression="^[A-Zа-яА-Я.\s]{1,50}$" 
                            ForeColor="Red"
                            Display="Dynamic"/>
                    </td>
                </tr>
            </table>
        </fieldset>
        <br />
        <fieldset>
            <legend>Езици на озвучение: </legend>
            <asp:UpdatePanel ID="LanguagesUpdatePanel" runat="server" style="width: 230px">
                <ContentTemplate>
                    <asp:Panel runat="server" ID="LanguagePanel" />

                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="AddLanguageButton" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
            <br />
            <asp:Button ID="AddLanguageButton" runat="server" ForeColor="Green" Text="Добави език" OnClick="AddLanguageButton_Click"
                CausesValidation="false" />
        </fieldset>
        <br />
        <fieldset>
            <legend>Жанр: </legend>
            <asp:UpdatePanel ID="GenresUpdatePanel" runat="server" style="width: 230px">
                <ContentTemplate>
                    <asp:Panel runat="server" ID="GenrePanel" />
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="AddGenreButton" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
            <br />
            <asp:Button ID="AddGenreButton" runat="server" ForeColor="Green" Text="Добави жанр" OnClick="AddGenreButton_Click"
                CausesValidation="false" />
        </fieldset>
        <br />
        <fieldset>
            <legend>Създател: </legend>
            <asp:UpdatePanel ID="CreatorsUpdatePanel" runat="server" style="width: 230px">
                <ContentTemplate>
                    <asp:Panel runat="server" ID="CreatorPanel" />
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="AddCreatorButton" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
            <br />
            <asp:Button ID="AddCreatorButton" runat="server" ForeColor="Green" Text="Добави създател" OnClick="AddCreatorButton_Click"
                CausesValidation="false" />
        </fieldset>
        <br />
        <fieldset>
            <legend>Сценарист: </legend>
            <asp:UpdatePanel ID="WritersUpdatePanel" runat="server" style="width: 230px">
                <ContentTemplate>
                    <asp:PlaceHolder runat="server" ID="WriterPlaceholder" />
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="AddWriterButton" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
            <br />
            <asp:Button ID="AddWriterButton" runat="server" ForeColor="Green" Text="Добави сценарист" OnClick="AddWriterButton_Click"
                CausesValidation="false" />
        </fieldset>
        <br />
        <fieldset>
            <legend>Актьори: </legend>
            <asp:UpdatePanel ID="ActorsUpdatePanel" runat="server" style="width: 230px">
                <ContentTemplate>
                    <asp:PlaceHolder runat="server" ID="ActorPlaceholder" />
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="AddActorButton" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
            <br />
            <asp:Button ID="AddActorButton" runat="server" ForeColor="Green" Text="Добави актьор" OnClick="AddActorButton_Click"
                CausesValidation="false" />
        </fieldset>
        <br />
        <br />
        <fieldset>
            <legend>Награда: </legend>
            <asp:UpdatePanel ID="AwardsUpdatePanel" runat="server" style="width: 230px">
                <ContentTemplate>
                    <asp:PlaceHolder runat="server" ID="AwardPlaceholder" />
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="AddAwardButton" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
            <br />
            <asp:Button ID="AddAwardButton" runat="server" ForeColor="Green" Text="Добави награда" OnClick="AddAwardButton_Click"
                CausesValidation="false" />
        </fieldset>

        <br />
        <div style="height: 20px"></div>
        <asp:Button ID="Submit" ForeColor="Black" Text="Запиши" runat="server" class="btn btn-primary btn-lg" OnClick="Submit_Click" />
    </div>

</asp:Content>
