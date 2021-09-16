<aura:application extends="force:slds">
 
    <!-- Include the SLDS static resource (adjust to match package version) -->
    <ltng:require styles="{!$Resource.SLDS1 +
         '/assets/styles/salesforce-lightning-design-system-ltng.css'}"/>
 
    <!-- Add the "scoping" element to activate SLDS on components
         that we add inside it. -->
    <div class="slds">
       
        <!-- This component is the real "app" -->
        <c:expenses />
       
    </div>
    <!-- / SLDS SCOPING DIV -->
 
</aura:application>