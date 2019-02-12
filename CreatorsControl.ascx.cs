using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CreatorsControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public XmlModel.Creator Creator
    {
        get
        {
            return new XmlModel.Creator()
            {
                Name = CreatorNameInput.Text,
                Gender = CreatorGenderInput.SelectedValue
            };
        }
    }
}