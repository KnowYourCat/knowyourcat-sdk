// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

library SourceId {
    /** Common */
    // Ownership of Binance BAB SBT
    uint256 constant BAB = uint256(keccak256("BAB"));
    // RealT Platform KYC passed
    uint256 constant REALT = uint256(keccak256("REALT"));

    /** Verifiable Credentials by kyCat */
    // Telegram Account Linked
    uint256 constant VC_CHESHIRE_TELEGRAM = uint256(keccak256("VC_CHESHIRE_TELEGRAM"));
    // Google Account Linked
    uint256 constant VC_CHESHIRE_GOOGLE = uint256(keccak256("VC_CHESHIRE_GOOGLE"));
    // Twitter Account Linked
    uint256 constant VC_CHESHIRE_TWITTER = uint256(keccak256("VC_CHESHIRE_TWITTER"));
    // Coinbase Account Linked
    uint256 constant VC_CHESHIRE_COINBASE = uint256(keccak256("VC_CHESHIRE_COINBASE"));
}
