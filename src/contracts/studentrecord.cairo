use crate::interfaces::istudentrecord::IStudentRecord;
use crate::interfaces::ischoollibrary::{IschoollibraryDispatcher, IschoollibraryDispatcherTrait};
#[starknet::contract]
pub mod StudentRecord {

    use starknet::storage::StorageMapWriteAccess;
use super::IschoollibraryDispatcherTrait;
use starknet::storage::{Map};
    use core::starknet::ContractAddress;
    use super::IschoollibraryDispatcher;
    #[storage]
    struct Storage {
        borrow_books: Map<felt252, felt252> //student_name => book_name
    }
    impl StudentRecord of super::IStudentRecord<ContractState>{

        fn borrow_book_from_lib(ref self: ContractState, book_name: felt252, student_name: felt252, lib_address: ContractAddress) ->bool{
            let lib_dispatcher = IschoollibraryDispatcher {contract_address: lib_address};


            let check = lib_dispatcher.borrow_book(book_name);
            if check {
                self.borrow_books.write(student_name, book_name);
                return true;
            } else{
                return false;
            }
        }
    }
    
}