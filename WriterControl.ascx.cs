using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WriterControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public XmlModel.Writer Writer
    {
        get
        {
            return new XmlModel.Writer()
            {
                Name = WriterNameInput.Text,
                Gender = WriterGenderInput.SelectedValue,
                Episodes = Convert.ToInt32(EpisodesInput.Text),
                YearDurationInfo = new XmlModel.YearDuration()
                {
                    From = Convert.ToInt32(FromInput.Text),
                    To = Convert.ToInt32(ToInput.Text)
                }
            };
        }
    }
}