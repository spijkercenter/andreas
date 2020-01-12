import express from 'express';
import { ApolloServer } from 'apollo-server-express';

import schema from './schema';
import resolvers from './resolvers';

function gqlServer() {
    const app = express();

    app.enable('trust proxy');
    app.use(function (req, res, next) {
        if (req.secure) {
            next();
        } else {
            res.status(497).send('Use HTTPS');
        }
    });

    const apolloServer = new ApolloServer({
        typeDefs: schema,
        resolvers,
        introspection: true,
        playground: false,
    });

    apolloServer.applyMiddleware({ app, path: '/', cors: true });


    return app;
}

export default gqlServer;