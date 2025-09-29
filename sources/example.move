module my_first_package::example {
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct Sword has key, store {
        id: UID,
        magic: u64,
        strength: u64,
    }

    public struct Forge has key, store {
        id: UID,
        swords_created: u64,
    }

    fun init(ctx: &mut TxContext) {
        let admin = Forge {
            id: object::new(ctx),
            swords_created: 0,
        };

        transfer::transfer(admin, tx_context::sender(ctx));
    }

    public fun magic(s: &Sword): u64 {
        s.magic
    }

    public fun strength(s: &Sword): u64 {
        s.strength
    }

    public fun swords_created(f: &Forge): u64 {
        f.swords_created
    }
}
