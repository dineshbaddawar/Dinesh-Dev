/**
 * @author [Dinesh B]
 * @email dinesh.b@utilitarianLab.com
 * @create date 2022-06-14 11:39:48
 * @modify date 2022-06-14 11:39:48
 * @desc [description]
 */


public class Opportunity_Utility {
    
    // Whenever Opportunity Stage is Closed Won , Send Custom Notification to Loged in User.
    public Static void CustomNotification(List<Opportunity> oppList){
        CustomNotificationType closedWonNotification = [SELECT Id, DeveloperName  FROM CustomNotificationType  WHERE DeveloperName='Opportunity_Closed_Won' ];
        try{ 
            for(Opportunity opp : oppList){
                if(opp.StageName == 'Closed Won'){
                    String body = 'Opportunity  '+opp.Name+' is Closed Won' +' '+'\n Opportunity Id: '+opp.Id;
                    //  This method we are using===> Mcustom.CustomNotification(typeId, sender, title, body, targetId, targetPageRef)
                    Messaging.CustomNotification Mcustom = new Messaging.CustomNotification(closedWonNotification.Id, UserInfo.getUserRoleId(), 'Opportunity Closed Won', body, opp.id, null);
                    Set<String> ownerId = new Set<String>{opp.OwnerId};
                        Mcustom.send(ownerId);
                }
            }
        }catch(Exception e){
            System.debug('The Error is : '+e.getMessage());
        }
    }

    // Whenever User tries to Change the Name, then throw an error as Name can not be Modified.
    public static void NameUpdateError(List<Opportunity> oppRecNew, Map<Id,Opportunity> oppRecOldMap){
        for(Opportunity opp : oppRecNew){
            Opportunity OldOpp = oppRecOldMap.get(opp.Id);
            if(opp.Name != OldOpp.Name){
                opp.Name.addError('Name can not be Modified');
            }
        }
    }

}