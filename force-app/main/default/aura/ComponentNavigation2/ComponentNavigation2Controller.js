({
	// doInIt : function(component, event, helper) {
	// 	 var id = component.get("v.pageReference").state.message; 
    //              var toastEvent=$A.get('e.force:showToast');
    //                 toastEvent.setParams({
    //                   title:'Rendering page',
    //                   message:id,
    //                   key:'info_alt',
    //                   type:'info',
    //                   mode:'pester'
    //            });
    //     toastEvent.fire();
    // },
    backToComponentNavigation: function(component, event, helper) {
    //     var navService = cmp.find("navService2");
    //     var pageReference = {
    //                         "type": "standard__component",
    //                         "attributes": {
    //                                         "componentName": "c__ComponentNavigation"
    //                                       }, 
    //                         "state": {
    //                             'message':'This is the previous page'
    //                         }
    //                        };
    //     navService.navigate(pageReference);

        // gets the <lightning:navigation> tag on the component
    //    let navService = component.find("navService2");
    //    let pageReference = {
    //        type: "comm__namedPage", // community page. See https://developer.salesforce.com/docs/atlas.en-us.lightning.meta/lightning/components_navigation_page_definitions.htm
    //        attributes: {
    //            pageName: 'sample' // pageName must be lower case
    //        }
    //    }

    //    navService.navigate(pageReference);


    var urlEvent = $A.get("e.force:navigateToURL");
    urlEvent.setParams({
     // "url": "https://arpit1992-dev-ed--sitestudio.ap7.force.com/sfsites/picasso/core/config/commeditor.jsp?exitURL=https%3A%2F%2Farpit1992-dev-ed.my.salesforce.com%2Fservlet%2Fnetworks%2Fswitch%3FnetworkId%3D0DB0I000000CfG8%26startURL%3D%252FcommunitySetup%252FcwApp.app%2523%252Fc%252Fhome"
   "url":"https://arpit1992-dev-ed--c.ap7.visual.force.com/apex/showAuraMap" });
    urlEvent.fire();
       }
})