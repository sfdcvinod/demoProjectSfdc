public class GlobalSearchRecordsController 
{
    public string searchText{get;set;}
    public List<Account> lstAccounts{get;set;}
    public List<Contact> lstContacts{get;set;}
    public List<Lead> lstLeads{get;set;}
    public List<Position__C> lstPositions{get;set;}
    
    public void SearchRecords()
    {
        lstAccounts = new List<Account>();
        lstContacts = new List<Contact>();
        lstLeads = new List<Lead>();
        lstPositions = new List<Position__C>();
        if(searchText!=null && searchText!='')
        {
            string searchQuery ='FIND '+'\'' + searchText + '*'+'\''+ ' IN ALL FIELDS RETURNING '+
                                'Account(Id, Name, Rating, Industry, AnnualRevenue, Phone, Fax, Type, active__C),'+
                                'Contact(Id, FirstName, LastName, Email, Title, Phone, Fax, MailingCity, MailingState, MailingCountry),'+
                                'Lead(Id, FirstName, Company, LastName, Email, Title, Phone, Fax, Rating, Status, Industry, AnnualRevenue),'+
                                'Position__C(Id, Name, Location_Name__c, Contact_Number__c, Position_Status__c, Maximum_Budget__c, Milestone_Date__c)';
            List<List<SObject>> lstRecords = Search.Query(searchQuery);
            lstAccounts = (List<Account>)lstRecords.Get(0);
            lstContacts = (List<Contact>)lstRecords.Get(1);
            lstLeads = (List<Lead>)lstRecords.Get(2);
            lstPositions = (List<Position__c>)lstRecords.Get(3);
        }
    }
}