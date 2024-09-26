//Create a WebService, to Get All the Related Contact Records based on the Specified Account Name.
@RestResource(URLMapping = '/AccountRelatedService/*')
Global class RelatedContactService 
{
	@HttpGet
    Global static List<Contact> GetAccountRelatedContact()
    {
        Map<string, string> inputParams = RestContext.request.Params;
        List<Contact> lstContact = [Select Id, FirstName, LastName, Title, Phone, Fax, Account.Name
                                   From Contact Where Account.Name =:inputParams.get('AccountName')];
        return lstContact;
    }
}