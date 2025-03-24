// /// Interface representing `HelloContract`.
// /// This interface allows modification and retrieval of the contract balance.
// #[starknet::interface]
// pub trait IHelloStarknet<TContractState> {
//     /// Increase contract balance.
//     fn increase_balance(ref self: TContractState, amount: felt252);
//     /// Retrieve contract balance.
//     fn get_balance(self: @TContractState) -> felt252;
// }

// /// Simple contract for managing balance.
// #[starknet::contract]
// mod HelloStarknet {
//     use core::starknet::storage::{StoragePointerReadAccess, StoragePointerWriteAccess};

//     #[storage]
//     struct Storage {
//         balance: felt252,
//     }

//     #[abi(embed_v0)]
//     impl HelloStarknetImpl of super::IHelloStarknet<ContractState> {
//         fn increase_balance(ref self: ContractState, amount: felt252) {
//             assert(amount != 0, 'Amount cannot be 0');
//             self.balance.write(self.balance.read() + amount);
//         }

//         fn get_balance(self: @ContractState) -> felt252 {
//             self.balance.read()
//         }
//     }
// }

// #[derive(Copy, Debug, Serde, Drop,)]
// pub struct Book {
//     title:felt252 ,
//     author:felt252,
//     year: u8,
//     edition: felt252,
// }



#[starknet::interface]
pub trait  Ischoollibrary<TContractState>{
    fn add_book(ref self: TContractState, book_name:felt252 );
    fn borrow_book (ref self: TContractState, book_name: felt252) -> bool; 

}



#[starknet::contract] 

mod SchoolLibrary{
    use starknet::storage::{Map, StoragePointerWriteAccess, StoragePointerReadAccess, StoragePathEntry};
    //use super::*;


    #[storage]

    struct Storage{
        book_recorder: Map<felt252, bool>//Map<Book, bool>

    }



    #[abi (embed_v0)]


    impl SchoolLibraryIpml of super::Ischoollibrary<ContractState> {

        fn add_book(ref self: ContractState, book_name: felt252 ){

            self.book_recorder.entry(book_name).write(true);
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


    // use starknet::storage::StoragePathEntry;
    // use starknet::storage::Map;
    // use starknet::storage::{ StoragePointerWriteAccess, StoragePointerReadAccess,}
    // use super::*;
    //
    // struct Storage{
    //     felt252, bool> //<Book, bool>

    // #[abi(embed_v0)]
    // impl StudentRecordimpl of super::IStudentRecord<ContractState>{
//     impl SchoolLibrabryimpl of super::Ischoollibrary<ContractState>{
//         fn add_book(ref self: ContractState, book_name: felt252) {
//             self.book_recorder.entry(book_name).write(true);
//         };
//         fn borrow_book(ref self: ContractState, book_name: felt252) -> bool{


//             let book_exists - self.book_recorder.entry(book_name).read();


//             if book_exists{
//                 return true;
//             }else {
//                 return false;
//             }
//         }
//     }
// }
// use core::starknet::contract_address;
// #[derive(Copy, Debug, Serde, Drop,)]

// #[starknet::interface]

// pub trait IStudentRecord<TContractState>{
//     fn borrow_book_from_library(ref self: TContractState, book_name: felt252, student_name: felt252, lib_address: ContractAddress); 
// }
// #[starknet::contract]
// mod StudentRecord{
//     use starknet::storage::{Map};
//     use super::IschoollibraryDispatcher
//     use core::starknet::ContractAddress
        
//     #[storage]
    
//     // struct storage{
//     //     borrowed_books: Map<(felt252, felt252),
//     // }
//     struct Storage{
//         borrowed_books: Map<felt252, bool> //<Book, bool>
//     }
//         impl StudentRecordimpl of super::IStudentRecord<ContractState>{
//         fn borrow_book_from_library(ref self: ContractState, book_name: felt252, student_name: felt252, lib_address: ContractAddress) -> bool{
//             let lib_dispatcher = IschoollibraryDispatcher {contract_address: lib_address}
//         }
//     }
// }

