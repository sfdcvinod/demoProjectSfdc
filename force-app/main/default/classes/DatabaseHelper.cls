public class DatabaseHelper 
{
    public static void GetContactRecords()
    {
        List<Contact> lstcon = [SELECT Id, Name, MailingCity, MailingState, Phone, Fax, Email FROM Contact];
        system.debug('Total Contacts available are:'+lstcon.size());
       if(! lstcon.isEmpty())
        {
            for(Contact con : lstcon)
        {
            system.debug('Contact Name='+con.Name);
            system.debug('Mailing City='+con.MailingCity);
            system.debug('Contact Number='+con.Phone);
            system.debug('Fax='+con.Fax);
            system.debug('Contact Email Address='+con.Email);
            system.debug('__________________________________');
        }
        }
            
    }
    public static void GetCasePriorityRecords(string CasePriority)
    {
        if(CasePriority != null && 	CasePriority !='')
        {
            for(Case cs : [Select Id, CaseNumber, Priority, Status, Type, Origin From Case Where Priority=:CasePriority])
                system.debug('Total racords are:'+cs);
        }
    }
    public static void GetAllAccountRecords(string IndustryRecord)
    {
         if(IndustryRecord != null && IndustryRecord !='')
         {
             for(Account acc : [SELECT Id, Name, Industry, AnnualRevenue, Rating, IsDeleted FROM Account 
                               Where Industry =:IndustryRecord])
             {
                 system.debug('Industry Records are:'+acc);
             }
         }
    }
    public static void GetHighAmountOppRecords()
    {
        List<Opportunity> lstopp = [Select Id, Name, CloseDate, Amount From Opportunity Order by Amount Desc Limit 5];
        for(Opportunity opp : lstopp)
        {
            system.debug('5 Highest Amount Records are:'+opp);
        }
    }
    public static void SearchLeadRecords(string SearchText)
    {
        if(SearchText != null && SearchText !='')
        {
            string leadRecordQuery = 'Select Id, FirstName, LastName, Email, Phone, Fax From Lead ';
            if(Pattern.matches('^[a-zA-Z0-9._|\\\\%#~`=?&/$^*!}{+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,4}$', SearchText))
            {
                system.debug('Input Value is Email Id');
                leadRecordQuery+='Where Email =:SearchText';
            }
            else
            {
                system.debug('Input Value is Name');
                leadRecordQuery+=' Where LastName=:SearchText';
            }
            List<Lead> lstld = Database.query(leadRecordQuery);
                for(Lead ld : lstld)
            {
                system.debug('Lead Record is='+ld);
            }
        }
    }
    //Write an apex program, to fetch all the Contact Records associated with the "Banking Accounts".
    public static void GetBankingContactRecords()
    {
      Map<Id, Account> MapAccounts = new Map<Id, Account>([Select Id, Name, Industry From Account
                                                                                     Where Industry = 'Banking']);
          if(! MapAccounts.isEmpty())
      {
          for (Contact con : [Select Id, FirstName, LastName, Email, Title, Phone, Fax, AccountId From Contact
                             Where AccountId IN : MapAccounts.keySet()])
          {
              system.debug('Contact Record is:'+con);
          }
      }
    }
    public Static void SearchAccounts(string searchText)
    {
        if(searchText != null && searchText != '')
        {
            searchText+='%';
            for(Account acc : [Select Id, Name, Rating, Industry, AnnualRevenue, active__c
                                   From Account Where Name Like : searchText])
            {
                system.debug('Account Record is:'+acc);
            }
        }
    }
    public static void SearchLead()
    {
            for(Lead ld : [Select Id, FirstName, LastName, Email, Title, Phone, Fax
                                   From Lead Where LastName Like : 'kumar%'])
            {
                system.debug('Lead Record is:'+ld);
            }
        
    }
    
}