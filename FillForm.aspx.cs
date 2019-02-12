using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using XmlModel;



public partial class Input : System.Web.UI.Page
{
    private List<CreatorsControl> creatorsControls = new List<CreatorsControl>();
    private List<WriterControl> writerControls = new List<WriterControl>();
    private List<ActorControl> actorControls = new List<ActorControl>();
    private List<AwardControl> awardControls = new List<AwardControl>();
    private List<TextBox> languages = new List<TextBox>();
    private List<TextBox> genres = new List<TextBox>();

    protected void Page_Load(object sender, EventArgs e)
    {
        LoadCreatorControls();
        LoadWriterControls();
        LoadActorControls();
        LoadAwardControls();
        LoadLanguages();
        LoadGenres();
    }

    private void LoadAwardControls()
    {
        int count = GetCountFromViewState("awards");

        for (int i = 0; i < count; i++)
        {
            AddAwardControl();
        }
    }

    private void AddAwardControl()
    {
        AwardControl control = (AwardControl)LoadControl("~/AwardControl.ascx");
        control.ID = "awardControl_" + awardControls.Count;
        awardControls.Add(control);

        AwardPlaceholder.Controls.Add(control);
    }

    private void LoadGenres()
    {
        int count = GetCountFromViewState("genres");

        for (int i = 0; i < count; i++)
        {
            AddGenre();
        }
    }

    private void AddGenre()
    {
        TextBox control = new TextBox();
        control.ID = "genre_" + genres.Count;
        genres.Add(control);

        GenrePanel.Controls.Add(control);
    }

    private void LoadLanguages()
    {
        int count = GetCountFromViewState("languages");

        for (int i = 0; i < count; i++)
        {
            AddLanguage();
        }
    }

    private void AddLanguage()
    {
        TextBox control = new TextBox();
        control.ID = "language_" + languages.Count;
        languages.Add(control);

        LanguagePanel.Controls.Add(control);
    }

    private void LoadActorControls()
    {
        int count = GetCountFromViewState("actors");

        for (int i = 0; i < count; i++)
        {
            AddActorControl();
        }
    }

    private void AddActorControl()
    {
        ActorControl actorControl = (ActorControl)LoadControl("~/ActorControl.ascx");
        actorControl.ID = "actorControl_" + actorControls.Count;
        actorControls.Add(actorControl);

        ActorPlaceholder.Controls.Add(actorControl);
    }

    private void LoadWriterControls()
    {
        int count = GetCountFromViewState("writers");

        for (int i = 0; i < count; i++)
        {
            AddWriterControl();
        }
    }

    private void AddWriterControl()
    {
        WriterControl writerControl = (WriterControl)LoadControl("~/WriterControl.ascx");
        writerControl.ID = "writerControl_" + writerControls.Count;
        writerControls.Add(writerControl);

        WriterPlaceholder.Controls.Add(writerControl);
    }

    private void LoadCreatorControls()
    {
        int count = GetCountFromViewState("creators");

        for (int i = 0; i < count; i++)
        {
            AddCreatorControl();
        }
    }

    private void AddCreatorControl()
    {
        CreatorsControl control = (CreatorsControl)LoadControl("~/CreatorsControl.ascx");
        control.ID = "creatorControl_" + creatorsControls.Count;
        creatorsControls.Add(control);

        CreatorPanel.Controls.Add(control);
    }

    private int GetCountFromViewState(string key)
    {
        if (ViewState[key] == null)
        {
            return 1;
        }
        return (int)ViewState[key];
    }

    public void AddCreatorButton_Click(object sender, EventArgs e)
    {
        AddCreatorControl();
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        ViewState["languages"] = languages.Count;
        ViewState["genres"] = genres.Count;

        ViewState["creators"] = creatorsControls.Count;
        ViewState["writers"] = writerControls.Count;
        ViewState["actors"] = actorControls.Count;
        ViewState["awards"] = awardControls.Count;
    }

    public void AddWriterButton_Click(object sender, EventArgs e)
    {
        AddWriterControl();
    }

    public void AddActorButton_Click(object sender, EventArgs e)
    {
        AddActorControl();
    }

    public void AddLanguageButton_Click(object sender, EventArgs e)
    {
        AddLanguage();
    }

    public void AddGenreButton_Click(object sender, EventArgs e)
    {
        AddGenre();
    }
    public void AddAwardButton_Click(object sender, EventArgs e)
    {
        AddAwardControl();
    }

    //
    
    public OnlineSeriesXml.Parser parser1 = new OnlineSeriesXml.Parser();

    public void Submit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            var onlineSeriesXmlModel = new OnlineSeries();
            onlineSeriesXmlModel.Title = TitleInput.Text;
            onlineSeriesXmlModel.Country = CountryInput.Text;
            onlineSeriesXmlModel.NumberOfSeasons = Convert.ToInt32(NumberOfSeasonsInput.Text);
            onlineSeriesXmlModel.NumberOfEpisodes = Convert.ToInt32(NumberOfEpisodesInput.Text);
            onlineSeriesXmlModel.Description = DescriptionInput.Text;

            onlineSeriesXmlModel.RunningTimeInfo = new RunningTime()
            {
                Value = Convert.ToInt32(RunningTimeInput.Text),
                Format = RunningTimeFormatInput.SelectedValue
            };

            onlineSeriesXmlModel.ImdbRating = new Rating()
            {
                RatingValue = Convert.ToDouble(ImdbRatingInput.Text),
                Votes = Convert.ToInt32(ImdbRatingVotesInput.Text)
            };


            var releaseDate = GetReleaseDate();
            var endDate = getEndDate();
            onlineSeriesXmlModel.AiringInformation = new Airing()
            {
                ReleaseDate = releaseDate,
                EndDate = endDate
            };

            var languages = GetLanguages();
            onlineSeriesXmlModel.Languages = languages;

            var genres = GetGenres();
            onlineSeriesXmlModel.Genres = genres;

            onlineSeriesXmlModel.OriginalWebsite = new Website()
            {
                Name = WebsiteNameInput.Text,
                Country = WebsiteCountryInput.Text,
                Language = WebsiteLanguageInput.Text
            };

            onlineSeriesXmlModel.Awards = GetAwards();
            onlineSeriesXmlModel.Creators = GetCreators();
            onlineSeriesXmlModel.Writers = GetWriters();
            onlineSeriesXmlModel.Actors = GetActors();

            OnlineSeriesXml.Validator validator = new OnlineSeriesXml.Validator(Server.MapPath(Constants.SCHEMA_PROJECT_LOCATION));
            OnlineSeriesXml.Parser parser = new OnlineSeriesXml.Parser();
           
;

            var pathToSerializedObject = Constants.TEMP_DIR + onlineSeriesXmlModel.Title + ".xml";
            parser.Serialize(onlineSeriesXmlModel, pathToSerializedObject);

            String[] pathConvert = new String[] {pathToSerializedObject};
            var path = Change(pathConvert);
            if (validator.IsXmlValid(pathToSerializedObject))
            {
                Persist(path);
                Response.Redirect("~/TrueForm.aspx");
            } else
            {
                Response.Redirect("~/FalseForm.aspx");
            }
            

        }
        
    }

    public void Persist(IEnumerable<Tuple<string, bool>> validatedFiles)
    {
        
        var onlineSeriesRecords = DeserializeValidFiles(validatedFiles);

        OnlineSeriesDAO dao = new OnlineSeriesDAO();


        foreach (var onlineSeries in onlineSeriesRecords)
        {
            var creators = GetCreators(dao, onlineSeries);
            var writers = GetWriters(dao, onlineSeries);
            var actors = GetActors(dao, onlineSeries);

            var languages = onlineSeries.Languages
                                    .Select(l => new Database.Model.Language() { LanguageName = l })
                                    .ToList();

            var genres = onlineSeries.Genres
                                 .Select(g => new Database.Model.Genre() { GenreName = g })
                                 .ToList();

            var releaseDate = new DateTime(onlineSeries.AiringInformation.ReleaseDate.Year,
                                           onlineSeries.AiringInformation.ReleaseDate.Month,
                                           onlineSeries.AiringInformation.ReleaseDate.Date);

            var endDate = new DateTime(onlineSeries.AiringInformation.EndDate.Year,
                                       onlineSeries.AiringInformation.EndDate.Month,
                                       onlineSeries.AiringInformation.EndDate.Date);

            var rating = new Database.Model.ImdbRating()
            {
                Rating = onlineSeries.ImdbRating.RatingValue,
                Votes = onlineSeries.ImdbRating.Votes
            };

            dao.AddRating(rating);
            rating = dao.getUpToDateImdbRating(rating);

            var runningTime = onlineSeries.RunningTimeInfo.Value;

            var website = new Database.Model.Website()
            {
                Name = onlineSeries.OriginalWebsite.Name,
                Language = onlineSeries.OriginalWebsite.Language,
                Country = onlineSeries.OriginalWebsite.Country
            };

            dao.AddWebsite(website);

            var awards = GetAwards(dao, onlineSeries);

            var dbOnlineSeriesRecord = new Database.Model.OnlineSeries()
            {
                Title = onlineSeries.Title,
                Description = onlineSeries.Description,
                Country = onlineSeries.Country,
                NumberOfSeasons = onlineSeries.NumberOfSeasons,
                NumberOfEpisodes = onlineSeries.NumberOfEpisodes,
                RunningTime = runningTime,
                Languages = languages,
                Genres = genres,
                ReleaseDate = releaseDate,
                EndDate = endDate,
                RatingId = rating.Id,
                WebsiteName = website.Name,
                Awards = awards,
                Creators = creators,
                Actors = actors,
                Writers = writers
            };

            dao.AddOnlineSeries(dbOnlineSeriesRecord);
        }
    }
    private List<Database.Model.OnlineSeries_Award> GetAwards(OnlineSeriesDAO dao, OnlineSeries onlineSeries)
    {
        return onlineSeries.Awards.Select(award =>
        {
            var dbAwardRecord = new Database.Model.Award()
            {
                Name = award.Name,
                Year = award.Year
            };

            dao.AddAward(dbAwardRecord);
            var awardId = dao.GetAwardId(dbAwardRecord);

            var categoriesIds = GetAwardCategoriesIds(award, dao);

            return categoriesIds.Select(category =>
                    new Database.Model.OnlineSeries_Award()
                    {
                        AwardId = awardId,
                        AwardCategoryId = category
                    }).ToList();
        }).ToList().SelectMany(x => x)
                       .ToList();
    }

    private List<int> GetAwardCategoriesIds(Award award, OnlineSeriesDAO dao)
    {
        return award.Categories.Select(category =>
        {
            var dbCategoryRecord = new Database.Model.AwardCategory()
            {
                Name = category
            };
            dao.AddAwardCategory(dbCategoryRecord);

            return dao.GetAwardCategoryId(dbCategoryRecord);
        }).ToList();
    }

    private List<Database.Model.OnlineSeries_Actor> GetActors(OnlineSeriesDAO dao, XmlModel.OnlineSeries onlineSeries)
    {
        return onlineSeries.Actors.Select(actor =>
        {
            var person = new Database.Model.Person()
            {
                Name = actor.Name,
                Gender = actor.Gender
            };

            dao.AddPerson(person);
            var updatedPerson = dao.GetUpToDatePerson(person);

            return new Database.Model.OnlineSeries_Actor()
            {
                PersonId = updatedPerson.PersonId,
                Role = actor.Role,
                NumberOfEpisodes = actor.NumberOfEpisodes
            };
        }).ToList();
    }

    private List<Database.Model.OnlineSeries_Writer> GetWriters(OnlineSeriesDAO dao, XmlModel.OnlineSeries onlineSeries)
    {
        return onlineSeries.Writers.Select(writer =>
        {
            var person = new Database.Model.Person()
            {
                Name = writer.Name,
                Gender = writer.Gender
            };

            dao.AddPerson(person);
            var updatedPerson = dao.GetUpToDatePerson(person);

            return new Database.Model.OnlineSeries_Writer()
            {
                PersonId = updatedPerson.PersonId,
                Episodes = writer.Episodes,
                YearFrom = writer.YearDurationInfo.From,
                YearTo = writer.YearDurationInfo.To
            };
        }).ToList();
    }

    private List<Database.Model.OnlineSeries_Creator> GetCreators(OnlineSeriesDAO dao, XmlModel.OnlineSeries onlineSeries)
    {
        return onlineSeries.Creators.Select(creator =>
        {
            var person = new Database.Model.Person()
            {
                Name = creator.Name,
                Gender = creator.Gender
            };

            dao.AddPerson(person);
            var updatedPerson = dao.GetUpToDatePerson(person);

            return new Database.Model.OnlineSeries_Creator()
            {
                PersonId = updatedPerson.PersonId
            };
        }).ToList();
    }

    private IEnumerable<XmlModel.OnlineSeries> DeserializeValidFiles(IEnumerable<Tuple<string, bool>> validFile)
    {
        return validFile
                    .Select(valid => parser1.Deserialize(valid.Item1));
    }

    private IEnumerable<Tuple<string, bool>> Change(IEnumerable<string> paths)
    {
        var result = new List<Tuple<string, bool>>();
        foreach (string path in paths)
        {
 
            result.Add(new Tuple<string, bool>(path, true));
        }
        return result;
    }




    private List<Actor> GetActors()
    {
        return actorControls.Select(a => a.Actor).ToList();
    }

    private List<Writer> GetWriters()
    {
        return writerControls.Select(w => w.Writer).ToList();
    }

    private List<Creator> GetCreators()
    {
        return creatorsControls.Select(c => c.Creator).ToList();
    }

    private List<Award> GetAwards()
    {
        return awardControls.Select(a => a.Award).ToList();
    }

    private List<string> GetGenres()
    {
        return genres.Select(g => g.Text).ToList();
    }

    private List<string> GetLanguages()
    {
        return languages.Select(l => l.Text).ToList();
    }

    private DateGroup getEndDate()
    {
        var endDateInfo = EndDateInput.Text.Split('/');
        return getDateGroup(endDateInfo);
    }

    private DateGroup GetReleaseDate()
    {
        var releaseDateInfo = ReleaseDateInput.Text.Split('/');
        return getDateGroup(releaseDateInfo);
    }

    private DateGroup getDateGroup(string[] dateInfo)
    {
        if(dateInfo.Length != 3)
        {
            return null;
        }

        return new XmlModel.DateGroup()
        {
            Date = Convert.ToInt32(dateInfo[0]),
            Month = Convert.ToInt32(dateInfo[1]),
            Year = Convert.ToInt32(dateInfo[2])
        };
    }
}