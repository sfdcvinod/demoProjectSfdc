public class HiringManagerTriggerHandler 
{
  Public static void DeduplicationHiringManagerRecord(List<Hiring_Manager__c> lstHR)
  {
      for(Hiring_Manager__c HRRecord : lstHR)
      {
          integer count = [Select count() from Hiring_Manager__c
                          Where Name=:HRRecord.Name AND
                                Contact_Number__c=:HRRecord.Contact_Number__c];
          if(count>0)
          {
              HRRecord.AddError('Duplicate Record found with the same details. Record cannot be acceptable.');
          }
      }
  }
}