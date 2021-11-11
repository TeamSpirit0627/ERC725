const INTERFACE_ID = {
  ERC165: "0x01ffc9a7",
  ERC725X: "0x44c028fe",
  ERC725Y: "0x5a988c0f",
  ERC725Account: "0x63cb749b",
  ERC1271: "0x1626ba7e",
  LSP1: "0x6bb56a14",
};

const ERC1271 = {
  MAGIC_VALUE: "0x1626ba7e",
  FAIL_VALUE: "0xffffffff",
};

const OPERATION_TYPE = {
  CALL: 0,
  CREATE: 1,
  CREATE2: 2,
  STATICCALL: 3,
  DELEGATECALL: 4,
};

const UNIVERSAL_RECEIVER_DELEGATE_KEY =
  "0x0cfc51aec37c55a4d0b1a65c6255c4bf2fbdf6277f3cc0730c45b828b6db8b47";

// keccak256("EXECUTOR_ROLE")
const EXECUTOR_ROLE =
  "0xd8aa0f3194971a2a116679f7c2090f6939c8d4e01a2a8d7e41d55e5351469e63";

const DUMMY_PRIVATEKEY =
  "0xcafecafe7D0F0EBcafeC2D7cafe84cafe3248DDcafe8B80C421CE4C55A26cafe";

module.exports = {
  INTERFACE_ID,
  ERC1271,
  OPERATION_TYPE,
  UNIVERSAL_RECEIVER_DELEGATE_KEY,
  EXECUTOR_ROLE,
  DUMMY_PRIVATEKEY,
};
