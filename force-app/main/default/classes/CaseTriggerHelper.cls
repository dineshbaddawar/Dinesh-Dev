public class CaseTriggerHelper {
    
    public static void AssignCaseDefaultQueue(List<Case> newCases){
        Group queue = [SELECT Id,Name FROM Group WHERE Type = 'Queue' AND Name ='Case Assignment Queue' LIMIT 1];
        System.debug('queue == >'+queue);
        for(Case cs : newCases){
            if(cs.Origin == 'Email'){
                cs.OwnerId = queue.Id;
            }
        }
    }
    
    Public static void RoundRobinLogicCaseOwnerLogic(List<Case> caseList){
        Map<String,List<Assignment_Group_Member__c>> mapOfAGIdAGMList = new Map<String,List<Assignment_Group_Member__c>>();
        Map<String,String> mapAGNameCaseOriginName = new Map<String,String>();
        List<Case> caseListOwnerToUpdate =new List<Case>();
        system.debug('caseList == >'+caseList);
        try{
            for(Case cs : caseList){
                if(cs.Origin == 'Email'){
                    mapAGNameCaseOriginName.put('Email','Email To Case');
                }
                if(cs.Origin == 'Web'){
                    mapAGNameCaseOriginName.put('Web','Web To Case');
                }
            }
            for(Assignment_Group__c ag : [SELECT id,Name, (SELECT Id,Name,Group_Member__c FROM Assignment_Group_Members__r) FROM Assignment_Group__c]){
                if(ag.Assignment_Group_Members__r != null && !ag.Assignment_Group_Members__r.isEmpty()) {
                    List<Assignment_Group_Member__c> AGMList = new List<Assignment_Group_Member__c>{ag.Assignment_Group_Members__r};
                        mapOfAGIdAGMList.put(ag.Name,AGMList);
                }
            }
            system.debug('mapOfAGIdAGMList == >'+mapOfAGIdAGMList);
            for(Case cas : caseList){
                Case caseRecToUpdate = new Case ();
                if(cas.origin == 'Email' || cas.origin == 'Web'){
                    for(Assignment_Group_Member__c agm : mapOfAGIdAGMList.get(mapAGNameCaseOriginName.get(cas.Origin))){
                        caseRecToUpdate.id = cas.Id;
                        caseRecToUpdate.OwnerId = agm.Group_Member__c;
                        caseListOwnerToUpdate.add(caseRecToUpdate);
                    }
                }
            }
            if(caseListOwnerToUpdate.size()>0){
                update caseListOwnerToUpdate;
                system.debug('caseListOwnerToUpdate == >'+caseListOwnerToUpdate);
            }
        }catch(Exception e){
            System.debug('The Error ::'+e.getMessage() +' AND Error Line No :'+e.getLineNumber());
        }
    }
    
}