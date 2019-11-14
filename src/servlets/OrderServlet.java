package servlets;

import models.Address;
import models.Booking;
import models.Customer;
import models.Product;
import services.AddressService;
import services.BookingService;
import services.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/order")
public class OrderServlet extends HttpServlet {

    private BookingService bookingService;
    private ProductService productService;
    private AddressService addressService;
    private Customer customer;
    private Product product;

    @Override
    public void init() {
        bookingService = new BookingService();
        productService = new ProductService();
        addressService = new AddressService();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response){
//        product = productService.findProductBy(
//                Integer.parseInt(request.getParameter("id")));
        try {
            //проверить авторизован ли пользователь
            customer = (Customer) request.getSession().getAttribute("currentUser");
            if (customer != null) {
                request.getServletContext().getRequestDispatcher("/jsp/order.jsp").forward(request, response);
            }
            else {
                response.sendRedirect("/login");
            }
        }
        catch (IOException | ServletException e) {
            throw new IllegalArgumentException(e);
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response){
        try {
        Address address = new Address(request.getParameter("area"), request.getParameter("region"),
                request.getParameter("locality"), request.getParameter("street"),
                Integer.parseInt(request.getParameter("home_number")),Integer.parseInt(request.getParameter("apartment")) );
        addressService.addAddress(address);

        Booking booking = new Booking(customer.getId(),product.getPrice(),1, address.getId(),
                request.getParameter("payment"), request.getParameter("delivery"),
                request.getParameter("info"));

        bookingService.addBooking(booking);

        request.setAttribute("booking", booking);
        request.getServletContext().getRequestDispatcher("/successful_order").forward(request, response);
        } catch (ServletException | IOException e) {
            throw new IllegalArgumentException(e);
        }

    }


}
