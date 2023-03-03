// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

/**
 * @dev The structure defines data source
 * `kind` defines type of data source. If equals to 0, then Data Source was never registered.
 *      1 - MerkleRoot
 *      2 - ERC721 contract
 * `timestamp` indicates when the `payload` was generated
 * `payload` can be MerkleRoot or ERC721 contract address
 */
struct DataSource {
    uint32 kind;
    uint40 timestamp;
    uint256 payload;
}

/**
 * @dev The structure defines data synchronization per address
 * `timestamp` indicates when the `payload` was generated. If equals to 0, then Sync was never performed
 * `payload` synchronization data
 */
struct Sync {
    uint40 timestamp;
    uint256 payload;
}

error DataSourceExists();
error DataSourceUnknown();
error DataSourceWrongKind();
error SignerNotAuthorized();
error ProofInvalid();

interface IAggregator {
    event SourceAdded(uint256 indexed sourceId, uint40 timestamp, uint32 kind, uint256 payload);
    event SourceUpdated(uint256 indexed sourceId, uint40 timestamp, uint32 kind, uint256 payload);
    event Synced(uint256 indexed sourceId, address indexed account, uint40 timestamp, uint256 payload);

    function addSource(uint256 sourceId, uint40 timestamp, uint32 kind, uint256 payload) external;

    function updateSource(uint256 sourceId, uint40 timestamp, uint32 kind, uint256 payload) external;

    function updateSourceAndSyncFor(
        uint256 sourceId,
        uint40 timestamp,
        uint32 kind,
        uint256 payload,
        bytes calldata signature,
        address account,
        uint256 syncPayload,
        bytes32[] calldata merkleProof
    ) external;

    function sync(uint256 sourceId, address account, uint256 payload, bytes32[] calldata merkleProof) external;

    function isSynced(uint256 sourceId, address account) external view returns (Sync memory);
}
