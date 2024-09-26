@RestResource(UrlMapping = '/AccountService/*')
Global class AccountsManagerService 
{
	@HttpGet
    Global static List<Account> GetAllAccountRecords()
    {
        List<Account> lstAccountRecords = [Select Id, Name, Rating, Industry, AnnualRevenue, Phone, Fax, Type, Active__C
                                          From Account Order By Name];
        return lstAccountRecords;
    }
}