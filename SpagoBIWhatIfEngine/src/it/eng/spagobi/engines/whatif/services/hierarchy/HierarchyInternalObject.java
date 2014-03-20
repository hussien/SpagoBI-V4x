 /* SpagoBI, the Open Source Business Intelligence suite

 * Copyright (C) 2012 Engineering Ingegneria Informatica S.p.A. - SpagoBI Competency Center
 * This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0, without the "Incompatible With Secondary Licenses" notice. 
 * If a copy of the MPL was not distributed with this file, You can obtain one at http://mozilla.org/MPL/2.0/. */
/**
 * @author Alberto Ghedin (alberto.ghedin@eng.it)
 */
package it.eng.spagobi.engines.whatif.services.hierarchy;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;



public class HierarchyInternalObject {
	private String name;
	private String uniqueName;
	private int position;
	private int axis;
	private List<Map<String,String>> slicers;
	
	
	
	public HierarchyInternalObject(String name, String uniqueName,
			int position, int axis) {
		super();
		this.name = name;
		this.uniqueName = uniqueName;
		this.position = position;
		this.axis = axis;
		slicers= new ArrayList<Map<String,String>>(); 
	}
	
	
	
	public HierarchyInternalObject(String name, String uniqueName,
			int position, int axis, List<Map<String, String>> slicers) {
		super();
		this.name = name;
		this.uniqueName = uniqueName;
		this.position = position;
		this.axis = axis;
		this.slicers = slicers;
	}



	public List<Map<String, String>> getSlicers() {
		return slicers;
	}



	public void setSlicers(List<Map<String, String>> slicers) {
		this.slicers = slicers;
	}



	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUniqueName() {
		return uniqueName;
	}
	public void setUniqueName(String uniqueName) {
		this.uniqueName = uniqueName;
	}
	public int getPosition() {
		return position;
	}
	public void setPosition(int position) {
		this.position = position;
	}
	public int getAxis() {
		return axis;
	}
	public void setAxis(int axis) {
		this.axis = axis;
	}
	
	
}
