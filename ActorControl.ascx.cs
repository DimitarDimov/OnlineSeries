using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ActorControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public XmlModel.Actor Actor
    {
        get
        {
            return new XmlModel.Actor()
            {
                Name = ActorNameInput.Text,
                Gender = ActorGenderInput.SelectedValue,
                Role = ActorRoleInput.Text,
                NumberOfEpisodes = Convert.ToInt32(EpisodesInput.Text)
            };
        }
    }
}