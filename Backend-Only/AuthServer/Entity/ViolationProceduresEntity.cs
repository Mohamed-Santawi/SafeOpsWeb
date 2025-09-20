namespace AuthServer.Entity;

public class ViolationProceduresEntity
{
    public int Id { get; set; }
    public string Title { get; set; }
    public string Description { get; set; }

    public int RegulationId { get; set; }
    public RegulationsEntity RegulationsEntity { get; set; }
}