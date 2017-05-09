const extractContexts = require('./extractContexts');

function constructAnswers(firstName, contexts, intent) {
  if (contexts) {
    console.log('in the if statment about to extract contexts');
    extractContexts(contexts, intent);
  }

  const answer_objects = {
    location_message: {
      text: 'Type your postcode or send me your location to get started :)',
      quick_replies: [
      { content_type: 'location' },
      ],
    },

    FACEBOOK_WELCOME: {
      attachment: {
        type: 'template',
        payload: {
          template_type: 'button',
          text: `Hey ${firstName}, I\'m your personal assistant in the run up to the General Elections! I can help you find out about the candidates standing in your area, what the parties are offering and more!`,
          buttons: [
            {
              type: 'postback',
              title: 'Candidates',
              payload: 'Candidates',
            },
            {
              type: 'postback',
              title: 'Parties',
              payload: 'Parties',
            },
          ],
        },
      },
    },


    Parties: {

      text: 'Pick a party you\'re interested in.',
      quick_replies: [
        {
          content_type: 'text',
          title: 'Conservative',
          payload: 'party_votes',
        },
        {
          content_type: 'text',
          title: 'Labour',
          payload: 'party_votes',
        },
        {
          content_type: 'text',
          title: 'Lib Dem',
          payload: 'party_votes',
        },
        {
          content_type: 'text',
          title: 'Green',
          payload: 'party_votes',
        },
        {
          content_type: 'text',
          title: 'SNP',
          payload: 'party_votes',
        },
      ],
    },

    party_votes: {

      text: 'Let\'s see how they voted on:',
      quick_replies: [
        {
          content_type: 'text',
          title: 'Brexit',
          payload: 'Brexit',
        },
        {
          content_type: 'text',
          title: 'Tuition fees',
          payload: 'Tuition fees',
        },
      ],
    },

    Brexit: {

      text: 'Conservatives voted ......',
      quick_replies: [
        {
          content_type: 'text',
          title: 'How do other parties compare?',
          payload: 'partyBrexitCompare',
        },
        {
          content_type: 'text',
          title: 'Back to votes',
          payload: 'party_votes',
        },
        {
          content_type: 'text',
          title: 'Choose another party',
          payload: 'Parties',
        },
      ],
    },

  };
  return answer_objects;
}


module.exports = constructAnswers;
