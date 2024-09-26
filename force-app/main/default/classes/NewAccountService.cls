//Create a RestFul WebService, to Insert an Account Record into the object.
@RestResource(URLMapping='/NewAccountsManagerService/*')
Global class NewAccountService 
{
	@HttpPost
    Global static string InsertNewAccount()
    {
        string AccRecord = RestContext.request.requestBody.ToString();
        List<Account> lstacc = (List<Account>)system.JSON.deserialize(AccRecord, List<Account>.class);
        
            insert lstacc;
            return 'SUCCESS';
        
    }
    
}