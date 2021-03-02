'use strict';

const fs = require('fs');
const p = require('../strapi/package.json');

// CORE
fs.copyFileSync('../strapi/index.d.ts', './index.d.ts');
// END: CORE

p.name = 'lecapi';
p.homepage = 'https://github.com/mkaori/strapi';

p.bin = {
  strapi: './bin/strapi.js',
};

p.author = {
  email: 'mkaori.star@gmail.com',
  name: 'mkaori',
  url: 'https://github.com/mkaori',
};

p.maintainers = [p.author];
p.repository = {
  type: 'git',
  url: 'https://github.com/mkaori/strapi',
};
p.bugs = {
  url: 'https://github.com/mkaori/strapi/issues',
};
p.keywords = ['lecapi'];

// CREATE PACKAGE.JSON
fs.writeFileSync('./package.json', JSON.stringify(p, null, 2), { encoding: 'utf-8' });
fs.copyFileSync('../strapi/README.md', './README.md');
