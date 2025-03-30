import 'package:solana/dto.dart';
import 'package:solana/solana.dart';

import 'constants.dart';

void main() async {
  final myWallet = await Ed25519HDKeyPair.fromPrivateKeyBytes(
    privateKey: wallet,
  );

  final Uri rpcUri = Uri.parse("https://api.devnet.solana.com");
  final Uri webSocketUri = Uri.parse("wss://api.devnet.solana.com");

  final SolanaClient client = SolanaClient(
    rpcUrl: rpcUri,
    websocketUrl: webSocketUri,
  );

  int getUserSolBalance() {
    try {
      client.rpcClient.getBalance(myWallet.publicKey.toBase58()).then((value) {
        print("[USER BALANCE]: ${value.value / lamportsPerSol}");
        return value;
      });
      return 0;
    } catch (e) {
      print("[Check Balance Error]: $e");
      return 0;
    }
  }

  // getUserSolBalance();
  getUserSplBalance(
    Ed25519HDPublicKey.fromBase58(
      "DjFBgXrP5HeYd5DmJxMa34KQs52AQ2pD1rKLvsqNyjWP",
    ),
    myWallet,
    client,
  );
}

Future<TokenAmount> getUserSplBalance(
  Ed25519HDPublicKey mint,
  Ed25519HDKeyPair owner,
  SolanaClient client,
) async {
  print("Getting SPL token balance... for ${owner.publicKey.toBase58()}");
  try {
    final tokenAmount = await client.getTokenBalance(
      owner: owner.publicKey,
      mint: mint,
    );
    print("[USER SPL BALANCE]: ${tokenAmount.uiAmountString}");
    return tokenAmount;
  } catch (e) {
    print("[Check SPL Balance Error]: $e");
    return TokenAmount(amount: "", decimals: 0, uiAmountString: "");
  }
}
