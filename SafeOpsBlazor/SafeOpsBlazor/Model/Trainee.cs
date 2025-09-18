using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AuthShared.Models;

namespace SafeOpsBlazor.Model
{
    public class Trainee : TraineeShared
    {


/*        public ImageSource ProfileImageSource
        {
            get
            {
                if(ProfileImage != null && ProfileImage.Length > 0)
                {
                    byte[] imageBytes = Convert.FromBase64String(ProfileImage);
                    return ImageSource.FromStream(() => new MemoryStream(imageBytes));
                }

                return null;
            }
        }*/
    }
}
