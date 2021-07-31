// wd create-entity create-office.js "Minister for X"
const fs = require('fs');
let rawmeta = fs.readFileSync('meta.json');
let meta = JSON.parse(rawmeta);

module.exports = (label) => {
  return {
    type: 'item',
    labels: {
      en: label,
    },
    descriptions: {
      en: 'Lithuanian cabinet position',
    },
    claims: {
      P31:   { value: 'Q294414' }, // instance of: public office
      P279:  { value: 'Q83307'  }, // subclas of: minister
      P17:   { value: 'Q37'    },  // country: Lithuania
      P1001: { value: 'Q37'     }, // jurisdiction: Lithuania
      P361: {
        value: 'Q29078891',        // part of: Cabinet of Lithuania
        references: {
          P854: meta.source.url
        },
      }
    }
  }
}
