@RestResource(URLMapping = '/CaseService/*')
Global class CaseManagerService 
{
	@HttpGet
    Global static List<Case> GetAllNewCases()
    {
        List<Case> lstCases = [Select Id, CaseNumber, Status, Type, Reason, Origin, Priority, Subject
                              From Case Where Status = 'New'
                              order by CaseNumber];
        return lstCases;
    }
}