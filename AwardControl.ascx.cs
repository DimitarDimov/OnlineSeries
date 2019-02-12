using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AwardControl : System.Web.UI.UserControl
{
    private List<TextBox> categories = new List<TextBox>();

    public XmlModel.Award Award {
        get
        {
            var categories = GetCategories();
            return new XmlModel.Award()
            {
                Name = AwardNameInput.Text,
                Year = Convert.ToInt32(AwardYearInput.Text),
                Categories = categories
            };
        }
    }

    private List<string> GetCategories()
    {
        return categories.Select(c => c.Text).ToList();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        LoadCategories();
    }

    private void LoadCategories()
    {
        int count = GetCountFromViewState("categories");

        for (int i = 0; i < count; i++)
        {
            AddCategory();
        }
    }

    private void AddCategory()
    {
        TextBox control = new TextBox();
        control.ID = "category_" + categories.Count;
        categories.Add(control);

        AwardCategoryPanel.Controls.Add(control);
    }

    private int GetCountFromViewState(string key)
    {
        if (ViewState[key] == null)
        {
            return 1;
        }
        return (int)ViewState[key];
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        ViewState["categories"] = categories.Count;
    }

    protected void AddCategoryButton_Click(object sender, EventArgs e)
    {
        AddCategory();
    }
}