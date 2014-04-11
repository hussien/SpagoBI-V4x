/* SpagoBI, the Open Source Business Intelligence suite

 * Copyright (C) 2012 Engineering Ingegneria Informatica S.p.A. - SpagoBI Competency Center
 * This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0, without the "Incompatible With Secondary Licenses" notice. 
 * If a copy of the MPL was not distributed with this file, You can obtain one at http://mozilla.org/MPL/2.0/. */

/**
 * @author Zerbetto Davide (davide.zerbetto@eng.it)
 */

package it.eng.spagobi.engines.whatif.model.transform;

import it.eng.spagobi.engines.whatif.model.SpagoBICellSetWrapper;

import org.olap4j.metadata.Member;

public abstract class AllocationAlgorithm {
	
	public abstract String getName();

	public abstract void apply(Member[] members, Object oldValue, Object newValue,
			SpagoBICellSetWrapper spagoBICellSetWrapper);

}
