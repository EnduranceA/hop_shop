package services;

import models.Customer;
import repositories.CustomerRepositoryImpl;

import javax.servlet.ServletContext;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.util.Map;

public class CustomerService {

    private CustomerRepositoryImpl customerRepository;

    public CustomerService() {
        this.customerRepository = new CustomerRepositoryImpl();
    }

    public Customer findCustomer(String mail, String password) {
        return customerRepository.findCustomer(mail, password);
    }

    public void update(Customer customer, Map<String, String> map) {
        customerRepository.changeRow(customer, map);
    }

    public void addNewCustomer(ServletContext context, String firstName, String lastName, String patronymic, Part photo,
                               String mail, String password, String numberPhone) {
        //папка хранения изображений
        String localdir = "uploads";

        //берем абсолютный путь до папки
        String pathDir = context.getRealPath("") + File.separator + localdir;
        File dir = new File(pathDir);

        //проверяем, существует ли такая папка
        if (!dir.exists()) {
            dir.mkdir();
        }
        String[] filename_data = photo.getSubmittedFileName().split("\\.");

        //генерируем имя файла и берем формат изображения
        String filename = Math.random() + "." + filename_data[filename_data.length - 1];
        String fullpath = pathDir + File.separator + filename;
        try {
            photo.write(fullpath);
        } catch (IOException e) {
            throw new IllegalArgumentException(e);
        }
        Customer customer = new Customer(firstName, lastName, patronymic,
                mail, password, numberPhone, "/" + localdir + "/" + filename);
        customerRepository.save(customer);
    }

}
