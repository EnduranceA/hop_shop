package services;

import models.Booking;
import repositories.BookingRepositoryImpl;

public class BookingService {

    private BookingRepositoryImpl bookingRepository;

    public BookingService() {
        this.bookingRepository = new BookingRepositoryImpl();
    }

    public void addBooking(Booking booking) {
        bookingRepository.save(booking);
    }

}
