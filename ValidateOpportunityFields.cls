public class ValidateOpportunityFields {
    @auraEnabled
    public static opportunity getopportunity(String recordId){
        String fieldApiNamesFromCustomSettings = OpportunitySettingsNew__c.getall().values()[0].fieldApiNames__c;
        List<String> customData=fieldApiNamesFromCustomSettings.split(',');
        System.debug('fieldApiNamesFromCustomSettings'+fieldApiNamesFromCustomSettings);
        Map<String,sObjectField>apiNames= Opportunity.sObjectType.getDescribe().fields.getMap();
        opportunity opp= [select id,name,Amount,Type from opportunity where id =: recordId];
        String blankfieldApinames='';
        for(String key:apiNames.keyset()){
            sObjectField field=apiNames.get(key);if(customData.contains(String.valueOf(apiNames.get(key))) && opp.get(String.valueOf(apiNames.get(key)))==null)blankfieldApinames+=String.valueOf(apiNames.get(key))+','; //opp.put(field,null);
        }
        blankfieldApinames=blankfieldApinames.removeEnd(',');
        System.debug('opp::'+opp); System.debug('blankfieldApinames::'+blankfieldApinames);
        if(blankfieldApinames!=null && blankfieldApinames!='') throw new AuraHandledException(blankfieldApinames+' Field Values Are Blank On Opportunity Record');
        return opp;
    }
}
