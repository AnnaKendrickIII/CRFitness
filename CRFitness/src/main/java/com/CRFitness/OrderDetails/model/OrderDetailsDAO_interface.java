package com.CRFitness.OrderDetails.model;

import java.util.List;

import com.CRFitness.Orders.model.OrdersVO;

public interface OrderDetailsDAO_interface {

	public boolean insert(OrderDetailsVO orderDetailsVO);
	public boolean update(OrderDetailsVO orderDetailsVO);
	public boolean delete(String details_No);
	public OrderDetailsVO findByPrimaryKey(String details_No);
	public List<OrderDetailsVO> getAll();
	public List<OrderDetailsVO> findByOrder_Id(String order_Id);

}
