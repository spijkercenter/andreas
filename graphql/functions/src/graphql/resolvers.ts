import admin from 'firebase-admin';
import Branch from './interfaces/branch';

const serviceAccount = require('../../service-account.json');

admin.initializeApp({
    credential: admin.credential.cert(serviceAccount),
});

const resolverFunctions = {
    Query: {
        branches: async () => {
            const branches = await admin
                .firestore()
                .collection('branches')
                .get();

            return branches.docs.map(b => {
                const result = b.data();
                result.id = b.id;
                return result as Branch[]
            });
        },
    }
};

export default resolverFunctions;