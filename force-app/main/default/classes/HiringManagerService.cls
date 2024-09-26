//Create a WebService to remove the Hiring Manager Record from the object based on the Hiring Manager Record Id.
@RestResource(URLMapping = '/HRService/*')
Global class HiringManagerService 
{
	@HttpDelete
    Global static string DeleteHRRecord()
    {
        Map<string, string> inputParams = RestContext.request.Params;
        Delete[Select Id, Name from Hiring_Manager__c Where Id =:inputParams.get('Id')];
        return 'Record Deleted';
    }
    
    
}