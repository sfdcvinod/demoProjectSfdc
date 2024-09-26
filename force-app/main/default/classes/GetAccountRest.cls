@RestResource(URLMapping='/CaseServices/*')
Global class GetAccountRest 
{
  @HttpGet
    Global static List<Case> CaseRecords()
    {
        Map<string, string> inputParams = restContext.request.Params;
        List<Case> lstCase = [Select Id, CaseNumber, Status, Priority From Case Where Priority=:inputParams.get('Priority')];
        return lstCase;
    }
}