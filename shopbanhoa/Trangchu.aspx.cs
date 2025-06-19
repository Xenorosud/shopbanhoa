using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shopbanhoa
{
    public partial class Trangchu : System.Web.UI.Page
    {
        shopbanhoatuoiDataContext db = new shopbanhoatuoiDataContext();
        public List<Slider> SliderImages = new List<Slider>();

        protected void Page_Load(object sender, EventArgs e)
        {
            LoadSliderImages();
        }

        void LoadSliderImages()
        {
           
            var sliderData = from s in db.Sliders
                             select s;
           
            if (sliderData != null && sliderData.Any())
            {
                SliderImages = sliderData.ToList();
            }
        }
    }
}