import 'package:solana/solana.dart';

import 'constants.dart';

final Uri rpcUri = Uri.parse("https://api.devnet.solana.com");
final Uri webSocketUri = Uri.parse("wss://api.devnet.solana.com");

final SolanaClient client = SolanaClient(
  rpcUrl: rpcUri,
  websocketUrl: webSocketUri,
);

void main() async {
  final myWallet = await Ed25519HDKeyPair.fromPrivateKeyBytes(
    privateKey: wallet,
  );
  final otherWallet = Ed25519HDPublicKey.fromBase58(
    "Ryk3jDdy44PgusTA5HYdapAkb35U41G2t6jE3xvAYcJ",
  );
  createToken(myWallet, otherWallet, lamportsPerSol, "Creating a token");
}

void createToken(
  Ed25519HDKeyPair source,
  Ed25519HDPublicKey destination,
  int lamports,
  String memo,
) async {
  print("Creating SPL token...");

  final mint = await client.initializeMint(
    mintAuthority: source,
    decimals: 9,
    freezeAuthority: source.publicKey,
    commitment: Commitment.confirmed,
  );

  print("Token mint address: ${mint.address.toBase58()}");

  final calculatedAta = await findAssociatedTokenAddress(
    owner: source.publicKey,
    mint: mint.address,
  );

  final tokenAccount = await AssociatedTokenAccountInstruction.createAccount(
    funder: source.publicKey,
    address: calculatedAta,
    owner: source.publicKey,
    mint: mint.address,
  );

  await client.sendAndConfirmTransaction(
    commitment: Commitment.confirmed,
    message: Message.only(tokenAccount),
    signers: [source],
  );

  final doMint = await TokenInstruction.mintTo(
    amount: 10000000000,
    mint: mint.address,
    destination: calculatedAta,
    authority: source.publicKey,
  );

  await client.sendAndConfirmTransaction(
    commitment: Commitment.confirmed,
    message: Message.only(doMint),
    signers: [source],
  );
  print("Minted 10,000 tokens to the destination account.");
  print("Token creation complete.");
  print("Token mint address: ${mint.address.toBase58()}");
}
