package org.mifos.application.customer.center.business.service;

import org.mifos.application.customer.center.business.CenterBO;
import org.mifos.application.customer.center.persistence.CenterPersistence;
import org.mifos.framework.business.BusinessObject;
import org.mifos.framework.business.service.BusinessService;
import org.mifos.framework.exceptions.PersistenceException;
import org.mifos.framework.exceptions.ServiceException;
import org.mifos.framework.hibernate.helper.QueryResult;
import org.mifos.framework.security.util.UserContext;

public class CenterBusinessService extends BusinessService {

	@Override
	public BusinessObject getBusinessObject(UserContext userContext) {
		return null;
	}

	public CenterBO getCenter(Integer customerId) throws ServiceException {
		try {
			return new CenterPersistence().getCenter(customerId);
		} catch (PersistenceException pe) {
			throw new ServiceException(pe);
		}
	}

	public CenterBO findBySystemId(String globalCustNum)
			throws ServiceException {
		try {
			return new CenterPersistence().findBySystemId(globalCustNum);
		} catch (PersistenceException pe) {
			throw new ServiceException(pe);
		}
	}
	
	public QueryResult search(String searchString,Short userId)throws ServiceException {
		
		try {
			return new CenterPersistence().search(searchString,userId);
		} catch (PersistenceException e) {
			throw new ServiceException(e);
		}
	}
}
