//Create a Batch Class, to Update the Hiring Manager Location and Contact Number for all 
//the Author Records, by dividing them into the various batches of size 100.

Global class AuthorUpdateBatch implements Database.Batchable<SObject> 
{
  Global Database.QueryLocator Start(Database.BatchableContext bContext)
  {
     string AuthorRecordQuery = 'Select Id, Location__c From Author__c';
      return database.getQueryLocator(AuthorRecordQuery);
  }
    Global void Execute(Database.BatchableContext bContext, List<SObject> RecordsToProcess)
    {
        if(!RecordsToProcess.isEmpty())
        {
            List<Author__c> AuthorRecordsToUpdate = new List<Author__c>();
            for(SObject obj:RecordsToProcess)
            {
                Author__c AuthorRecord = (Author__c)obj;
                AuthorRecord.Location__c = 'Pune';
                AuthorRecordsToUpdate.Add(AuthorRecord);
            }
             Update AuthorRecordsToUpdate;
        }
    }
    Global void Finish(Database.BatchableContext bContext)
    {
       system.debug('Get Job ID='+bContext.getJobId());
    }
}