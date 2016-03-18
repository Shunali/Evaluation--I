public with sharing class AccountController
{
    Apexpages.StandardController controller;
    public AccountController(Apexpages.StandardController c)
    {
        controller = c;
    }
 
    public PageReference save() 
    {
        controller.save();//invoke standard Save method
        id Pageid = ApexPages.currentPage().getParameters().get('id');
        string url = 'https://ap2.salesforce.com/apex/accountPage3?id='+Pageid;
        PageReference newpage=new PageReference(url);
        return newpage;//refresh current page
    }
 }