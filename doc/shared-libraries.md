Shared Libraries
================

## grailumconsensus

The purpose of this library is to make the verification functionality that is critical to Grailum's consensus available to other applications, e.g. to language bindings.

### API

The interface is defined in the C header `grailumconsensus.h` located in  `src/script/grailumconsensus.h`.

#### Version

`grailumconsensus_version` returns an `unsigned int` with the API version *(currently at an experimental `0`)*.

#### Script Validation

`grailumconsensus_verify_script` returns an `int` with the status of the verification. It will be `1` if the input script correctly spends the previous output `scriptPubKey`.

##### Parameters
- `const unsigned char *scriptPubKey` - The previous output script that encumbers spending.
- `unsigned int scriptPubKeyLen` - The number of bytes for the `scriptPubKey`.
- `const unsigned char *txTo` - The transaction with the input that is spending the previous output.
- `unsigned int txToLen` - The number of bytes for the `txTo`.
- `unsigned int nIn` - The index of the input in `txTo` that spends the `scriptPubKey`.
- `unsigned int flags` - The script validation flags *(see below)*.
- `grailumconsensus_error* err` - Will have the error/success code for the operation *(see below)*.

##### Script Flags
- `grailumconsensus_SCRIPT_FLAGS_VERIFY_NONE`
- `grailumconsensus_SCRIPT_FLAGS_VERIFY_P2SH` - Evaluate P2SH ([BIP16](https://github.com/grailum/bips/blob/master/bip-0016.mediawiki)) subscripts
- `grailumconsensus_SCRIPT_FLAGS_VERIFY_DERSIG` - Enforce strict DER ([BIP66](https://github.com/grailum/bips/blob/master/bip-0066.mediawiki)) compliance
- `grailumconsensus_SCRIPT_FLAGS_VERIFY_NULLDUMMY` - Enforce NULLDUMMY ([BIP147](https://github.com/grailum/bips/blob/master/bip-0147.mediawiki))
- `grailumconsensus_SCRIPT_FLAGS_VERIFY_CHECKLOCKTIMEVERIFY` - Enable CHECKLOCKTIMEVERIFY ([BIP65](https://github.com/grailum/bips/blob/master/bip-0065.mediawiki))
- `grailumconsensus_SCRIPT_FLAGS_VERIFY_CHECKSEQUENCEVERIFY` - Enable CHECKSEQUENCEVERIFY ([BIP112](https://github.com/grailum/bips/blob/master/bip-0112.mediawiki))
- `grailumconsensus_SCRIPT_FLAGS_VERIFY_WITNESS` - Enable WITNESS ([BIP141](https://github.com/grailum/bips/blob/master/bip-0141.mediawiki))

##### Errors
- `grailumconsensus_ERR_OK` - No errors with input parameters *(see the return value of `grailumconsensus_verify_script` for the verification status)*
- `grailumconsensus_ERR_TX_INDEX` - An invalid index for `txTo`
- `grailumconsensus_ERR_TX_SIZE_MISMATCH` - `txToLen` did not match with the size of `txTo`
- `grailumconsensus_ERR_DESERIALIZE` - An error deserializing `txTo`
- `grailumconsensus_ERR_AMOUNT_REQUIRED` - Input amount is required if WITNESS is used

### Example Implementations
- [NGrailum](https://github.com/NicolasDorier/NGrailum/blob/master/NGrailum/Script.cs#L814) (.NET Bindings)
- [node-libgrailumconsensus](https://github.com/bitpay/node-libgrailumconsensus) (Node.js Bindings)
- [java-libgrailumconsensus](https://github.com/dexX7/java-libgrailumconsensus) (Java Bindings)
- [grailumconsensus-php](https://github.com/Bit-Wasp/grailumconsensus-php) (PHP Bindings)
