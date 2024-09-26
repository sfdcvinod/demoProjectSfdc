//Create a Batch Job to Synchronize the Account Record's Billing Address information into the associated 
//Contact Record's Mailing Address by dividing the Account Records to the various batches of size "4".

Global class SyncAccountRecords implements Database.Batchable<SObject> 
{
 Global Database.QueryLocator Start(Database.BatchableContext bContext)
 {
     String AccRecordQuery = 'Select BillingAddress From Account';
     return database.getQueryLocator(AccRecordQuery);
 }
    Global void Execute(Database.BatchableContext bContext, List<SObject> AccRecord)
    {
         if(!AccRecord.isEmpty())
        {
            List<Account> AccountRecord = new List<Account>(); 
            List<Contact> ConRec = new List<Contact>();
            for(SObject obj:AccRecord)
            {
               Account Acc = (Account)obj;
               Contact Con = new Contact();
               Con.MailingCountry = Acc.BillingCountry;
                AccountRecord.Add(Acc);
                ConRec.Add(Con);
            }
            if(! ConRec.isEmpty())
            {
                update AccountRecord;
                update ConRec;
            }
        }
      
    }
    Global void Finish(Database.BatchableContext bContext)
    {
        
    }
}