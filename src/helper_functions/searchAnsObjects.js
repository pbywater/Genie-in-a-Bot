const constructLocal = require('./constructLocal');
const sendToFB = require('./sendToFB');

function searchAnsObjects(answerObjects, intent, senderID) {
  for (const key in answerObjects) {
    if (key === intent) {
      const messageData = constructLocal(senderID, key, answerObjects);
      sendToFB(messageData);
    }
  }
  // if (intent === 'partyCompare') {
  //   const messageData = constructLocal(senderID, 'fallbackGeneral', answerObjects);
  //   sendToFB(messageData);
  // }
}
module.exports = searchAnsObjects;
