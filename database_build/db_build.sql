BEGIN;

DROP TABLE IF EXISTS users, partyVotes, jokes CASCADE;

CREATE TABLE users (
  id          SERIAL        PRIMARY KEY,
  firstname   VARCHAR(30)   NOT NULL,
  lastname    VARCHAR(50),
  facebook_id BIGINT       UNIQUE,
  postcode    VARCHAR(10),
  constituency  VARCHAR(100)
);

CREATE TABLE partyVotes (
  id          SERIAL        PRIMARY KEY,
  partyKey    VARCHAR(30),
  party       VARCHAR(50)   NOT NULL,
  issue       VARCHAR(50)   NOT NULL,
  inFavour    VARCHAR(30)   NOT NULL,
  against     VARCHAR(30)   NOT NULL,
  turnout     VARCHAR(10)   NOT NULL
);

CREATE TABLE jokes (
  id         SERIAL        PRIMARY KEY,
  joke       VARCHAR(10000),
  image_url  VARCHAR(500)
);

INSERT INTO users (firstname, lastname, facebook_id, postcode)
VALUES
('Maja', 'Kudlicka', 517916098, 'E2 0ET');

INSERT INTO jokes (joke, image_url)
VALUES
('I''m am not a big fan of political jokes. I have seen too many of them get elected...', ''),
('Because it would be hilarious is not a good reason to elect someone.', ''),
('Have you seen the dog?', 'https://s-media-cache-ak0.pinimg.com/736x/5e/43/55/5e4355de4f1aba37be8a9feaf1ba97c7.jpg'),
('I asked my North Korean friend how it was there, he said he couldn''t complain.', ''),
('A woman gets on a bus with her baby. The driver says, “Ugh! That’s the ugliest baby I’ve ever seen.”
The woman stalks off to the rear of the bus and sits down. She turns to the man sitting next to her and says, “The driver just insulted me!”
The man says, “You go and give him a telling off. I’ll hold your monkey for you.”', ''),
('”Dyslexic man walks into a bra”', ''),
('”I went to the zoo the other day, there was only one dog in it, it was a shitzu.”, ''),
('I'’m on a whiskey diet. I’ve lost three days already.',''),
('A guy meets a sex worker in a bar. She says, ‘This is your lucky night. I’ve got a special
   game for you. I’ll do absolutely anything you want for £300 as long as you can say it in
 three words.’ The guy replies, ‘Hey, why not?’ He pulls his wallet out of his pocket and lays
  £300 on the bar, and says slowly. ‘Paint…my….house.', ''),
  ('I tried water polo but my horse drowned.', ''),
  ('A sandwich walks into a bar. The barman says: "Sorry, we don''t serve food in here."', '')




INSERT INTO partyVotes (partyKey, party, issue, inFavour, against, turnout)
VALUES
('Conservativebrexit', 'the Conservative Party', 'Brexit', '319 Conservative MPs (99.7%)', '1 MP (0.3%)', '97.9%'),
('Labourbrexit', 'the Labour Party', 'Brexit', '168 Labour MPs (78%)', '47 MPs (22%)', '93.5%'),
('Liberal Democratsbrexit', 'the Liberal Democrats', 'Brexit', '0 Lib Dem MPs (0%)', '7 MPs (100%)', '77.8%'),
('Greenbrexit', 'the Green Party', 'Brexit', '0 Green MPs (0%)', '1 MP (100%)', '100%'),
('SNPbrexit', 'the SNP', 'Brexit', '0 SNP MPs (0%)', '50 MPs (100%)', '96.3%'),
('ConservativetuitionFees', 'the Conservative Party', 'Tuition Fees', '296 Conservative MPs (98%)', '6 MPs (2%)', '99.0%'),
('LabourtuitionFees', 'the Labour Party', 'Tuition Fees', '0 Labour MPs (0%)', '253 MPs (100%)', '99.2%'),
('Liberal DemocratstuitionFees', 'the Liberal Democrats', 'Tution Fees', '27 Lib Dem MPs (56%)', '21 MPs (44%)', '86%'),
('GreentuitionFees', 'the Green Party', 'Tuition Fees', '0 Green MPs (0%)', '1 MP (100%)', '100%'),
('SNPtuitionFees', 'the SNP', 'Tuition Fees', '0 SNP MPs (0%)', '6 MPs (100%)', '96.3%'),
('Conservativesyria', 'the Conservative Party', 'Syrian Air Strikes', '313 Conservative MPs (98%)', '7 MPs (2%)', '97.6%'),
('Laboursyria', 'the Labour Party', 'Syrian Air Strikes', '66 Labour MPs (30%)', '153 MPs (70%)', '94.8%'),
('Liberal Democratssyria', 'the Liberal Democrats', 'Syrian Air Strikes', '6 Lib Dem MPs (75%)', '2 MPs (25%)', '100%'),
('Greensyria', 'the Green Party', 'Syrian Air Strikes', '0 Green MPs (0%)', '1 MP (100%)', '100%'),
('SNPsyria', 'the SNP', 'Syrian Air Strikes', '0 SNP MPs (0%)', '53 MPs (100%)', '100%');

COMMIT;
