/** SpagoBI, the Open Source Business Intelligence suite
 * Copyright (C) 2012 Engineering Ingegneria Informatica S.p.A. - SpagoBI Competency Center
 * This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0, without the "Incompatible With Secondary Licenses" notice. 
 * If a copy of the MPL was not distributed with this file, You can obtain one at http://mozilla.org/MPL/2.0/. **/

/**
 * 
 * This class is the container for the ad-hoc reporting interface 
 *    
 *  @author
 *  Alberto Ghedin (alberto.ghedin@eng.it)
 *  Davide Zerbetto (davide.zerbetto@eng.it)
 */
 
  
Ext.define('Sbi.adhocreporting.AdhocreportingTabsPanel', {
	//extend: 'Ext.tab.Panel',
	extend: 'Ext.Panel',

    config: {
    	executionPanel: null,
    	myAnalysisServicePath : ''
    }
	
	
	, constructor : function(config) {
		this.initConfig(config);
		
		this.layout = 'fit';

		
		var myAnalysisBrowserConf = {
				 user: Sbi.user.userId
				, myAnalysisServicePath: config.myAnalysisServicePath
				, id: 'this'

		};
		
		this.myAnalysisBrowser = Ext.create('Sbi.adhocreporting.MyAnalysisBrowser',myAnalysisBrowserConf);
		
		
		this.items = [ this.myAnalysisBrowser ];

		this.callParent(arguments);
		this.addEvents(
		        /**
		         * @event event1
		         * Execute the qbe clicking in the model/dataset
				 * @param {Object} docType engine to execute 'QBE'/'WORKSHEET'/'COCKPIT'
				 * @param {Object} inputType 'DOCUMENT'
				 * @param {Object} record the record that contains all the information of the document
		         */
		        'executeDocument'
				);
		this.myAnalysisBrowser.on('executeDocument',function(docType, inputType,  record){
			this.fireEvent('executeDocument',docType, inputType,  record);
		},this);

	}

    
	
});