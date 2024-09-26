public class ShowAllAccountRecordsController 
{
    Public List<Account> lstAccounts{get;set;}
    
    public ShowAllAccountRecordsController ()
    {
        lstAccounts = [Select Id, Name, Rating, Industry, AnnualRevenue, Phone, Fax, Type, Ownership, Active__c
                        From Account];
    }
}