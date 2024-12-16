import "ExampleNFT"
import "MetadataViews"
import "ViewResolver"

transaction {
    prepare(signer: auth(Storage, BorrowValue) &Account) {
        let address: Address = signer.address
        
        let minter = signer.storage.borrow<&ExampleNFT.NFTMinter>(
            from: /storage/exampleNFTMinter
        ) ?? panic("Could not borrow the NFT minter reference.")

        let nft <- minter.mintNFT(
            name: "Example NFT",
            description: "Minting a sample NFT",
            thumbnail: "https://example.com/thumbnail.png",
            royalties: []
        )

        let collection = signer.capabilities.borrow<&ExampleNFT.Collection>(
            /public/exampleNFTCollection
        ) ?? panic("Could not borrow the NFT collection reference.")

        let id = nft.id

        collection.deposit(token: <-nft)

        // Access the account and the public capability
        let account = getAccount(address)

        let capability = account.capabilities.borrow<&ExampleNFT.Collection>(
            /public/exampleNFTCollection
        ) ?? panic("Could not borrow the NFT collection reference.")

        // Borrow the ViewResolver for the given NFT ID
        let resolver = capability.borrowViewResolver(id: id)
            ?? panic("Could not borrow the ViewResolver for the NFT ID.")

        // Access the display metadata view
        let display = MetadataViews.getDisplay(resolver)
            ?? panic("Could not resolve display metadata for the NFT.")

        log(display)
    }
}
