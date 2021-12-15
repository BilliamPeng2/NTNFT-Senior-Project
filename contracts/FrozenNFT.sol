pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Pausable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";


contract FrozenNFT is ERC721, Ownable, Pausable  {
  using Counters for Counters.Counter;
  using Strings for uint256;
  Counters.Counter private _tokenIds;
  mapping (uint256 => string) private _tokenURIs;

  constructor() ERC721("FrozenNFT", "FNFT") {}
  function _setTokenURI(uint256 tokenId, string memory _tokenURI)
    internal
    virtual
  {
    _tokenURIs[tokenId] = _tokenURI;
  }

  function tokenURI(uint256 tokenId)
    public
    view
    virtual
    override
    whenNotPaused
    returns (string memory)
  {
    require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");
    string memory _tokenURI = _tokenURIs[tokenId];
    return _tokenURI;
  }

  function mint(address recipient, string memory uri)
    public
    whenPaused
    returns (uint256)
  {
    _tokenIds.increment();
    uint256 newItemId = _tokenIds.current();
    _mint(recipient, newItemId);
    _setTokenURI(newItemId, uri);
    return newItemId;
  }

  function pause()
  public
  whenNotPaused
  {
    _pause();
    emit Paused(msg.sender);
  }

  function transferFrom(address from, address to, uint256 tokenId)
  public
  whenNotPaused
  override
  {
    super.transferFrom(from, to, tokenId);
  }

  function safeTransferFrom(address from, address to, uint256 tokenId)
  public
  whenNotPaused
  override
  {
    super.safeTransferFrom(from, to, tokenId);
  }

  function approve(address to, uint256 tokenId)
  public
  whenNotPaused
  override
  {
    super.approve(to, tokenId);
  }

  function setApprovalForAll(address to, bool approved)
  public
  whenNotPaused
  override
  {
    super.setApprovalForAll(to, approved);
  }

  function ownerOf(uint256 tokenId)
  public
  whenNotPaused
  override
  {
    super.ownerOf(tokenId);
  }

  function balanceOf(address owner)
  public
  whenNotPaused
  override
  {
    super.balanceOf(owner);
  }
}
