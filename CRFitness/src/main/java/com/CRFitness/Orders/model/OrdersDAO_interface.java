package com.CRFitness.Orders.model;

import java.util.List;

public interface OrdersDAO_interface {

    public OrdersVO insert(OrdersVO ordersVO);
    public boolean update(OrdersVO ordersVO);
    public boolean delete(String order_Id);       
    public OrdersVO findByPrimaryKey(String order_Id);
    public List<OrdersVO> getAll();
    public List<OrdersVO> findOrdersByMember_Id(String member_Id);
}
