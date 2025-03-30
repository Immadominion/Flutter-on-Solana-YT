import 'package:solana/solana.dart';

void main() {
  /// To create a new keypair
  /// we have to use this method from this package,
  /// Ed25519 is a digital signature algorithm
  /// HD is Hierarchical Deterministic
  /// KeyPair is a pair of keys, one public and one private(related)
  Future<Ed25519HDKeyPair> keypair;
  List<int> private_key;

  ///We have to use a try-catch block to handle errors
  ///since it is a future from the package
  try {
    ///We have to call the random method to generate a new keypair
    keypair = Ed25519HDKeyPair.random();

    /// Since it is a future, we check that when it completes,
    /// we then can consume the return data
    keypair.then((value) {
      print("----------------------------");
      print("Hurray 🥳, you have created you first solana wallet");
      print("----------------------------");
      print("Your public key is: ${value.publicKey}");
      print("----------------------------");
      print(
        "Check out your wallet on the devnet: https://explorer.solana.com/address/${value.publicKey}?cluster=devnet",
      );
      print("----------------------------");
      
      ///We can also extract the private/secret key from the keypair
      ///make sure to put the gotten value in a json file
      value.extract().then((value) {
        private_key = value.bytes;
        print(private_key);
      });
    });

    ///catch any errors
  } catch (e) {
    print("[KEYGEN ERROR]: $e");
  }
}
