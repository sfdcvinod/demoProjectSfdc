public class SearchAccountsController 
{
    public string SearchText{get;set;}
    public List<Account> lstAccounts{get;set;}
    public void SearchAccountRecords()
    {
        lstAccounts = new List<Account>();
        if(SearchText !=null && SearchText !='')
        {
        lstAccounts = [Select Id, Name, AnnualRevenue, Ownership, Phone, Type, Fax, Industry, Active__c
                       From Account Where Name Like : SearchText +'%'];
        }
    }
    
}