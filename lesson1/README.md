# Lesson 1: Getting Started with Web3 on Solana

## 🎯 Overview
Welcome to **Lesson 1** of the **Flutter on Solana** series! In this project, we explore the fundamentals of interacting with **Solana Web3** using **Dart**.

By the end of this lesson, you'll be able to:
✅ Create a **Solana Wallet** (Keypair)  
✅ Request **SOL Airdrop** from the Solana Devnet  
✅ **Transfer SOL** between wallets  
✅ **Interact with a Solana Program**  
✅ **Create and Mint SPL Tokens**  

---

## 📂 Project Structure

```
lesson1/
├── keygen.dart        # Generate a new Solana wallet keypair
├── airdrop.dart       # Request SOL from Solana Devnet
├── transfer.dart      # Transfer SOL between wallets
├── create_token.dart  # Create and mint SPL tokens
├── README.md          # This guide
```

---

## 🛠 Prerequisites
Ensure you have the following installed:
- **Dart** ([Install Dart](https://dart.dev/get-dart))
- **Flutter** ([Install Flutter](https://flutter.dev/docs/get-started/install))
- **Solana CLI** ([Install Solana CLI](https://docs.solana.com/cli/install-solana-cli-tools))

---

## 🏗 Setup
Clone the repository and navigate into the `lesson1` folder:
```sh
git clone https://github.com/Immadominion/Flutter-on-Solana-YT.git
cd Flutter-on-Solana-YT/lesson1
```

Install dependencies:
```sh
dart pub get
```

---

## 📝 Steps

### 1️⃣ Generate a New Wallet (Keypair)
Run the script to create a new Solana wallet:
```sh
dart keygen.dart
```
This will generate a keypair and display the public address.
You should add this keypair to your constants.dart file to be used
in every other scripts.

---

### 2️⃣ Request SOL Airdrop
Get test SOL tokens from the **Solana Devnet**:
```sh
dart airdrop.dart
```
This will fund your wallet with **1 SOL** to use for transactions.

---

### 3️⃣ Transfer SOL to Another Wallet
Send SOL from your wallet to another public key:
```sh
dart transfer.dart
```
You need to update the `transfer.dart` file with the recipient's wallet address.

---

### 4️⃣ Create and Mint an SPL Token
Create your own **SPL Token** and mint tokens to your wallet:
```sh
dart create_token.dart
```
This will:
- Generate a **Token Mint Address**
- Create an **Associated Token Account (ATA)**
- Mint **10,000 tokens** to your wallet

---

## 🎥 Watch the Video
For a step-by-step visual guide, check out the YouTube video:
[![Watch on YouTube](https://img.shields.io/badge/YouTube-Watch-red?logo=youtube)](https://youtube.com/yourchannel)

---

## 🌎 Connect with Me
[![Twitter](https://img.shields.io/badge/Twitter-%40Heisjoel0x-blue?logo=twitter)](https://x.com/Heisjoel0x)  
[![Telegram](https://img.shields.io/badge/Telegram-%40Immadotdev-blue?logo=telegram)](https://t.me/Immadotdev)

---

## 🤝 Contributing
If you’d like to improve this lesson, feel free to submit a PR!

---

## 📜 License
This project is licensed under the **MIT License**.

Happy Coding! 🚀

