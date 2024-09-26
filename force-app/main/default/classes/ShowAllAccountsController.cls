public class ShowAllAccountsController 
{
    public List<Account> lstAccounts{get;set;}
    public string searchText{get;set;}
    public void ShowAllAccountsController()
    {
        lstAccounts = new List<Account>();
        if(searchText!=null && searchText!='')
        {
            searchText+='%';
        
        lstAccounts = [Select Id, Name, Industry, Type, AnnualRevenue, Phone, Fax, Rating From Account where Name Like:searchText];
        }
    }
     
}