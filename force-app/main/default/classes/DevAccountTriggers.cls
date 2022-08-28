public class DevAccountTriggers {

    /*
     TRIGGER: 1

// Write a trigger on contact to prevent duplicate records based on Contact Email & Contact Phone.
trigger DuplicateContact_1 on Contact (before insert) {

    Set<String> emailSet=new Set<String>();
    Set<String> phoneSet=new Set<String>();
    
    for(Contact con:trigger.new){
        emailSet.add(con.Email);
        phoneSet.add(con.Phone);
    }
    
    List<Contact> conList=[Select Email,Phone From Contact
                           Where Email IN:emailSet OR Phone IN:phoneSet];
    for(Contact con:trigger.new){
        if(conList.size()>0){
            con.Email.addError('Duplicate Contact Found');
            con.Phone.addError('Duplicate Record Found');
        }
    }
    
}

----------------------------------------------------------------------------------------------------------


TRIGGER: 2

// Write a trigger to prevent Account Name Duplication
trigger TriggerDuplicateAccount on Account (before insert,before update,after undelete) {

    Set<String> accSet=new Set<String>();
    
    for(Account acc:trigger.new){
        if(!String.isBlank(acc.Name)){
            accSet.add(acc.Name);
        }
    }
    
    Map<String,Account> accMap=new Map<String,Account>();
    for(Account acc:[Select Id,Name From Account Where Name =:accSet]){
        accMap.put(acc.Name,acc);
    }
    if(!accMap.isEmpty()){
        for(Account acc:trigger.new){
            if(accMap.containsKey(acc.Name)){
                acc.addError(acc.Name+'Account Already Exist');
            }
        }
    }
}

-----------------------------------------------------------------------------------------------------------

TRIGGER: 3

// If user is updating the LastName of an Contact then throw an error message "LastName Cannot be Changed."
trigger TriggerContactLastName on Contact (before update) {

    for(Contact oldContact:trigger.old){
        for(Contact newContact:trigger.new){
            if(oldContact.id == newContact.id && newContact.LastName !=oldContact.LastName){
                newContact.LastName.addError('Contact LastName Can not be changed');
            }
        }
    }
}


-----------------------------------------------------------------------------------------------------------------

TRIGGER: 4

//Write a trigger on contact to prevent duplicate records based on Contact Email & Contact Phone.
trigger ContactDuplicate on Contact (before insert) {

    Set<String> emailSet=new Set<String>();
    Set<String> phoneSet=new Set<String>();
    
    for(Contact con:trigger.new){
        emailSet.add(con.Email);
        phoneSet.add(con.Phone);
    }
    
    List<Contact> conList=[Select Id,Email,Phone From Contact Where Email IN:emailSet OR Phone IN:phoneSet];
   
    for(Contact con:trigger.new){
        if(conList.size()>0){
            con.Email.addError('Duplicate Email Found');
            con.Phone.addError('Duplicate Phone Found');
        }
    }
    
}

------------------------------------------------------------------------------------------------------------

TRIGGER: 5


trigger TriggerAccountAddress on Account (before insert) {

    for(Account acc:trigger.new){
       
      if(acc.BillingCountry !=null && acc.BillingCity !=null && acc.BillingState !=null &&
         acc.BillingStreet !=null && acc.BillingPostalCode !=null ){
             acc.ShippingCountry=acc.BillingCountry;
             acc.ShippingCity=acc.BillingCity;
             acc.ShippingState=acc.BillingState;
             acc.ShippingStreet=acc.BillingStreet;
             acc.ShippingPostalCode=acc.BillingPostalCode;
         }
    }
}


---------------------------------------------------------------------------------------------------------


TRIGGER: 6


trigger NoOfContactCountTrigger on Contact (after insert,after update) {

    List<Contact> conList=new List<Contact>();
    Set<Id> IdSet=new Set<Id>();
    
    if(trigger.isInsert){
        for(Contact con:trigger.new){
            if(con.AccountId !=null){
                IdSet.add(con.AccountId);
            }
        }
    }
    
    if(trigger.isUpdate){
        for(Contact con:trigger.new){
            if(con.AccountId !=trigger.oldmap.get(con.Id).AccountId){
                IdSet.add(con.AccountId);
                IdSet.add(trigger.oldmap.get(con.Id).AccountId);
            }
        }
    }
    
    List<Contact> conList1=[Select Id,Name,No_of_Contact__c,AccountId From Contact Where AccountId IN:IdSet];
    
    for(Contact con:conList1){
        Contact c=new Contact();
        c.id=con.Id;
        
        c.No_of_Contact__c=conList1.size();
        conList.add(c);
    }
    update conList;
  
}


------------------------------------------------------------------------------------------------------------

TRIGGER: 7

trigger TriggerUpdateAccountAnnualRevenue on Opportunity (after insert) {

    List<Account> accList=new List<Account>();
    for(Opportunity opp:trigger.new){
        Account acc=[Select Id,AnnualRevenue From Account Where Id=:opp.AccountId];
        acc.AnnualRevenue=opp.Amount;
        accList.add(acc);
    }
   update accList;
}


------------------------------------------------------------------------------------------------------------


TRIGGER: 8

// If user is updating the name of an account then throw an error message "Account Name Cannot be Changed."
trigger TriggerAccountName on Account (before update) {

    for(Account oldAccount:trigger.old){
        for(Account newAccount:trigger.new){
            if(oldAccount.id ==newAccount.id && newAccount.name !=oldAccount.name){
                newAccount.Name.addError('Account Name Can not be Updated');
            }
        }
    }
}


------------------------------------------------------------------------------------------------------------


TRIGGER: 9


// while deleting account record if it has contact or opportunity it should through an error.
trigger TriggerAccountDelete on Account (before delete) {

    // For Contact
    for(Account acc:[Select Id From Account Where Id IN(Select AccountId From Contact) AND ID IN:trigger.old]){
trigger.oldmap.get(acc.Id).addError('Account can not be deleted if it has related contact');
}
    
    // For Opportunity
    for(Account accList:[Select Id From Account Where Id IN(Select AccountId From Opportunity) AND ID IN:trigger.old]){
        trigger.oldmap.get(accList.id).addError('Account can not be delte if it has opportunity');
    }
}

------------------------------------------------------------------------------------------------------------


TRIGGER: 10

// In the account if the Tyoe field is changes from Null to Prospect than delete all associated contact records
trigger TriggerDeleteContactAccount on Account (after update) {

     
    Set<Id> IdSet=new Set<Id>();
    Map<Id,Account> oldmap=trigger.oldmap;
    Map<Id,Account> newmap=trigger.newmap;
    
    for(Id aid:oldmap.keySet()){
        if(oldmap.get(aid).Type==null && newmap.get(aid).Type=='Prospect')
            IdSet.add(aid);
    }
    
    List<Opportunity> oppList=[Select AccountId,Name From Opportunity Where AccountId IN:IdSet];
    delete oppList;
}

----------------------------------------------------------------------------------------------------------------


     */
}