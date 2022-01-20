package com.david.auth.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.david.auth.models.Book;
import com.david.auth.repositories.BookRepository;

@Service
public class BookService {
	
	
	private BookRepository bookRepository;
	
	public BookService(BookRepository bookRepository) {
		this.bookRepository = bookRepository;
		
	}
	
	public Book oneBook(Long id) {
		Optional<Book> optionalBook = bookRepository.findById(id);
		if(optionalBook.isPresent()) {
			return optionalBook.get();
			}else {
				return null;
			}
	}
	
	public Book create(Book book) {
		return bookRepository.save(book);
	}
	
	public Book update(Book book) {
		return bookRepository.save(book);
	}
	
	public void destroy(Long id) {
		bookRepository.deleteById(id);
	}
	
	public List<Book> allBooks() {
		return bookRepository.findAll();
	}

}
