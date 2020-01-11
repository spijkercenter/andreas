import * as functions from 'firebase-functions';
import gqlServer from './graphql/server';

// // Start writing Firebase Functions
// // https://firebase.google.com/docs/functions/typescript

export const api = functions.region('europe-west1').https.onRequest(gqlServer());

export const helloWorld = functions.region('europe-west1').https.onRequest((request, response) => {
 response.send("Hello from Firebase!");
});
