package services;

import models.Booking;
import models.Product;
import repositories.BookingRepositoryImpl;

import java.util.List;

public class BookingService {

    private BookingRepositoryImpl bookingRepository;

    public BookingService() {
        this.bookingRepository = new BookingRepositoryImpl();
    }

    public void addBooking(Booking booking) {
        bookingRepository.save(booking);
    }

    public void saveProducts(Booking booking, List<Product> basket) {
        for (int i = 0; i < basket.size(); i++) {
            bookingRepository.saveProduct(booking.getId(), basket.get(i).getId());
        }
    }
}
