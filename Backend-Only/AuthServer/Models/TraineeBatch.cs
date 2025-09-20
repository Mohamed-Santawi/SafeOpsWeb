using AuthServer.Entity;
using AuthShared.Models;

namespace AuthServer.Models
{
    public class TraineeBatch
    {
        public List<TraineeShared> Trainees { get; set; }
        public bool HasNext { get; set; }
    }
}
