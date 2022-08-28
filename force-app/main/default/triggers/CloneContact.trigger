trigger CloneContact on Contact (before insert) {
    
    for(Contact acc : trigger.new){
        if(acc.isClone()){
            acc.Phone = null;
            acc.MobilePhone = null;
        }
    }
    
}