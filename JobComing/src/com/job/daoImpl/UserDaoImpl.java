package com.job.daoImpl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;

import com.job.bean.User;
import com.job.dao.UserDao;
import com.job.hibernate.CommonQuery;

public class UserDaoImpl implements UserDao {

	private CommonQuery query = new CommonQuery();
	
	@Override
	/**
	 * 增加一个用户
	 */
	public int add(String hql, Object[] params) {
		
		return query.update(hql, params);
		
	}
	/**
	 * 插入一个用户
	 * @param user
	 * @return
	 */
	public int add(User user){
		Session session = query.getSession();
		Serializable se = session.save(user);
		query.release(session);
		if(se!=null){
			return 1;
		}
		return 0;
	}
	@Override
	/**
	 * 删除一个用户
	 */
	public int delete(String hql, Object[] params) {
		return query.update(hql, params);
		
	}

	@Override
	/**
	 * 更新用户信息
	 */
	public int update(String hql, Object[] params) {
		// TODO Auto-generated method stub
		return query.update(hql, params);
	}
	/**
	 * 修改用户头像
	 */
	public int update(String headPicture,int userId){
		String hql="update User set headPicture=?where userId=?";
		Object[]params=new Object[]{headPicture,userId};
	    return	update(hql, params);
	}
	/**
	 * 返回一个用户对象
	 */
	public User getUser(String hql, Object[] params) {
		Object obj = query.getObj(hql, params);
		return obj==null?null:(User)obj;
	}

	/**
	 * 返回一个用户集合
	 * @param hql
	 * @param params
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<User> getUserList(String hql, Object[] params) {
		List<User> list = new ArrayList<User>();
		list=(List<User>) query.getObj(hql, params);
		return list;
		
	}
	/**
	 * 通过用户Id返回一个用户对象
	 * @param userId
	 * @return
	 */
	public User getUser(int userId){
		String hql = "from User where userId=?";
		Object[]  params = new Object[]{userId};
		return getUser( hql, params);
	}
	/**
	 * 通过用户姓名返回一个用户对象
	 * @param userName
	 * @return
	 */
	public User getUser(String userName){
		String hql="from User where userName=?";
		Object[] params=new Object[]{userName};
		return getUser(hql, params);
	}
	
}