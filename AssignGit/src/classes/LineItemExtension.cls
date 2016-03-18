public class LineItemExtension
{

 public List<Line_item__c> Listitems = new List<Line_item__c>();
 public String currentId {get;set;}
   
    
    ApexPages.StandardController sc1;     
    public LineItemExtension(ApexPages.StandardController controller)
    {
        currentId=ApexPages.currentPage().getParameters().get('id');
        system.debug('^^^'+currentId);
    }
   
  public List<Line_item__c> getListLabor()
    {
    list<Line_item__c> Listitems = [select Service_Fee__c,Tax__c,New_client_discount__c,Product_Name__c,Labour__c from Line_Item__c where InvoiceStatement__c =: currentId];
        system.debug(Listitems);
        return Listitems ;

        
    }
    
  
}