@RestResource(URLMapping = '/LeadRecordService/*')
Global class LeadManagerService 
{
	@HttpGet
    Global static Lead GetLeadRecordByID()
    {
        Map<string, string> inputParams = RestContext.request.Params;
        Lead leadRecord = [Select Id, FirstName, LastName, Email, Company, Phone, Title, Status
                          From Lead Where Id =: inputParams.get('Id')];
        return leadRecord;
    }
}