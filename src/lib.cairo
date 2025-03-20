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

#[derive(Copy, Debug, Serde, Drop,)]



// pub struct Book {
//     title:felt252 ,
//     author:felt252,
//     year: u8,
//     edition: felt252,
// }





#[starknet::interface]
pub trait  Ischoollibrary<TContractState>{
    fn add_book(ref self: TContractState, book_name: felt252 );
    fn borrow_book (ref self: TContractState, book_name: felt252); -> bool;

}

#[starknet::contract]
mod SchoolLibrary{

    use starknet::storage::StoragePathEntry;
    use starknet::storage::Map;
    use starknet::storage::{ StoragePointerWriteAccess, StoragePointerReadAccess,}
    //use super::*;

    #[storage]

    struct Storage{
        book_recorder: Map<felt252, bool> //<Book, bool>
    }

    #[abi(embed_v0)]
    impl SchoolLibrabryimpl of super::Ischoollibrary<ContractState>{
        fn add_book(ref self: ContractState, book_name: felt252){
            self.book_recorder.entry(book_name).write(true);
        }
        fn borrow_book(ref self: ContractState, book_name: felt252) -> bool{


            let book_exists = self.book_recorder.entry(book_name).read();
            

            assert!(book_exists == true, 'book unavailable')
        }
    }

}