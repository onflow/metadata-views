import MetadataViews from 0x01

access(all)
fun main(): AnyStruct {
    let address: Address = 0x02
    let id: UInt64 = 0
    
    let account = getAccount(address)

    let collection = account
        .capabilities
        .borrow<&{MetadataViews.ResolverCollection}>(/public/exampleNFTCollection)
        ?? panic("Could not borrow a reference to the collection")

    let nft = collection.borrowViewResolver(id: id)

    // Get the basic display information for this NFT
    let display = nft.resolveView(Type<MetadataViews.Display>())

    return display
}
