use crate::interfaces::ischoollibrary::Ischoollibrary;

#[starknet::contract]

pub mod SchoolLibrary{
    use starknet::event::EventEmitter;
use starknet::storage::{Map, StoragePointerWriteAccess, StoragePointerReadAccess, StoragePathEntry};
    #[storage]
    struct Storage{
        book_recorder: Map<felt252, bool>//Map<Book, bool>

    }
    #[event]
    #[derive(Copy, Drop, starknet::Event)]
    enum Event{
        AddBook: AddBook
    }
    #[derive(Copy, Drop, starknet::Event)]
    struct AddBook {
        book_name:felt252,
        response:felt252,
    }
    #[abi (embed_v0)]
    impl SchoolLibraryIpml of super::Ischoollibrary<ContractState> {
        fn add_book(ref self: ContractState, book_name: felt252 ){
            self.book_recorder.entry(book_name).write(true);
            self.emit(
                AddBook{
                    book_name: book_name, // the value can be skipped here because the var is same name as the value.. that is t say... it can just be book_name      
                    response: 'Book added successfully'

                }
            )
        }
        fn borrow_book (ref self: ContractState, book_name: felt252) -> bool {
            let book_exists = self.book_recorder.entry(book_name).read();

            if book_exists {
                return true;
            } else {
                return false;
            }

        } 
        
    }

}

