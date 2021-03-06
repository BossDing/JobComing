package com.job.daoImpl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;

import com.job.bean.ChatRecoed;
import com.job.dao.ChatRecordDao;
import com.job.hibernate.CommonQuery;

public class ChatRecordDaoImpI implements ChatRecordDao {
	private CommonQuery query = new CommonQuery();

	/**
	 * 添加一条聊天记录
	 */
	public int add(String hql, Object[] params) {

		return query.update(hql, params);
	}

	/**
	 * 根据聊天记录对象插入聊天记录表
	 */
	public int add(ChatRecoed cr) {
		Session session = query.getSession();
		Serializable se = session.save(cr);
		query.release(session);
		if (se != null) {
			return 1;
		}
		return 0;
	}

	@Override
	/**
	 * 删除一条聊天记录
	 */
	public int delete(String hql, Object[] params) {

		return query.update(hql, params);
	}

	@Override
	/**
	 * 修改一条聊天记录
	 */
	public int update(String hql, Object[] params) {

		return query.update(hql, params);
	}

	/**
	 * 返回一个聊天记录对象
	 * 
	 * @param hql
	 * @param params
	 * @return
	 */
	public ChatRecoed getChatRecord(String hql, Object[] params) {
		Object obj = query.getObj(hql, params);
		return obj == null ? null : (ChatRecoed) obj;
	}

	/**
	 * 返回一个聊天记录集合
	 */
	public List<ChatRecoed> getChatRecordList(String hql, Object[] params) {
		List<ChatRecoed> list = new ArrayList<>();
		List<Object> list2 = new ArrayList<>();
		list2 = query.selectForList(hql, params);
		for (int i = 0; i < list2.size(); i++) {
			list.add((ChatRecoed) list2.get(i));
		}
		return list;
	}
}
