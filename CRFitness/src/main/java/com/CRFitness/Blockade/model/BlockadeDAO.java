package com.CRFitness.Blockade.model;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Transactional(transactionManager="transactionManager")
@Repository("blockadeDAO")
public class BlockadeDAO implements BlockadeDAO_interface {

	private static final String GET_ALL_STMT = "from BlockadeVO";
	@Autowired
	private SessionFactory sessionFactory;
	
	public BlockadeDAO(){
		
	}
	
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	@Override
	public boolean insert(BlockadeVO blockadeVO) {
		if(blockadeVO != null) {
			this.getSession().saveOrUpdate(blockadeVO);
			return true;
		}
		return false;
	}

	@Override
	public boolean update(BlockadeVO blockadeVO) {
		if (blockadeVO != null) {
			this.getSession().saveOrUpdate(blockadeVO);
			return true;
		}		
		return false;
	}

	@Override
	public boolean delete(String member_Id,String blockade_Id) {
		BlockadeVO blockadeVO=new BlockadeVO();
		blockadeVO.setMember_Id(member_Id);
		blockadeVO.setBlockade_Id(blockade_Id);
		BlockadeVO blockadeVOs = (BlockadeVO) this.getSession().get(BlockadeVO.class,
				blockadeVO);
		if (blockadeVOs != null) {
			this.getSession().delete(blockadeVOs);
			return true;
		}
		return false;
	}

	@Override
	public BlockadeVO findByPrimaryKey(String member_Id,String blockade_Id) {
		BlockadeVO blockadeVO=new BlockadeVO();
		blockadeVO.setMember_Id(member_Id);
		blockadeVO.setBlockade_Id(blockade_Id);
		return (BlockadeVO) this.getSession().get(BlockadeVO.class, blockadeVO);
	}

	@Override
	public List<BlockadeVO> getAll() {
		Query query = this.getSession().createQuery(GET_ALL_STMT);
	return (List<BlockadeVO>) query.list();
	}

}
