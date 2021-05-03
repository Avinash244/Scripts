// apex script  to populate custom metadata values
Metadata.DeployContainer container = new Metadata.DeployContainer();
//container.addMetadata(customMetadata);
 
Metadata.CustomMetadata cmd=new Metadata.CustomMetadata();
cmd.fullName='Price_Tag.'+'DefaultPriceTag';
cmd.label='DefaultPriceTag';

Metadata.CustomMetadataValue customMetadataValue=new Metadata.CustomMetadataValue();
customMetadataValue.field='Discount__c';
customMetadataValue.value=10;
cmd.values.add(customMetadataValue);

container.addMetadata(cmd);


Metadata.CustomMetadataValue customMetadataValue2=new Metadata.CustomMetadataValue();
customMetadataValue2.field='Rate__c';
customMetadataValue2.value=20;
cmd.values.add(customMetadataValue2);

container.addMetadata(cmd);

Id asyncId=Metadata.Operations.enqueueDeployment(container,null);
System.debug('asyncId>'+asyncId);
