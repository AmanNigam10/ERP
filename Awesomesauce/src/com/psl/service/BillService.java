package com.psl.service;

import java.sql.Date;

import com.psl.dao.DataManager;
import com.psl.model.Bill;

public class BillService {
	private DataManager dao;

	public DataManager getDao() {
		return dao;
	}

	public void setDao(DataManager dao) {
		this.dao = dao;
	}
	public boolean setBill(Bill bill) {
		return dao.setBill(bill);
	}
	public Date getBill(long billID) {
		return dao.getBill(billID);
	}
}
