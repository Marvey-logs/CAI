use starknet::ContractAddress;

#[starknet::interface]

pub trait IStudentRecord<TcontractState> {

    fn borrow_book_from_lib(ref self: TcontractState, book_name: felt252, student_name: felt252, lib_address:ContractAddress) ->bool;
    
}