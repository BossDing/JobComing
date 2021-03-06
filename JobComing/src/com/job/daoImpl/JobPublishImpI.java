
package com.job.daoImpl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import com.job.bean.JobPublish;
import com.job.dao.JobPublishDao;
import com.job.hibernate.CommonQuery;
public class JobPublishImpI implements JobPublishDao {
	private CommonQuery query = new CommonQuery();

	@Override
	/**
	 * 插入一条兼职发布信息
	 */
	public int add(String hql, Object[] params) {

		return query.update(hql, params);
	}

	/**
	 * 插入一条兼职发布信息
	 */
	public int add(JobPublish jp) {
		Session session = query.getSession();
		Serializable se = session.save(jp);
		query.release(session);
		if (se != null) {
			return 1;
		}
		return 0;

	}

	@Override
	/**
	 * 删除一条兼职发布信息
	 */
	public int delete(String hql, Object[] params) {

		return query.update(hql, params);
	}

	@Override
	/**
	 * 修改一条兼职发布信息
	 */
	public int update(String hql, Object[] params) {

		return query.update(hql, params);
	}

	/**
	 * 根据兼职信息编号删除一条兼职发布信息
	 */
	public int delete(int jobPublishId) {
		String hql = "delete from JobPublish where jobPublishId=?";
		Object[] params = new Object[] { jobPublishId };
		return delete(hql, params);
	}

	/**
	 * 返回一条兼职信息
	 */
	public JobPublish getJobPublish(String hql, Object[] params) {
		Object obj = query.getObj(hql, params);
		return obj == null ? null : (JobPublish) obj;
	}

	/**
	 * 根据兼职信息编号返回一条兼职信息
	 */
	public JobPublish getJobPublish(int jobPublishId) {
		String hql = "from JobPublish where jobPublishId=?";
		Object[] params = new Object[] { jobPublishId };
		return getJobPublish(hql, params);
	}

	/**
	 * 返回多条兼职信息
	 */
	public List<JobPublish> getJobPublishList(String hql, Object[] params) {
		List<JobPublish> list = new ArrayList<JobPublish>();
		List<Object> list2 = new ArrayList<Object>();
		list2 = query.selectForList(hql, params);
		for (int i = 0; i < list2.size(); i++) {
			list.add((JobPublish) list2.get(i));
		}
		return list;
	}

	/**
	 * 根据工作种类id返回多条兼职信息
	 */
	public List<JobPublish> getJobPublishList(int jobKindId) {
		String hql = "from JobPublish where jobKindId=?";
		Object[] params = new Object[] { jobKindId };
		return  getJobPublishList(hql, params);
		
	}

	/**
	 * 根据用户id返回多条兼职信息
	 */
	public List<JobPublish> getJPListByUserId(int userId) {
		String hql = "from JobPublish where userId=?";
		Object[] params = new Object[] { userId };
		return  getJobPublishList(hql, params);
	}
	/**
	 * 通过地址编号(省市区)返回多条兼职信息
	 */
	public List<JobPublish>getJPListByAddressNumber(int addressnumber){
		String hql = "from JobPublish where addressNumber=?  order by jobPublishTime desc ";
		Object[] params = new Object[] { addressnumber};
		return  getJobPublishList(hql, params);
	}
	/**
	 * 根据地址编号(省市区)返回分页兼职信息
	 * @param beginIndex
	 * @param endIndex
	 * @param addressNumber
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<JobPublish>getJPByPage(int beginIndex,int pagesize,int addressNumber){
		String hql="from JobPublish where addressNumber = ?  order by jobPublishTime desc ";
		Session session=query.getSession();
		Object[]params=new Object[]{addressNumber};
		Query myquery=query.getQuery(hql, params, session);
		myquery.setFirstResult(beginIndex);
		myquery.setMaxResults(pagesize);
		return myquery.list();
	}
	/**
	 * 根据地址编号(省市区) 种类编号返回分页兼职信息
	 * @param beginIndex
	 * @param endIndex
	 * @param addressNumber
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<JobPublish>getJPByJobKindPage(int beginIndex,int pagesize,int addressNumber,int jobKindId){
		String hql="from JobPublish where addressNumber = ? and jobKindId=?  order by jobPublishTime desc ";
		Session session=query.getSession();
		Object[]params=new Object[]{addressNumber,jobKindId};
		Query myquery=query.getQuery(hql, params, session);
		myquery.setFirstResult(beginIndex);
		myquery.setMaxResults(pagesize);
		return myquery.list();
	}
	/**
	 *  获取当天发布10条的信息
	 */
	@SuppressWarnings("unchecked")
	public List<JobPublish>getJBListByToday(Date morningTime){
		String hql="from JobPublish where jobPublishTime>? order by jobPublishTime desc ";
		Object[] params =new Object[] {morningTime};
		Session session=query.getSession();
		Query myquery=query.getQuery(hql, params, session);
		myquery.setFirstResult(0);
		myquery.setMaxResults(6);
		return myquery.list();
	}
	@SuppressWarnings("unchecked")
	/**
	 * 通过userId返回发布工作的集合
	 * @param beginIndex
	 * @param pagesize
	 * @param userId
	 * @return
	 */
	public List<JobPublish>getJBListByUserId(int beginIndex,int pagesize,int userId){
		String hql="from JobPublish where userId=?  order by jobPublishTime desc ";
		Session session=query.getSession();
		Object[]params=new Object[]{userId};
		Query myquery=query.getQuery(hql, params, session);
		myquery.setFirstResult(beginIndex);
		myquery.setMaxResults(pagesize);
		return myquery.list();
	}
	/**
	 * 通过用户id返回发布工作的个数
	 * @param userId
	 * @return
	 */
	public long getCountByUserId(int userId){
		String hql="select count(*) from JobPublish where userId=?";
		Object[] params=new Object[]{userId};
		Object object=query.getObj(hql, params);
		return object==null?0:(Long)object;
	}
}
