using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Serialization;
using System.Text;
using XmlModel;
using System.Drawing;



public partial class Upload : System.Web.UI.Page
{
    private OnlineSeriesXml.Validator validator;
    private OnlineSeriesXml.Parser parser;
    protected void Page_Load(object sender, EventArgs e)
    {
        validator = new OnlineSeriesXml.Validator(Server.MapPath(Constants.SCHEMA_PROJECT_LOCATION));
        parser = new OnlineSeriesXml.Parser();
    }

    protected void InputButton_OnClicked(object sender, EventArgs e)
    {

        {
            
            string folder_path = "~/App_Data/Inputs/";
            string[] xmlFiles = Directory.GetFiles(Server.MapPath(folder_path), "*.xml").ToArray();                      
            var validatedFiles = ValidateToSchema(xmlFiles);
            Persist(validatedFiles);
            Show(validatedFiles);
        }
    }

    private void Show(IEnumerable<Tuple<string, bool>> validatedFiles)
    {
        foreach (Tuple<string, bool> file in validatedFiles)
        {
            if (IsXMLValid(file))
            {
                AddRow(getFileName(file),
                       "ВАЛИДЕН",
                       System.Drawing.Color.Green);
            }
            else
            {
                AddRow(getFileName(file),
                       "НЕВАЛИДЕН",
                       System.Drawing.Color.Red);
            }
        }
    }
    
    private string getFileName(Tuple<string, bool> file)
    {
        return Path.GetFileName(file.Item1);
    }

    private void AddRow(string fileName, string status, Color color)
    {
        TableCell fileCell = new TableCell();
        fileCell.Text = fileName;

        TableCell statusCell = new TableCell();
        statusCell.ForeColor = System.Drawing.Color.Green;
        statusCell.Text = status;

        TableRow row = new TableRow();
        row.Cells.Add(fileCell);
        row.Cells.Add(statusCell);

        results.Rows.Add(row);
    }

    private bool IsXMLValid(Tuple<string, bool> file)
    {
        return file.Item2;
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

    private IEnumerable<XmlModel.OnlineSeries> DeserializeValidFiles(IEnumerable<Tuple<string, bool>> validatedFiles)
    {
        return validatedFiles.Where(file => file.Item2 == true)
                    .Select(valid => parser.Deserialize(valid.Item1));
    }


    private IEnumerable<Tuple<string, bool>> ValidateToSchema(IEnumerable<string> paths)
    {
        var result = new List<Tuple<string, bool>>();
        foreach (string path in paths)
        {
            bool isXMLValid = validator.IsXmlValid(path);
            result.Add(new Tuple<string, bool>(path, isXMLValid));
        }
        return result;
    }

 
}