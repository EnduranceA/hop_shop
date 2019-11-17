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
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;


@WebServlet("/order")
public class OrderServlet extends HttpServlet {

    private BookingService bookingService;
    private ProductService productService;
    private AddressService addressService;
    private Customer customer;
    private List<Product> basket;
    private int amount;

    @Override
    public void init() {
        bookingService = new BookingService();
        productService = new ProductService();
        addressService = new AddressService();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response){
        basket = productService.findBasket(
                Integer.parseInt(request.getParameter("basket")));
        try {
            //проверить авторизован ли пользователь
            customer = (Customer) request.getSession().getAttribute("currentUser");
            if (customer != null) {
                request.setAttribute("basket", basket);
                amount = 0;
                for (int i = 0; i < basket.size(); i++) {
                    amount += basket.get(i).getPrice();
                }
                request.setAttribute("amount", amount);
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
            HttpSession session = request.getSession();
            Address address = new Address(
                    request.getParameter("area"),
                    request.getParameter("region"),
                    request.getParameter("locality"),
                    request.getParameter("street"),
                    Integer.parseInt(request.getParameter("home_number")),
                    Integer.parseInt(request.getParameter("apartment"))
            );
            addressService.add(address);

            Booking booking = new Booking(customer.getId(), amount,1, address.getId(),
                    request.getParameter("payment"), request.getParameter("delivery"),
                    request.getParameter("info"));

            bookingService.addBooking(booking);
            bookingService.saveProducts(booking, basket);
            session.setAttribute("booking", booking);

            productService.removeProductsFromBasket(customer.getId());
            session.removeAttribute("basket");

            request.getServletContext().getRequestDispatcher("/jsp/successful_order.jsp").forward(request, response);
        }
        catch (ServletException | IOException e) {
            throw new IllegalArgumentException(e);
        }

    }


}
