/** SpagoBI, the Open Source Business Intelligence suite

 * Copyright (C) 2012 Engineering Ingegneria Informatica S.p.A. - SpagoBI Competency Center
 * This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0, without the "Incompatible With Secondary Licenses" notice. 
 * If a copy of the MPL was not distributed with this file, You can obtain one at http://mozilla.org/MPL/2.0/. **/

Ext.ns("Sbi.cockpit.editor");

Sbi.cockpit.editor.WidgetEditorDesignerPalette = function(config) { 

	var defaultSettings = {
		border: false
	};

	if(Sbi.settings && Sbi.cockpit && Sbi.cockpit.editor && Sbi.cockpit.editor.widgetEditorDesignerPalette) {
		defaultSettings = Ext.apply(defaultSettings, Sbi.cockpit.editor.widgetEditorDesignerPalette);
	}

	var c = Ext.apply(defaultSettings, config || {});

	Ext.apply(this, c);

	c = this.initPanel();
	Sbi.cockpit.editor.WidgetEditorDesignerPalette.superclass.constructor.call(this, c);	 		

};

Ext.extend(Sbi.cockpit.editor.WidgetEditorDesignerPalette, Ext.Panel, {
	
	initPanel:function(){

		var store = new Ext.data.ArrayStore({
			fields: ['name', 'url'],
			data   : this.getAvailablePallettes()
		});

		this.tpl = new Ext.Template(
				'<tpl for=".">',

				'<div  style="float: left; clear: left; padding-bottom: 10px;">',
					'<div style="float: left;"><img src="{0}" title="{1}" width="40"></div>',
					'<div style="float: left; padding-top:10px; padding-left:10px;">{1}</div>',
				'</div>',
	
				'</tpl>'
		);
		this.tpl.compile();
	    var fieldColumn = new Ext.grid.Column({
	    	width: 300
	    	, dataIndex: 'name'
	    	, hideable: false
	    	, hidden: false	
	    	, sortable: false
	   	    , renderer : function(value, metaData, record, rowIndex, colIndex, store){
	        	return this.tpl.apply(	
	        			[record.json.url, record.json.name]	);
	    	}
	        , scope: this
	    });
	    this.cm = new Ext.grid.ColumnModel([fieldColumn]);

		var conf = {
			title : 'Palette',
			autoScroll : true,
			border : false,
				items : [ new Ext.Panel({
					height : 342,
					border : false,
					style : 'padding-top: 0px; padding-left: 0px',
					items : [ new Ext.grid.GridPanel({
						ddGroup : 'paleteDDGroup',
						type : 'palette',
						header : false,
						hideHeaders : true,
						enableDragDrop : true,
						cm : this.cm,
						store : store,
						autoHeight : true
					}) ]
				}) ]
		};
	    
		return conf;

	},
	
	
	getAvailablePallettes:function(){
		var pallette = [];
		pallette.push({name: 'Bar Chart', url:'img/widgets/palette_bar_chart.png'});
		pallette.push({name: 'Pie Chart', url:'img/widgets/palette_pie_chart.png'});
		pallette.push({name: 'Line Chart', url:'img/widgets/palette_line_chart.png'});
		pallette.push({name: 'Table', url:'img/widgets/palette_table.png'});
		pallette.push({name: 'Pivot Table', url:'img/widgets/palette_crosstab.png'});	
		pallette.push({name: 'Static Pivot Table', url:'img/widgets/palette_crosstab.png'});
		return pallette;
	}

	
});