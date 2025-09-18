namespace AuthServer.Entity
{
    public class RegulationsEntity
    {
        public int Id { get; set; }
        public int ViolationLevelId { get; set; }
        public ViolationsLevelEntity ViolationsLevel { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public double Point { get; set; }
    }
}
