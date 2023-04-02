const { environment } = require('@rails/webpacker');

const babelLoader = environment.loaders.get('babel');
babelLoader.exclude = /(node_modules|bower_components)/;

environment.loaders.append('babel', {
  test: /\.js$/,
  use: {
    loader: 'babel-loader',
  },
});

module.exports = environment;
