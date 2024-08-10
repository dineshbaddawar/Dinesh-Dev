/**
 * @author [Dinesh B]
 * @email dinesh.b@utilitarianLab.com
 * @create date 2022-06-14 11:39:00
 * @modify date 2022-06-14 11:39:00
 * @desc [description]
 */
public with sharing class Account_Utility {
    
    // Before insert, if BillingAddress is not null , then update Shipping Address as Same as Billing Address
    public static void UpdateShippingAddress(List<Account> accList){

        for(Account acc : accList){
            if(acc.BillingCity != null && acc.BillingCountry != null && acc.BillingPostalCode != null && acc.BillingState != null){
                acc.ShippingCity = acc.BillingCity;
                acc.ShippingCountry = acc.BillingCountry;
                acc.ShippingPostalCode = acc.BillingPostalCode;
                acc.ShippingState = acc.BillingState;
            }
        }
        
    }
    
    
    // Send Custom Notification to User, After Record get Created in Salesforce.
    public Static void SendCustomNotification(List<Account> accList){
        try{
    
            CustomNotificationType customType = [SELECT Id,DeveloperName FROM CustomNotificationType WHERE DeveloperName = 'Account_Creation_Notification'];
            for(Account acc : accList){
                if(acc.Name != null){
                    Messaging.CustomNotification mailcustom = new Messaging.CustomNotification();
                    mailcustom.setBody('New Account Created Successfully');
                    mailcustom.setTitle('Account Name :'+acc.Name+' '+'\n Account Id :'+acc.Id);
                    mailcustom.setSenderId(UserInfo.getUserId());
                    mailcustom.setNotificationTypeId(customType.id);
                    mailcustom.setTargetId(acc.Id);
                    Set<String> UserId = new Set<String>{UserInfo.getUserId()};
                    System.debug('The User Id --> '+UserId);
                    mailcustom.send(UserId);
                }
            }
    
        }catch(Exception e){
            System.debug('The Error is Occured :'+e.getMessage());
        }
    }

    // Whenever user creating an Account, if the AnnualRevenue is Less than 1000 throw an error.
    public Static void AddErrorAnnualRevenue(List<Account> accList){

        for(Account acc: accList){
            if(acc.AnnualRevenue == null || acc.AnnualRevenue <= 1000){
                acc.AnnualRevenue.addError('Please Provide the AnnualRevenue Greater than 1000');
            }
        }
    }

    // Whenever user create Account, Create Contact With same name as Account.
    public Static void CreConWithAccount(List<Account> accList){

       List<Contact> conListToInsert = new List<Contact>();
       try{
        for(Account acc : accList){
            Contact con = new Contact();
            con.LastName = acc.Name;
            con.AccountId = acc.Id;
            conListToInsert.add(con);
        }
        if(conListToInsert.size()>0){
            insert conListToInsert;
        }
       }catch(Exception e){
        System.debug('The Error is :'+e.getMessage());
       }
    
    }

    // When User trying to modify Account Name, throw an error as Account Name can not be modified.
    public static void UpdateLastname(List<Account> accRecNew, Map<Id,Account> oldMap){
          for(Account acc : accRecNew){
              Account Accold = oldMap.get(acc.id);
              if(acc.Name != accold.Name){
                  acc.Name.addError('Account Name can not be Updated');
              }
          }
      }

      // When User Updating account Record, if Billing Address is Changed, Update all it's Child Contacts Mailling Address
      // Field same as Account Billing Address.
      public static void UpdateContactMaillingWithAccountBillingAddress(List<Account> accRecNew, Map<Id,Account> accRecOldMap){
        Set<Id> accIdSet = new Set<Id>();
        for(Account acc : accRecNew){
            Account accOldRec = accRecOldMap.get(acc.Id);
            if(acc.BillingStreet != accOldRec.BillingStreet){
                accIdSet.add(acc.Id);
            }
        }

        List<Account> accList = [SELECT Id,Name,BillingStreet, (SELECT Id,Name FROM Contacts) FROM Account WHERE ID IN: accIdSet ];
        List<Contact> conListToUpdate = new List<Contact>();

        for(Account accRec : accList){
            List<Contact> conOfLoopAccount = accRec.Contacts;
            for(Contact con : conOfLoopAccount){
               con.MailingStreet = accRec.BillingStreet;
               conListToUpdate.add(con);
            }
        }

        if(conListToUpdate.size()>0){
            update conListToUpdate;
        }
      }

      // If User Try delete Account Record, if Active Field is true, then it should throw an error.
      public Static void ActiveAccountError(List<Account> accList){
        for(Account acc : accList){
            if(acc.Active__c == 'Yes'){
                acc.Active__c.addError('Active Account can not be Deleted');
            }
        }
      }

      // When user delete Account, Send an Confirmation email to the user.
      public Static void SendEmailDeleteAccount(List<Account> accList){
        List<Messaging.SingleEmailMessage> emailObjs = new List<Messaging.SingleEmailMessage>();
        for(Account acc : accList){
            Messaging.SingleEmailMessage emailObj = new Messaging.SingleEmailMessage();
            List<String> mailList = new List<String>{UserInfo.getUserEmail()};
                
            emailObj.setToAddresses(mailList);
            emailObj.setSubject('Account Deleted Successfully '+acc.Name+'\n Account Id '+acc.Id);
            emailObj.setPlainTextBody('Please Note that Account Name '+acc.Name+ ' is Successfully Delete &'+ '\n Here is Account Id '+acc.Id);
            emailObjs.add(emailObj);
        }
        if(!emailObjs.isEmpty()){
            Messaging.sendEmail(emailObjs);
        }
      }

      // Send an Email to User, when user Restores an Account From Recycle Bin.
      public static void SendEmailRestoreAccount(List<Account> accList){
        List<Messaging.SingleEmailMessage> emailObjs = new List<Messaging.SingleEmailMessage>();
        for(Account acc : accList){
            Messaging.SingleEmailMessage emailObj = new Messaging.SingleEmailMessage();
            List<String> mailList = new List<String>{UserInfo.getUserEmail()};
            emailObj.setToAddresses(mailList);
            emailObj.setSubject('Account Restored Successfully '+acc.Name+'\n Account Id '+acc.Id);
            emailObj.setPlainTextBody('Please Note that Account Name '+acc.Name+ ' is Successfully Restored &'+ '\n Here is Account Id '+acc.Id);
            emailObjs.add(emailObj);
        }
        if(!emailObjs.isEmpty()){
            Messaging.sendEmail(emailObjs);
        }
      }
}