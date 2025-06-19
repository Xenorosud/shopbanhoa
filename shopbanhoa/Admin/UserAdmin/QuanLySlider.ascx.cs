using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shopbanhoa.Admin.UserAdmin
{
    public partial class QuanLySlider : System.Web.UI.UserControl
    {
        shopbanhoatuoiDataContext db = new shopbanhoatuoiDataContext();
        public List<Slider> SliderImages = new List<Slider>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadSliderImages();
            }
        }

        void LoadSliderImages()
        {
            var sliderData = from s in db.Sliders select s;
            if (sliderData != null && sliderData.Any())
            {
                SliderImages = sliderData.ToList();
                GridViewSlider.DataSource = SliderImages;
                GridViewSlider.DataBind();
            }
        }

        protected void UploadSliderImage(object sender, EventArgs e)
        {
            if (fileUploadSlider.HasFile)
            {
                string fileName = Path.GetFileName(fileUploadSlider.PostedFile.FileName);
                string filePath = "~/img/" + fileName;
                fileUploadSlider.PostedFile.SaveAs(Server.MapPath(filePath));

                Slider newSlider = new Slider
                {
                    AnhSlider = filePath
                };
                db.Sliders.InsertOnSubmit(newSlider);
                db.SubmitChanges();
                LoadSliderImages();

                Page.ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", "showSuccessMessage();", true);
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "ErrorMessage", "showErrorMessage('Vui lòng nhập ảnh !');", true);
            }
        }

        protected void GridViewSlider_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewSlider.EditIndex = e.NewEditIndex;
            LoadSliderImages();
        }

        protected void GridViewSlider_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                int maSlider = Convert.ToInt32(GridViewSlider.DataKeys[e.RowIndex].Values[0]);
                FileUpload fuAnhSliderEdit = (FileUpload)GridViewSlider.Rows[e.RowIndex].FindControl("fuAnhSliderEdit");
                HiddenField hfAnhHienTai = (HiddenField)GridViewSlider.Rows[e.RowIndex].FindControl("hfAnhHienTai");

                string anhSlider = hfAnhHienTai.Value;

                if (fuAnhSliderEdit.HasFile)
                {
                    string fileName = Path.GetFileName(fuAnhSliderEdit.FileName);
                    string filePath = "~/img/" + fileName;
                    fuAnhSliderEdit.SaveAs(Server.MapPath(filePath));
                    anhSlider = filePath;
                }

                using (shopbanhoatuoiDataContext db = new shopbanhoatuoiDataContext())
                {
                    var slider = db.Sliders.FirstOrDefault(s => s.MaSlider == maSlider);
                    if (slider != null)
                    {
                        slider.AnhSlider = anhSlider;
                        db.SubmitChanges();
                    }
                }

                GridViewSlider.EditIndex = -1;
                LoadSliderImages();
            }
            catch (Exception ex)
            {
               
            }
        }

        protected void GridViewSlider_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewSlider.EditIndex = -1;
            LoadSliderImages();
        }

        protected void GridViewSlider_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int maSlider = Convert.ToInt32(GridViewSlider.DataKeys[e.RowIndex].Values[0]);

                using (shopbanhoatuoiDataContext db = new shopbanhoatuoiDataContext())
                {
                    var slider = db.Sliders.FirstOrDefault(s => s.MaSlider == maSlider);
                    if (slider != null)
                    {
                        db.Sliders.DeleteOnSubmit(slider);
                        db.SubmitChanges();
                    }
                }

                LoadSliderImages();
            }
            catch (Exception ex)
            {
               
            }
        }
    }
}
