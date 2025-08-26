package accounts

import (
	"crypto/ecdsa"
	"github.com/ethereum/go-ethereum"
	"github.com/ethereum/go-ethereum/core/types"
	"github.com/ethereum/go-ethereum/crypto"
	"math/big"
)

type priWallet struct {
	account Account // Single account contained in this wallet
	key     *ecdsa.PrivateKey
}

func NewPriWallet(account Account, pri *ecdsa.PrivateKey) Wallet {
	a := priWallet{
		account: account,
		key:     pri,
	}
	return &a
}

// URL implements accounts.Wallet, returning the URL of the account within.
func (w *priWallet) URL() URL {
	return w.account.URL
}

// Status implements accounts.Wallet, returning whether the account held by the
// keystore wallet is unlocked or not.
func (w *priWallet) Status() (string, error) {
	return "Locked", nil
}

// Open implements accounts.Wallet, but is a noop for plain wallets since there
// is no connection or decryption step necessary to access the list of accounts.
func (w *priWallet) Open(passphrase string) error { return nil }

// Close implements accounts.Wallet, but is a noop for plain wallets since there
// is no meaningful open operation.
func (w *priWallet) Close() error { return nil }

// Accounts implements accounts.Wallet, returning an account list consisting of
// a single account that the plain keystore wallet contains.
func (w *priWallet) Accounts() []Account {
	return []Account{w.account}
}

// Contains implements accounts.Wallet, returning whether a particular account is
// or is not wrapped by this wallet instance.
func (w *priWallet) Contains(account Account) bool {
	return account.Address == w.account.Address
}

// Derive implements accounts.Wallet, but is a noop for plain wallets since there
// is no notion of hierarchical account derivation for plain keystore accounts.
func (w *priWallet) Derive(path DerivationPath, pin bool) (Account, error) {
	return Account{}, ErrNotSupported
}

// SelfDerive implements accounts.Wallet, but is a noop for plain wallets since
// there is no notion of hierarchical account derivation for plain keystore accounts.
func (w *priWallet) SelfDerive(bases []DerivationPath, chain ethereum.ChainStateReader) {
}

// signHash attempts to sign the given hash with
// the given account. If the wallet does not wrap this particular account, an
// error is returned to avoid account leakage (even though in theory we may be
// able to sign via our shared keystore backend).
func (w *priWallet) signHash(account Account, hash []byte) ([]byte, error) {
	// Make sure the requested account is contained within
	if !w.Contains(account) {
		return nil, ErrUnknownAccount
	}
	// Account seems valid, request the keystore to sign
	return crypto.Sign(hash, w.key)
}

// SignData signs keccak256(data). The mimetype parameter describes the type of data being signed.
func (w *priWallet) SignData(account Account, mimeType string, data []byte) ([]byte, error) {
	return w.signHash(account, crypto.Keccak256(data))
}

// SignDataWithPassphrase signs keccak256(data). The mimetype parameter describes the type of data being signed.
func (w *priWallet) SignDataWithPassphrase(account Account, passphrase, mimeType string, data []byte) ([]byte, error) {
	// Make sure the requested account is contained within
	if !w.Contains(account) {
		return nil, ErrUnknownAccount
	}
	// Account seems valid, request the keystore to sign
	return w.SignTextWithPassphrase(account, passphrase, crypto.Keccak256(data))
}

// SignText implements accounts.Wallet, attempting to sign the hash of
// the given text with the given account.
func (w *priWallet) SignText(account Account, text []byte) ([]byte, error) {
	return w.signHash(account, TextHash(text))
}

// SignTextWithPassphrase implements accounts.Wallet, attempting to sign the
// hash of the given text with the given account using passphrase as extra authentication.
func (w *priWallet) SignTextWithPassphrase(account Account, passphrase string, text []byte) ([]byte, error) {
	// Make sure the requested account is contained within
	if !w.Contains(account) {
		return nil, ErrUnknownAccount
	}
	// Account seems valid, request the keystore to sign
	return crypto.Sign(TextHash(text), w.key)
}

// SignTx implements accounts.Wallet, attempting to sign the given transaction
// with the given account. If the wallet does not wrap this particular account,
// an error is returned to avoid account leakage (even though in theory we may
// be able to sign via our shared keystore backend).
func (w *priWallet) SignTx(account Account, tx *types.Transaction, chainID *big.Int) (*types.Transaction, error) {
	// Make sure the requested account is contained within
	if !w.Contains(account) {
		return nil, ErrUnknownAccount
	}
	// Depending on the presence of the chain ID, sign with 2718 or homestead
	signer := types.LatestSignerForChainID(chainID)
	return types.SignTx(tx, signer, w.key)
}

// SignTxWithPassphrase implements accounts.Wallet, attempting to sign the given
// transaction with the given account using passphrase as extra authentication.
func (w *priWallet) SignTxWithPassphrase(account Account, passphrase string, tx *types.Transaction, chainID *big.Int) (*types.Transaction, error) {
	// Make sure the requested account is contained within
	if !w.Contains(account) {
		return nil, ErrUnknownAccount
	}
	// Account seems valid, request the keystore to sign
	return w.SignTxWithPassphrase(account, passphrase, tx, chainID)
}
