package com.job.daoImpl;

import java.io.Serializable;

import org.hibernate.Session;

import com.job.bean.RelationShip;
import com.job.dao.RelationShipDao;
import com.job.hibernate.CommonQuery;


public class RelationShipDaoImpl implements RelationShipDao {
	private CommonQuery query=new CommonQuery();
	/**
	 * 添加一条关注记录
	 */
	@Override
	public int add(String hql, Object[] params) {
	
		return query.update(hql, params);
	}
	/**
	 * 根据一个关注对象添加一条关注记录
	 * @param rs
	 * @return
	 */
	@SuppressWarnings("unused")
	private int add(RelationShip rs){
		Session session = query.getSession();
		Serializable se = session.save(rs);
		query.release(session);
		if(se!=null){
			return 1;
		}
		return 0;
	}
	@Override
	/**
	 * 删除一个关注记录
	 */
	public int delete(String hql, Object[] params) {
		
		return query.update(hql, params);
	}

	@Override
	/**
	 * 更新一个关注记录
	 */
	public int update(String hql, Object[] params) {
		
		return query.update(hql, params);
	}
	/**
	 * 根据关注记录编号删除一条记录
	 * @param relationShipId
	 * @return
	 */
	public int delete(int relationShipId){
		String hql="delete from RelationShip where relationShipId=?";
		Object[]params=new Object[]{relationShipId};
		return delete(hql, params);
	}
}