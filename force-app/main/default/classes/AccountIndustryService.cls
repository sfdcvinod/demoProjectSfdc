//Create a WebService, to Get the required Account Records based on the Specified Industry Name.
@RestResource(URLMapping = '/AccountIndustry/*')
Global class AccountIndustryService 
{
	@HttpGet
    Global static List<Account> GetAccountRecordSpecifiedByName()
    {
        Map<string, string> InputParams = RestContext.request.Params;
        List<Account> lstacc = [Select Id, Name, Industry, Phone, Fax
                      From Account Where Industry =:InputParams.get('Industry')];
        return lstacc;
    }
}