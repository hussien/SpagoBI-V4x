<%-- SpagoBI, the Open Source Business Intelligence suite

 Copyright (C) 2012 Engineering Ingegneria Informatica S.p.A. - SpagoBI Competency Center
 This Source Code Form is subject to the terms of the Mozilla Public
 License, v. 2.0, without the "Incompatible With Secondary Licenses" notice.  If a copy of the MPL was not distributed with this file,
 You can obtain one at http://mozilla.org/MPL/2.0/. --%>

<%-- 
author: Andrea Gioia (andrea.gioia@eng.it)
--%>
<%@page import="it.eng.spago.security.IEngUserProfile"%>

<%@ page language="java" 
	     contentType="text/html; charset=UTF-8" 
	     pageEncoding="UTF-8"%>	


<%-- ---------------------------------------------------------------------- --%>
<%-- JAVA IMPORTS															--%>
<%-- ---------------------------------------------------------------------- --%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="it.eng.spagobi.engine.cockpit.CockpitEngineInstance"%>
<%@page import="it.eng.spagobi.utilities.engines.EngineConstants"%>


<%-- ---------------------------------------------------------------------- --%>
<%-- JAVA CODE 																--%>
<%-- ---------------------------------------------------------------------- --%>
<% 
	CockpitEngineInstance engineInstance;
	Map env;
	String executionRole;
	Locale locale;
	String template;
	String docLabel;
	String docVersion;
	String docAuthor;
	String docName;
	String docDescription;
	String docIsPublic;
	String docIsVisible;
	String docPreviewFile;
	String[] docCommunities;
	String docCommunity;
	List docFunctionalities;
	String userId;
	List<String> includes;

	engineInstance = (CockpitEngineInstance)request.getSession().getAttribute(EngineConstants.ENGINE_INSTANCE);
	env = engineInstance.getEnv();
	locale = engineInstance.getLocale();

	executionRole = (String)env.get(EngineConstants.ENV_EXECUTION_ROLE);
	userId = (engineInstance.getDocumentUser()==null)?"":engineInstance.getDocumentUser().toString();
	//template = engineInstance.getGuiSettings().toString();
	template = "{}";
	docLabel = (engineInstance.getDocumentLabel()==null)?"":engineInstance.getDocumentLabel().toString();
	docVersion = (engineInstance.getDocumentVersion()==null)?"":engineInstance.getDocumentVersion().toString();
	docAuthor = (engineInstance.getDocumentAuthor()==null)?"":engineInstance.getDocumentAuthor().toString();
	docName = (engineInstance.getDocumentName()==null)?"":engineInstance.getDocumentName().toString();
	docDescription = (engineInstance.getDocumentDescription()==null)?"":engineInstance.getDocumentDescription().toString();
	docIsPublic= (engineInstance.getDocumentIsPublic()==null)?"":engineInstance.getDocumentIsPublic().toString();
	docIsVisible= (engineInstance.getDocumentIsVisible()==null)?"":engineInstance.getDocumentIsVisible().toString();
	docPreviewFile= (engineInstance.getDocumentPreviewFile()==null)?"":engineInstance.getDocumentPreviewFile().toString();	
	docCommunities= (engineInstance.getDocumentCommunities()==null)?null:engineInstance.getDocumentCommunities();
	docCommunity = (docCommunities == null || docCommunities.length == 0) ? "": docCommunities[0];
	docFunctionalities= (engineInstance.getDocumentFunctionalities()==null)?new ArrayList():engineInstance.getDocumentFunctionalities();
	
	boolean forceIE8Compatibility = false;
%>

<%-- ---------------------------------------------------------------------- --%>
<%-- HTML	 																--%>
<%-- ---------------------------------------------------------------------- --%>
<html>
	<%-- == HEAD ========================================================== --%>
	<head>
		<title><%=docName.trim().length() > 0? docName: "SpagoBICockpitEngine"%></title>
		
		<% if (forceIE8Compatibility == true){ %> 
			<meta http-equiv="X-UA-Compatible" content="IE=8" />
		<%} %>
		
       
        <%@include file="commons/includeExtJS.jspf" %>
		<%@include file="commons/includeSpagoBICockpitJS.jspf" %>
    </head>
	
	<%-- == BODY ========================================================== --%>
    
    <body>
    
	
	<%-- == JAVASCRIPTS  ===================================================== --%>
	<script language="javascript" type="text/javascript">

		Sbi.template = <%= template %>;

		Sbi.config = {};
		var url = {
			protocol: '<%= request.getScheme()%>'   
		    , host: '<%= request.getServerName()%>'
		    , port: '<%= request.getServerPort()%>'
		    , contextPath: '<%= request.getContextPath().startsWith("/")||request.getContextPath().startsWith("\\")?request.getContextPath().substring(1): request.getContextPath()%>'
		    , controllerPath: null // no cotroller just servlets   
		};
	
		var params = { };
	
		Sbi.config.serviceRegistry = new Sbi.service.ServiceRegistry({
		  	baseUrl: url
		    , baseParams: params
		});

		Sbi.config.docLabel ="<%=docLabel%>";
		Sbi.config.docVersion = "<%=docVersion%>";
		Sbi.config.userId = "<%=userId%>";
		Sbi.config.docAuthor = "<%=docAuthor%>";
		Sbi.config.docName = "<%=docName.replace('\n', ' ')%>";
		Sbi.config.docDescription = "<%=docDescription.replace('\n', ' ')%>";
		Sbi.config.docIsPublic= "<%=docIsPublic%>";
		Sbi.config.docIsVisible= "<%=docIsVisible%>";
		Sbi.config.docPreviewFile= "<%=docPreviewFile%>";
		Sbi.config.docCommunities= "<%=docCommunity%>";
		Sbi.config.docFunctionalities= <%=docFunctionalities%>;
	    
		var cockpitPanel = null;
		    
		Ext.onReady(function(){
					
			Ext.QuickTips.init();   
				
			cockpitPanel = new Sbi.cockpit.MainPanel(Sbi.template);	
				
			var viewport = new Ext.Viewport({
				id:    'view',
		   		layout: 'fit',
		        items: [cockpitPanel]
			});
		});
	
	</script>
	
	</body>

</html>
