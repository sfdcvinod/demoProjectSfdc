//Write an apex class, to insert a Hiring Manager Record and an associated Position Record.
public class HiringManagerHelper 
{
	Public static void CreateHRRecord()
    {
        // Create the HR Record..
        	Hiring_Manager__c hr = new Hiring_Manager__c();
        
        		hr.Name = 'Ramesh Kumar';
        		hr.Location__c = 'Mumbai';
        		hr.Contact_Number__c = '9900998877';
        		hr.HR_Email_Id__c = 'ramesh@gmail.com';
                hr.State__c = 'MH';
        
        	Insert hr;        
        
        	if(hr.Id != null)
            {
                system.debug('Hiring Manager Record Id is...: '+ hr.id);
        		
                // Create the Related Position Record..
                Position__c pos = new Position__c();
                
                	pos.Name = 'Java Project Lead';
                	pos.Location_Name__c = hr.Location__c;
                	pos.Position_Status__c = 'New Position';
                	pos.Number_of_Vacancies__c = 2;
                	pos.Open_Date__c = system.today();
                	pos.Milestone_Date__c = system.today().AddDays(45);
                	pos.Minimum_Budget__c = 1400000;
                	pos.Maximum_Budget__c = 1700000;
                	pos.Travel_Required__c = true;
                	pos.Passport_Required__c = true;
                	pos.Contact_Number__c = hr.Contact_Number__c;
                	pos.HR_Email_ID__c = hr.HR_Email_Id__c;
                	pos.Position_Description__c = 'Java Project Lead';
                	pos.Skills_Required__c = 'Java Project Lead';
                
                	// Make the Position to be associated to HR Record..
                	pos.Hiring_Manager__c = hr.id;
                
                insert pos;
                if(pos.Id != null)
                {
                    system.debug('Position Record ID is...: '+ pos.id);
                }
            }
    }
}