import 'package:solana/solana.dart';

import 'constants.dart';

void main() {
  final Uri rpcUri = Uri.parse("https://api.devnet.solana.com");
  final Uri webSocketUri = Uri.parse("wss://api.devnet.solana.com");
  final SolanaClient client = SolanaClient(
    rpcUrl: rpcUri,
    websocketUrl: webSocketUri,
  );

  void airdrop() async {
    final myWallet = await Ed25519HDKeyPair.fromPrivateKeyBytes(privateKey: wallet);
    try {
      client
          .requestAirdrop(address: myWallet.publicKey, lamports: lamportsPerSol)
          .then((value) {
            print("Airdrop successful");
          });
    } catch (e) {
      print("[AIRDROP ERROR]: $e");
    }
  }

  airdrop();
}


