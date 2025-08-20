{

    function allocate_unbounded() -> memPtr {
        memPtr := mload(64)
    }

    function revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() {
        revert(0, 0)
    }

    function revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() {
        revert(0, 0)
    }

    function validator_revert_t_enum$_StakingPeriod_$942(value) {
        if iszero(lt(value, 4)) { revert(0, 0) }
    }

    function abi_decode_t_enum$_StakingPeriod_$942(offset, end) -> value {
        value := calldataload(offset)
        validator_revert_t_enum$_StakingPeriod_$942(value)
    }

    function abi_decode_tuple_t_enum$_StakingPeriod_$942(headStart, dataEnd) -> value0 {
        if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

        {

            let offset := 0

            value0 := abi_decode_t_enum$_StakingPeriod_$942(add(headStart, offset), dataEnd)
        }

    }

    function cleanup_t_uint256(value) -> cleaned {
        cleaned := value
    }

    function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
        mstore(pos, cleanup_t_uint256(value))
    }

    function abi_encode_tuple_t_uint256__to_t_uint256__fromStack_reversed(headStart , value0) -> tail {
        tail := add(headStart, 32)

        abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

    }

    function validator_revert_t_uint256(value) {
        if iszero(eq(value, cleanup_t_uint256(value))) { revert(0, 0) }
    }

    function abi_decode_t_uint256(offset, end) -> value {
        value := calldataload(offset)
        validator_revert_t_uint256(value)
    }

    function abi_decode_tuple_t_uint256t_enum$_StakingPeriod_$942(headStart, dataEnd) -> value0, value1 {
        if slt(sub(dataEnd, headStart), 64) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

        {

            let offset := 0

            value0 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
        }

        {

            let offset := 32

            value1 := abi_decode_t_enum$_StakingPeriod_$942(add(headStart, offset), dataEnd)
        }

    }

    function abi_decode_tuple_t_uint256(headStart, dataEnd) -> value0 {
        if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

        {

            let offset := 0

            value0 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
        }

    }

    function cleanup_t_uint160(value) -> cleaned {
        cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
    }

    function identity(value) -> ret {
        ret := value
    }

    function convert_t_uint160_to_t_uint160(value) -> converted {
        converted := cleanup_t_uint160(identity(cleanup_t_uint160(value)))
    }

    function convert_t_uint160_to_t_address(value) -> converted {
        converted := convert_t_uint160_to_t_uint160(value)
    }

    function convert_t_contract$_IERC20_$877_to_t_address(value) -> converted {
        converted := convert_t_uint160_to_t_address(value)
    }

    function abi_encode_t_contract$_IERC20_$877_to_t_address_fromStack(value, pos) {
        mstore(pos, convert_t_contract$_IERC20_$877_to_t_address(value))
    }

    function abi_encode_tuple_t_contract$_IERC20_$877__to_t_address__fromStack_reversed(headStart , value0) -> tail {
        tail := add(headStart, 32)

        abi_encode_t_contract$_IERC20_$877_to_t_address_fromStack(value0,  add(headStart, 0))

    }

    function cleanup_t_address(value) -> cleaned {
        cleaned := cleanup_t_uint160(value)
    }

    function validator_revert_t_address(value) {
        if iszero(eq(value, cleanup_t_address(value))) { revert(0, 0) }
    }

    function abi_decode_t_address(offset, end) -> value {
        value := calldataload(offset)
        validator_revert_t_address(value)
    }

    function abi_decode_tuple_t_addresst_uint256(headStart, dataEnd) -> value0, value1 {
        if slt(sub(dataEnd, headStart), 64) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

        {

            let offset := 0

            value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
        }

        {

            let offset := 32

            value1 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
        }

    }

    function cleanup_t_bool(value) -> cleaned {
        cleaned := iszero(iszero(value))
    }

    function abi_encode_t_bool_to_t_bool_fromStack(value, pos) {
        mstore(pos, cleanup_t_bool(value))
    }

    function abi_encode_tuple_t_uint256_t_uint256_t_uint256_t_uint256_t_uint256_t_bool__to_t_uint256_t_uint256_t_uint256_t_uint256_t_uint256_t_bool__fromStack_reversed(headStart , value5, value4, value3, value2, value1, value0) -> tail {
        tail := add(headStart, 192)

        abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

        abi_encode_t_uint256_to_t_uint256_fromStack(value1,  add(headStart, 32))

        abi_encode_t_uint256_to_t_uint256_fromStack(value2,  add(headStart, 64))

        abi_encode_t_uint256_to_t_uint256_fromStack(value3,  add(headStart, 96))

        abi_encode_t_uint256_to_t_uint256_fromStack(value4,  add(headStart, 128))

        abi_encode_t_bool_to_t_bool_fromStack(value5,  add(headStart, 160))

    }

    function array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, length) -> updated_pos {
        mstore(pos, length)
        updated_pos := add(pos, 0x20)
    }

    function store_literal_in_memory_aa395b6a6f4d717a8f436942b6d1fe54bfa5998054fa89d964a0583cfff724ad(memPtr) {

        mstore(add(memPtr, 0), "amount must be greater than zero")

    }

    function abi_encode_t_stringliteral_aa395b6a6f4d717a8f436942b6d1fe54bfa5998054fa89d964a0583cfff724ad_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 32)
        store_literal_in_memory_aa395b6a6f4d717a8f436942b6d1fe54bfa5998054fa89d964a0583cfff724ad(pos)
        end := add(pos, 32)
    }

    function abi_encode_tuple_t_stringliteral_aa395b6a6f4d717a8f436942b6d1fe54bfa5998054fa89d964a0583cfff724ad__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_aa395b6a6f4d717a8f436942b6d1fe54bfa5998054fa89d964a0583cfff724ad_to_t_string_memory_ptr_fromStack( tail)

    }

    function abi_encode_t_address_to_t_address_fromStack(value, pos) {
        mstore(pos, cleanup_t_address(value))
    }

    function abi_encode_tuple_t_address_t_address_t_uint256__to_t_address_t_address_t_uint256__fromStack_reversed(headStart , value2, value1, value0) -> tail {
        tail := add(headStart, 96)

        abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

        abi_encode_t_address_to_t_address_fromStack(value1,  add(headStart, 32))

        abi_encode_t_uint256_to_t_uint256_fromStack(value2,  add(headStart, 64))

    }

    function validator_revert_t_bool(value) {
        if iszero(eq(value, cleanup_t_bool(value))) { revert(0, 0) }
    }

    function abi_decode_t_bool_fromMemory(offset, end) -> value {
        value := mload(offset)
        validator_revert_t_bool(value)
    }

    function abi_decode_tuple_t_bool_fromMemory(headStart, dataEnd) -> value0 {
        if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

        {

            let offset := 0

            value0 := abi_decode_t_bool_fromMemory(add(headStart, offset), dataEnd)
        }

    }

    function store_literal_in_memory_25adaa6d082ce15f901e0d8a3d393e7462ef9edf2e6bc8321fa14d1615b6fc51(memPtr) {

        mstore(add(memPtr, 0), "Transfer failed")

    }

    function abi_encode_t_stringliteral_25adaa6d082ce15f901e0d8a3d393e7462ef9edf2e6bc8321fa14d1615b6fc51_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 15)
        store_literal_in_memory_25adaa6d082ce15f901e0d8a3d393e7462ef9edf2e6bc8321fa14d1615b6fc51(pos)
        end := add(pos, 32)
    }

    function abi_encode_tuple_t_stringliteral_25adaa6d082ce15f901e0d8a3d393e7462ef9edf2e6bc8321fa14d1615b6fc51__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_25adaa6d082ce15f901e0d8a3d393e7462ef9edf2e6bc8321fa14d1615b6fc51_to_t_string_memory_ptr_fromStack( tail)

    }

    function panic_error_0x21() {
        mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
        mstore(4, 0x21)
        revert(0, 0x24)
    }

    function panic_error_0x11() {
        mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
        mstore(4, 0x11)
        revert(0, 0x24)
    }

    function checked_mul_t_uint256(x, y) -> product {
        x := cleanup_t_uint256(x)
        y := cleanup_t_uint256(y)
        let product_raw := mul(x, y)
        product := cleanup_t_uint256(product_raw)

        // overflow, if x != 0 and y != product/x
        if iszero(
            or(
                iszero(x),
                eq(y, div(product, x))
            )
        ) { panic_error_0x11() }

    }

    function panic_error_0x12() {
        mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
        mstore(4, 0x12)
        revert(0, 0x24)
    }

    function checked_div_t_uint256(x, y) -> r {
        x := cleanup_t_uint256(x)
        y := cleanup_t_uint256(y)
        if iszero(y) { panic_error_0x12() }

        r := div(x, y)
    }

    function checked_add_t_uint256(x, y) -> sum {
        x := cleanup_t_uint256(x)
        y := cleanup_t_uint256(y)
        sum := add(x, y)

        if gt(x, sum) { panic_error_0x11() }

    }

    function validator_assert_t_enum$_StakingPeriod_$942(value) {
        if iszero(lt(value, 4)) { panic_error_0x21() }
    }

    function cleanup_t_enum$_StakingPeriod_$942(value) -> cleaned {
        cleaned := value validator_assert_t_enum$_StakingPeriod_$942(value)
    }

    function convert_t_enum$_StakingPeriod_$942_to_t_uint8(value) -> converted {
        converted := cleanup_t_enum$_StakingPeriod_$942(value)
    }

    function abi_encode_t_enum$_StakingPeriod_$942_to_t_uint8_fromStack(value, pos) {
        mstore(pos, convert_t_enum$_StakingPeriod_$942_to_t_uint8(value))
    }

    function abi_encode_tuple_t_uint256_t_enum$_StakingPeriod_$942_t_uint256__to_t_uint256_t_uint8_t_uint256__fromStack_reversed(headStart , value2, value1, value0) -> tail {
        tail := add(headStart, 96)

        abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

        abi_encode_t_enum$_StakingPeriod_$942_to_t_uint8_fromStack(value1,  add(headStart, 32))

        abi_encode_t_uint256_to_t_uint256_fromStack(value2,  add(headStart, 64))

    }

    function store_literal_in_memory_1052a6d22b777769a6cc4c9627aa582bf852e3e95d151c74aa5d0528dd370070(memPtr) {

        mstore(add(memPtr, 0), "Invalid stake index")

    }

    function abi_encode_t_stringliteral_1052a6d22b777769a6cc4c9627aa582bf852e3e95d151c74aa5d0528dd370070_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 19)
        store_literal_in_memory_1052a6d22b777769a6cc4c9627aa582bf852e3e95d151c74aa5d0528dd370070(pos)
        end := add(pos, 32)
    }

    function abi_encode_tuple_t_stringliteral_1052a6d22b777769a6cc4c9627aa582bf852e3e95d151c74aa5d0528dd370070__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_1052a6d22b777769a6cc4c9627aa582bf852e3e95d151c74aa5d0528dd370070_to_t_string_memory_ptr_fromStack( tail)

    }

    function panic_error_0x32() {
        mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
        mstore(4, 0x32)
        revert(0, 0x24)
    }

    function store_literal_in_memory_7d3a1e6176c07363282aeb3a6fa2ec46355f8127ff27a368f3b4eb87aa8651ad(memPtr) {

        mstore(add(memPtr, 0), "stk is not active")

    }

    function abi_encode_t_stringliteral_7d3a1e6176c07363282aeb3a6fa2ec46355f8127ff27a368f3b4eb87aa8651ad_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 17)
        store_literal_in_memory_7d3a1e6176c07363282aeb3a6fa2ec46355f8127ff27a368f3b4eb87aa8651ad(pos)
        end := add(pos, 32)
    }

    function abi_encode_tuple_t_stringliteral_7d3a1e6176c07363282aeb3a6fa2ec46355f8127ff27a368f3b4eb87aa8651ad__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_7d3a1e6176c07363282aeb3a6fa2ec46355f8127ff27a368f3b4eb87aa8651ad_to_t_string_memory_ptr_fromStack( tail)

    }

    function store_literal_in_memory_bedd3c102a3f151ffce8df4fba90d1957719f662a629ce7c38414d92b3fb9507(memPtr) {

        mstore(add(memPtr, 0), "Staking period is not over")

    }

    function abi_encode_t_stringliteral_bedd3c102a3f151ffce8df4fba90d1957719f662a629ce7c38414d92b3fb9507_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 26)
        store_literal_in_memory_bedd3c102a3f151ffce8df4fba90d1957719f662a629ce7c38414d92b3fb9507(pos)
        end := add(pos, 32)
    }

    function abi_encode_tuple_t_stringliteral_bedd3c102a3f151ffce8df4fba90d1957719f662a629ce7c38414d92b3fb9507__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_bedd3c102a3f151ffce8df4fba90d1957719f662a629ce7c38414d92b3fb9507_to_t_string_memory_ptr_fromStack( tail)

    }

    function abi_encode_tuple_t_address_t_uint256__to_t_address_t_uint256__fromStack_reversed(headStart , value1, value0) -> tail {
        tail := add(headStart, 64)

        abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

        abi_encode_t_uint256_to_t_uint256_fromStack(value1,  add(headStart, 32))

    }

    function abi_encode_tuple_t_uint256_t_uint256__to_t_uint256_t_uint256__fromStack_reversed(headStart , value1, value0) -> tail {
        tail := add(headStart, 64)

        abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

        abi_encode_t_uint256_to_t_uint256_fromStack(value1,  add(headStart, 32))

    }

}
