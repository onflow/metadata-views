// Here is where the rest of your NFT resource code will go...
// Below is the metadata functions to include in your NFT resource...
// Checkout the NFT Metadata example to see it all put together

access(all)
fun getViews(): [Type] {
    return [
        Type<MetadataViews.Display>()
    ]
}

access(all)
fun resolveView(_ view: Type): AnyStruct? {
    switch view {
        case Type<MetadataViews.Display>():
            return MetadataViews.Display(
                name: self.name,
                description: self.description,
                thumbnail: self.thumbnail
            )
    }

    return nil
}

// Below is where you will have your metadata in your NFT initialized
.....

// The following code is in your collections resource

access(all)
fun borrowViewResolver(id: UInt64): &AnyResource{MetadataViews.Resolver} {
    let nft = &self.ownedNFTs[id] as auth &NonFungibleToken.NFT
    let exampleNFT = nft as! &NewExampleNFT.NFT
    return exampleNFT as &AnyResource{MetadataViews.Resolver}
}
