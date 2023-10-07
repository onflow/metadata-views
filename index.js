// Pass the repo name
const recipe = "metadata-views";

//Generate paths of each code file to render
const contractPath = `${recipe}/cadence/contract.cdc`;
const transactionPath = `${recipe}/cadence/transaction.cdc`;

//Generate paths of each explanation file to render
const smartContractExplanationPath = `${recipe}/explanations/contract.txt`;
const transactionExplanationPath = `${recipe}/explanations/transaction.txt`;

export const metadataViews = {
  slug: recipe,
  title: "Metadata Views",
  description: "",
  createdAt: Date(2022, 3, 1),
  author: "Flow Blockchain",
  playgroundLink:
    "https://play.onflow.org/41befd2d-31f3-47f0-ae30-aad776961e31?type=script&id=60b68d62-f15e-402e-9048-ef3f27e224af",
  excerpt:
    "This is how you use the metadata contract to actually access the views to show your metadata.",
  smartContractCode: contractPath,
  smartContractExplanation: smartContractExplanationPath,
  transactionCode: transactionPath,
  transactionExplanation: transactionExplanationPath,
};
