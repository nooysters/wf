const webpack = require('webpack');
const React = require('react')
const ExtractTextPlugin = require('extract-text-webpack-plugin');
const WebpackCleanPlugin = require('webpack-clean');
const autoprefixer = require('autoprefixer');
// const postcssmodules = require('postcss-modules');


module.exports = {
  entry: {
    // Creates a js file but also generates css file of the same name which
    // includes all css that you require in your js files.
    'modules-react': './frontend/react-modules/entry-react.js',
    // Creates a js file for all modules created from erb templates. No css file
    // will be generated because we will !!NOT!! require css files in this code.
    'modules-serverside': './frontend/vanilla-javascript/entry-vanilla.js',
    // Creates a css file to use with all modules created from erb templates.
    // NOTE: Will also produce a js file which is never loaded by the client and
    // deleted with a post build cleanup.
    'modules-serverside-css': './frontend/vanilla-javascript/entry-vanilla.css'
  },

  // Where the js files go
  output: {
    path: './app/assets/',
    filename: 'javascripts/[name].js',
    chunkFilename: '[id].js'
  },

  module: {
    loaders: [
      {
        test: /.jsx?$/,
        loader: 'babel-loader',
        exclude: /node_modules/,
        query: {
          presets: ['es2015', 'react']
        }
      }
    
      // CSS loader for react modules. Uses post-css with css-modules
      // {
      //   exclude: /serverside-modules/,
      //   test: /\.css$/,
      //   loader: ExtractTextPlugin.extract('css-loader?modules&importLoaders=1&localIdentName=[name]__[local]__[hash:base64:5]!postcss-loader')
      // },
      // // CSS loader for server-side modules. Uses post-css with css-modules and
      // // postcss-modules to output json files.
      // {
      //   exclude: /react-modules/,
      //   test: /\.css$/,
      //   // NOTE: [local] is actually whats defined by postcssmodules
      //   // patern for generateScopedName in the postcss loader pack below.
      //   loader: ExtractTextPlugin.extract('css-loader?modules&importLoaders=1&localIdentName=[local]!postcss-loader?pack=serversidemodules')
      // }
    ]
  },

  // Configure loader packs to process react and serverside css files differently
  // postcss: function () {
  //     return {
  //         // Used for react modules only, at the moment.
  //         defaults: [autoprefixer],
  //         // Used for server-side modules only.
  //         serversidemodules:  [
  //           postcssmodules({
  //             generateScopedName: '[name]__[local]',
  //           }),
  //           autoprefixer({ browsers: [] })
  //         ]
  //     };
  // },

  plugins: [
    // Where the css files go
    new ExtractTextPlugin('stylesheets/[name].scss', { allChunks: true }),
    // Clean up unwated files created by webpack
    new WebpackCleanPlugin([
      'app/assets/javascripts/modules-vanilla-css.js',
      'frontend/serverside-javascr/entry-vanilla.css.json'
    ], './')
  ]
};
