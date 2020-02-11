package com.santeamo.service;

import com.santeamo.model.Order;
import com.santeamo.model.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

/**
 * The interface Order service.
 */
public interface OrderService extends BaseService {
    /**
     * Find orders page.
     *
     * @param user     the user
     * @param pageable the pageable
     * @return the page
     * @author 沈玏
     */
    Page<Order> findOrders(User user, Pageable pageable);

    /**
     * Findnot done orders page.
     *
     * @param user     the user
     * @param pageable the pageable
     * @return the page
     * @author 沈玏
     */
    Page<Order> findnotDoneOrders(User user, Pageable pageable);

    /**
     * Find done orders page.
     *
     * @param user     the user
     * @param pageable the pageable
     * @return the page
     * @author 沈玏
     */
    Page<Order> findDoneOrders(User user, Pageable pageable);

    /**
     * Find order by o id and user order.
     *
     * @param oid  the oid
     * @param user the user
     * @return the order
     * @author 沈玏
     */
    Order findOrderByOIdAndUser(String oid, User user);

    /**
     * Create order boolean.
     *
     * @param order  the order
     * @param cartId the cart id
     * @return the boolean
     * @author 沈玏
     */
    Boolean createOrder(Order order,String cartId);

    /**
     * Confirm order boolean.
     *
     * @param order the order
     * @return the boolean
     * @author 沈玏
     */
    Boolean confirmOrder(Order order);

    /**
     * Pay order boolean.
     *
     * @param orderId the order id
     * @return the boolean
     * @author 沈玏
     */
    Boolean payOrder(String orderId);

    /**
     * Sign order boolean.
     *
     * @param orderId the order id
     * @return the boolean
     * @author 沈玏
     */
    Boolean signOrder(String orderId);

    /**
     * Send out boolean.
     *
     * @param orderId the order id
     * @return the boolean
     * @author 沈玏
     */
    Boolean sendOut(String orderId);
}
