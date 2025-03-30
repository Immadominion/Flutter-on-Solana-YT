import 'package:solana/solana.dart';

import 'constants.dart';

void main() async {
  final myWallet = await Ed25519HDKeyPair.fromPrivateKeyBytes(
    privateKey: wallet,
  );
  final otherWallet = Ed25519HDPublicKey.fromBase58(
    "Ryk3jDdy44PgusTA5HYdapAkb35U41G2t6jE3xvAYcJ",
  );

  final Uri rpcUri = Uri.parse("https://api.devnet.solana.com");
  final Uri webSocketUri = Uri.parse("wss://api.devnet.solana.com");

  final SolanaClient client = SolanaClient(
    rpcUrl: rpcUri,
    websocketUrl: webSocketUri,
  );

  void transferSol() async {
    await client
        .transferLamports(
          source: myWallet,
          destination: otherWallet,
          lamports: 3000000,
          memo: "Transferring my first Sol",
          onSigned: (transactionId) {
            print("TransactionId: ${transactionId}");
          },
        )
        .then((value) {
          print(
            "Check out your transaction here >> https://explorer.solana.com/tx/${value}?cluster=devnet",
          );
        });
  }

  void transferSpl(
    Ed25519HDPublicKey mint,
    Ed25519HDPublicKey destination,
    int amount,
    Ed25519HDKeyPair owner,
  ) async {
    await client.transferSplToken(
      mint: mint,
      destination: destination,
      amount: amount,
      owner: owner,
    );
  }

  transferSol();
}
