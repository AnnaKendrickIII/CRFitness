package com.CRFitness.Blockade.model;

import java.util.List;

public interface BlockadeDAO_interface {

    public boolean insert(BlockadeVO blockadeVO);
    public boolean update(BlockadeVO blockadeVO);
    public boolean delete(String member_Id,String blockade_Id);       
    public BlockadeVO findByPrimaryKey(String member_Id,String blockade_Id);
    public List<BlockadeVO> getAll();

}
