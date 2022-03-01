// Print 0x02 NFTs

import ExampleNFT from "./contracts/ExampleNFT.cdc"

// Print the NFTs owned by account 0x02.
pub fun main() : [UInt64] {
    // Get the public account object for account 0x02
    let nftOwner = getAccount(0x02)

    // Find the public Receiver capability for their Collection
    let capability = nftOwner.getCapability<&{ExampleNFT.NFTReceiver}>(ExampleNFT.CollectionPublicPath)

    // borrow a reference from the capability
    let receiverRef = capability.borrow()
        ?? panic("Could not borrow the receiver reference")

    // Log the NFTs that they own as an array of IDs

    return receiverRef.getIDs()
}
