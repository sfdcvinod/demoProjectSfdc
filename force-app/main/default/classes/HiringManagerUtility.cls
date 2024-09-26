public class HiringManagerUtility 
{
	Public static void CreateHRRecord(string hrName, string hrCity, string hrPhone, string hrEmail, string State)
    {
        Hiring_Manager__c hr = new Hiring_Manager__c();
        
        	hr.Name = hrName;
        	hr.Location__c = hrCity;
        	hr.Contact_Number__c = hrPhone;
        	hr.HR_Email_ID__c = hrEmail;
            hr.State__c = State;
        insert hr;
        if(hr.Id != null)
        {
         	system.debug('Hiring Manager Record Id is...: '+ hr.id); 
            
            // Call the Procedure to Create a Related Position Record..
            CreateRelatedPosition(hr);
        }        
    }
    
    Public static void CreateRelatedPosition(Hiring_Manager__c hr)
    {
        Position__C pos = new Position__C();
        
        	pos.Name = 'QTP Lead';
        	pos.Location_Name__c = hr.Location__c;
        	pos.HR_Email_ID__c = hr.HR_Email_ID__c;
        	pos.Contact_Number__c = hr.Contact_Number__c;
        	pos.Position_Status__c = 'New Position';
        	pos.Number_of_Vacancies__c = 1;
        	pos.Open_Date__c = System.today();
        	pos.Milestone_Date__c = System.today().AddDays(30);
        	pos.Minimum_Budget__c = 1100000;
        	pos.Maximum_Budget__c = 1400000;
        	pos.Position_Description__c = 'QTP Autumation Test Lead';
        	pos.Skills_Required__c = 'QTP Automation, Manual Testing';
        	pos.Hiring_Manager__c = hr.Id;
        
           insert pos;
        
        if(pos.id != null)
            system.debug('Position Record id is...: '+ pos.id);
    }
}