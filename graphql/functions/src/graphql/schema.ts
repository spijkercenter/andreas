const {gql} = require('apollo-server-express');

const schema = gql`
    type Query {
        branches: [Branch]
    }
    type Branch {
        id: ID!,
        name: String!
    }
`;

export default schema;