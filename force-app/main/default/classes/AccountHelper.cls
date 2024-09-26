public class AccountHelper 
{
    public Static void getAllAccountRecords()
    {

            for(Account acc:[Select Id, Name, Rating, Industry, AnnualRevenue, Phone, Fax, Active__C From Account])
            {
                system.debug('Account ID='+acc.Id);
                system.debug('Account Name='+acc.Name);
                system.debug('Account Rating='+acc.Rating);
                system.debug('Account Industry='+acc.Industry);
                system.debug('Account Annual Revenue='+acc.AnnualRevenue);
                system.debug('Account Phone Number='+acc.Phone);
                system.debug('Account Fax Number='+acc.Fax);
                system.debug('Account Active Status='+acc.Active__C);
                system.debug('______________________________________');
            }
        }
    public static void BulkAccountOpportunityRecords()
    {
        Account acc = new Account();
        acc.Name = 'Vinod Borikar';
        acc.Industry = 'Banking';
        acc.Active__c = 'Yes';
        acc.Phone = '2233445566';
        acc.Fax = '2233556677';
        acc.Website = 'vinod@test.com';
        insert acc;
        if(acc.Id !=null)
        {
            system.debug('New id is:'+acc.id);
            List<Opportunity> lstoppRecord = new List<Opportunity>();
            for(integer counter=1; counter<=10; counter++)
            {
                Opportunity opp = new Opportunity();
                opp.Name = 'Sample Test'+counter;
                opp.CloseDate = system.today();
                opp.StageName = 'Prospecting';
                opp.AccountId = acc.Id;
               lstoppRecord.Add(opp);
            }
            if(!lstoppRecord.isEmpty())
            {
                insert lstoppRecord;
            }
        }
    }
    }