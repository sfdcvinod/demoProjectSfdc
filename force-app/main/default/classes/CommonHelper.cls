//Create a Future Method, to Insert a Hiring Manager Record and to De-Activate a User Record.
public class CommonHelper 
{
  public static void DoDMLOperations()
  {
     // Deactivate User Record From Salesforce
     User userToDeactivate = [Select Id, UserName, isActive 
                             From User Where UserName = 'vinod_customer201@skyline.com'];
      if(userToDeactivate != Null)
      {
          userToDeactivate.IsActive = True;
          update userToDeactivate;
          CreateHRRecords();
      }  
      }
      // To Insert Record in Hiring Manager Object
      @future
      public static void CreateHRRecords()
      {
        Hiring_Manager__c hrm = new Hiring_Manager__c();
      hrm.Contact_Number__c = '9988776655';
      hrm.HR_Email_Id__c = 'hr@gmail.com';
      hrm.Name = 'Sudeeep Kumar';
      hrm.State__c = 'MH';
      hrm.Location__c = 'Mumbai';
      insert hrm;  
      }
}