@RestResource(URLMapping = '/CaseManagerService/*')
Global class CaseRecordsService 
{
	@HttpGet
    Global Static List<Case> GetCasesByPriority()
    {
        Map<string, string> inputParams = RestContext.request.Params;
        List<Case> lstCase = [Select Id, CaseNumber, Priority, type, Origin
                             From Case Where Priority =:inputParams.get('Priority')];
        return lstCase;
    }
}