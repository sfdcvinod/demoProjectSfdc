public class DatabaseManager 
{
    //Write an apex program, to fetch the Account Record based on the specified name and fetch all the 
    //Related Contacts, Opportunities, and Cases associated with the account.
 Public Static void GetAccountRecords(string AccountRecordName)
 {
    if(AccountRecordName != null && AccountRecordName !='')
 {
     List<Account> lstAccounts = [Select Id, Name, Rating, Industry, AnnualRevenue, Phone, Fax, active__c,
                                 (Select Id, FirstName, LastName, Email, Title, Phone, Fax From Contacts),
                                 (Select Id, Name, CloseDate, Amount, StageName From Opportunities),
                                 (Select Id, Status, Priority, Origin, Type, Reason, Subject From Cases)
                                 From Account
                                 Where Name =: AccountRecordName];
     system.debug('Collection Size:'+lstAccounts.size());
     for(Account acc : lstAccounts)
     {
         system.debug('Account Record Details:'+acc);
         system.debug('============================================');
         system.debug('Related Contacts count is:'+acc.Contacts.size());
         for(Contact con : acc.Contacts)
         {
             system.debug('Contact Records are:'+con);
         }   
             system.debug('===========================================');
             system.debug('Related Opportunities Record count is:'+acc.Opportunities.size());
             for(Opportunity opp : acc.Opportunities)
             {
                 system.debug('Opportunities Records are:'+opp);
             }    
                 system.debug('=======================================================');
                 system.debug('Cases Records count are:'+acc.Cases.size());
                 for(Case cs : acc.Cases)
                 {
                     system.debug('Cases Records are:'+cs);
                     
                 }
             }
         }
     }
    //Write an apex program, to fetch Hiring Manager Details based on the specified Name and fetch all the associated Position Records also.
  Public static void GetHiringManagerRecords(string HiringManagerName)
  {
      if(HiringManagerName !=null && HiringManagerName !='')
      {
         List<Hiring_Manager__c> lsthr = [Select Id, Name, Contact_Number__c, HR_Email_ID__c, Location__c,
                                         (Select Id, Name, Contact_Number__c, HR_Email_ID__c, Location_Name__c, Maximum_Budget__c, Number_of_Vacancies__c,
                                         Position_Status__c From Positions__r)
                                         From Hiring_Manager__c Where Name =:HiringManagerName];
          system.debug('Size of the collection:'+lsthr.size());
          for (Hiring_Manager__c hr : lsthr)
          {
              system.debug('The Hiring Manager Records are:'+hr);
              system.debug('The Position Records are:'+hr.Positions__r);
          }
      }
  }
    public static void GetCaseDetails(string CaseNum)
    {
        if(CaseNum !=null && CaseNum !='')
        {
          List<Case> lstcs = [Select Id, CaseNumber, Priority, Type, Reason, Origin, Subject, 
                             Contact.Name, Contact.Email, 
                             Contact.Account.Name, Contact.Account.Rating, Contact.Account.AnnualRevenue, 
                             Contact.Account.Owner.FirstName, Contact.Account.Owner.LastName, 
                             Contact.Account.Owner.Profile.Name, 
                             Contact.Account.Owner.Profile.UserLicense.Name
                             From Case Where CaseNumber =: CaseNum];
            for(Case cs : lstcs)
            {
                //Print Case Record Details
                system.debug('Case Recors Details are:'+cs);
                //Print Case Related Recods Details
                system.debug('Case Related Contact Person is:'+cs.Contact.Name);
                system.debug('Case Related Contact Person Email:'+cs.Contact.Email);
                //Print Account Related Record Details
                system.debug('Related Account Name = ' +cs.contact.Account.Name);
                system.debug('Related Account Ratig = ' +cs.contact.Account.Rating);
                system.debug('Related Account Annual Revenue = ' +cs.contact.Account.AnnualRevenue);
                
                // Print Related Contact -- > Account --> Owner
                system.debug('Related Owner First Name = ' +cs.contact.Account.Owner.FirstName);
                system.debug('Related Owner Last Name = ' +cs.contact.Account.Owner.LastName);
                
                // Print Related Contact -- > Account --> Owner --> Profile
                system.debug('Related Profile Name = ' +cs.contact.Account.Owner.Profile.Name);
                
                // Print Related Contact -- > Account --> Owner --> Profile --> License
                system.debug('Related Profile Name = ' +cs.contact.Account.Owner.Profile.UserLicense.Name);
            }
        }
    }
    public Static void GetCandidatesDetails(string CandidateName)
    {
        if(CandidateName != null && CandidateName !='')
        {
            List<Candidate__c> lstcan = [Select Name, Candidate_Status__c, Contact_Number__c, Email_ID__c, Location__c, 
                                         Position__r.Name, Position__r.Contact_Number__c, 
                                        Position__r.Hiring_Manager__r.Name, Position__r.Hiring_Manager__r.Contact_Number__c
                                        From Candidate__c Where Name =:CandidateName];
            for(Candidate__c can : lstcan)
            {
                system.debug('Candidate Record is:'+can);
                system.debug('Position Name is:'+can.Position__r.Name);
                system.debug('Position Contact Number:'+can.Position__r.Contact_Number__c);
                system.debug('Hiring Manager Name is:'+can.Position__r.Hiring_Manager__r.Name);
            }
        }
    }
     
 }