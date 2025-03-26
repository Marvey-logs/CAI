
#[starknet::interface]
pub trait  Ischoollibrary<TContractState>{
    fn add_book(ref self: TContractState, book_name:felt252 );
    fn borrow_book (ref self: TContractState, book_name: felt252) -> bool; 

}

// pub mod name {
//     pub fn gida(){

//     }
// }
