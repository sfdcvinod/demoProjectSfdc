//Configure the Queueable Jobs, to create the "Hiring Manager Record",  by using  Queueable interface classes.

Global class HiringManagerQueueable implements system.Queueable 
{
  Global void Execute(system.QueueableContext qContext)
  {
      Hiring_Manager__c HRRecords = new Hiring_Manager__c();
      HRRecords.Name = 'Sanjeet Kumar';
      HRRecords.Contact_Number__c = '1122334455';
      HRRecords.State__c = 'MH';
      HRRecords.Location__c = 'Mumbai';
      insert HRRecords;
      if (HRRecords.Id != Null)
      {
          system.debug('Hiring Manager Record Id is:'+HRRecords.Id);
      }
  }
}