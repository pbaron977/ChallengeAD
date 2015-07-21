AD Challenge V0.1

@jualuna: Read this before deploy this branch into your Adobe CQ5.
 
My project uses org.json.simple.JSONObject in some Sling Servlets for encoding submitted data into JSON formatted data. That’s why you need to add the org.json.simple.JSONObject class to Adobe CQ. 

First of all, download the json-simple JAR from the following URL: 
https://code.google.com/p/json-simple/
Note: Download version json-simple-1.1.1.jar.

Follow next steps to do install it into your Adobe CQ instance:

1. Start Eclipse. The steps below have been tested on Eclipse Java EE IDE for Web Developers version Indigo, Keppler and Luna.

2. Select File, New, Other.

3. Under the Plug-in Development folder, choose Plug-in from Existing JAR Archives. Name your project jsonBundle.

4. In the JAR selection dialog, click the Add external button, and browse to the json-simple JAR file that you downloaded.

5. Click Next.

6. In the Plug-in Project properties dialog, ensure that you check the checkbox for Analyze library contents and add dependencies.

7. Make sure that the Target Platform is the standard OSGi framework.

8. Ensure the checkboxes for Unzip the JAR archives into the project and Update references to the JAR files are both checked.

9. Click Next, and then Finish.

10. Click the Runtime tab.

11. Make sure that the Exported Packages list is populated.

12. Make sure these packages have been added under the Export-Package header in MANIFEST.MF. Remove the version information in the MANIFEST.MF file. Version numbers can cause conflicts when you upload the OSGi bundle to Adobe CQ.

13. Also make sure that the Import-Package header in MANIFEST.MF is also populated, as shown here (notice that Export-Package is org.json.simple).

Manifest-Version: 1.0
Bundle-ManifestVersion: 2
Bundle-Name: JsonObject
Bundle-SymbolicName: jsonObject
Bundle-Version: 1.0.0
Export-Package: org.json.simple,
org.json.simple.parser
Bundle-RequiredExecutionEnvironment: JavaSE-1.6

14. Save the project.

15. Build the OSGi bundle by right-clicking the project in the left pane, choose Export, Plug-in Development, Deployable plug-ins and fragments, and click Next.

16. Select a location for the export (C:\TEMP) and click Finish. (Ignore any error messages).

17. In C:\TEMP\plugins, you should now find the OSGi bundle.

18. Login to Adobe CQ’s Apache Felix Web Console at http://server:port/system/console/bundles (default admin user = admin with password= admin).

19. Sort the bundle list by Id and note the Id of the last bundle.

20. Click the Install/Update button.

21. Check the Start Bundle checkbox.

22. Browse to the bundle JAR file you just built. (C:\TEMP\plugins).

23. Click Install.

24. Click the Refresh Packages button.

25. Check the bundle with the highest Id.

26. Your new bundle should now be listed with the status Active.

27. If the status is not Active, check the CQ error.log for exceptions. If you get “org.osgi.framework.BundleException: Unresolved constraint” errors, check the MANIFEST.MF for strict version requirements which might follow: javax.xml.namespace; version=”3.1.0”

28. If the version requirement causes problems, remove it so that the entry looks like this: javax.xml.namespace.

29. If the entry is not required, remove it entirely.

30. Rebuild the bundle.

31. Delete the previous bundle and deploy the new one.
 
