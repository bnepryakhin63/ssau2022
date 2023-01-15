package com.example.repository;

import com.example.domain.Order;
import java.util.List;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

@Stateless
public class OrderRepository {

    @PersistenceContext
    private EntityManager entityManager;

    public OrderRepository() {
    }

    public List<Order> getOrders() {
        return entityManager.createQuery("SELECT o FROM order o").getResultList();
    }

    public void addOrder(Order order) {
        entityManager.merge(order);
    }

    public void deleteOrder(int id) {
        Order order = entityManager.find(Order.class, id);
        entityManager.remove(order);
    }
}