const { gql } = require('apollo-server-express');

const schema = gql`
    type Query {
        branchTypes(
            filter: [String!],
            filters: [[String!]!]
        ): [BranchType]
    }

    input KV {
        key: String!,
        value: String!
    }

    type BranchType {
        id: ID!,
        name: String!,
        branches: [Branch]
    }
    type Branch {
        id: ID!,
        name: String!
    }
`;

export default schema;