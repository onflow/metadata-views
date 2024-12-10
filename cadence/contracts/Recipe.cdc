
import "NonFungibleToken"
import "ViewResolver"
import "MetadataViews"

// See the full contract source for ExampleNFT here: https://github.com/onflow/flow-nft/blob/master/contracts/ExampleNFT.cdc

access(all) contract Recipe {

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

    // Borrow the view resolver for the specified NFT ID
    access(all) view fun borrowViewResolver(id: UInt64): &{ViewResolver.Resolver}? {
        if let nft = &self.ownedNFTs[id] as &{NonFungibleToken.NFT}? {
            return nft as &{ViewResolver.Resolver}
        }
        return nil
    }

}
