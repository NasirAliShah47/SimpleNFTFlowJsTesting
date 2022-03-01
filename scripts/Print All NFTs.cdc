// Print All NFTs

import ExampleNFT from "./contracts/ExampleNFT.cdc"

// Print the NFTs owned by accounts 0x01 and 0x02.
pub fun main() :[UInt64]{

    // Get both public account objects
    let account1 = getAccount(0x01)

    // Find the public Receiver capability for their Collections
    let acct1Capability = account1.getCapability(ExampleNFT.CollectionPublicPath)

    // borrow references from the capabilities
    let receiver1Ref = acct1Capability.borrow<&{ExampleNFT.NFTReceiver}>()
        ?? panic("Could not borrow account 1 receiver reference")

    // Print both collections as arrays of IDs
    log("Account 1 NFTs")
    return receiver1Ref.getIDs()
}
