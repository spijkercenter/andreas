import admin, { firestore } from 'firebase-admin';
import BranchType from './interfaces/branchType';
import Branch from './interfaces/branch';

const serviceAccount = require('../../service-account.json');

admin.initializeApp({
    credential: admin.credential.cert(serviceAccount),
});

const resolverFunctions = {
    Query: {
        branchTypes: async (_parent: any, args: any) => {

            let query: firestore.Query = admin
                .firestore()
                .collection('branchTypes')

            
            const filter = args.filter;
            let filters = args.filters;
            
            if (filter !== undefined && filters !== undefined) {
                throw new Error('Do not use both filter and filters!');

            } else if (filter !== undefined) {
               filters = [filter];

            } else if (filters === undefined) {
                filters = [];
            }

            filters.forEach((f: string[]) => {
                query = query.where(f[0], '==', f[1])
            });


            let branchTypes = await query.get();

            return branchTypes.docs.map(b => {
                const result = b.data();
                result.id = b.id;
                return result as BranchType[]
            });
        },
    },
    BranchType: {
        branches: async (parent: BranchType) => {
            const branches = await admin
                .firestore()
                .collection('branchTypes/' + parent.id + '/branches')
                .get();

            return branches.docs.map(b => {
                const result = b.data();
                result.id = b.id;
                return result as Branch[];
            })
        }
    }
};

export default resolverFunctions;