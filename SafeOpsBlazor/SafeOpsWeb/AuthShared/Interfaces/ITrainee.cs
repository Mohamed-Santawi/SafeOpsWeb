using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace AuthShared.Interfaces;

public interface ITrainee
{
    public int AcademyId { get; set; } // this is a index

    public int NationalId { get; set; }
    public string Name { get; set; }
    public string Major { get; set; }
    public string Email { get; set; }
    public string Phone { get; set; }
    public string Address { get; set; }
    public string City { get; set; }
    public string State { get; set; }
    public string Zip { get; set; }

    public double BehaviorScore { get; set; }
}