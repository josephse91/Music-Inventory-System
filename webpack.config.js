const path = require("path");

module.exports = {
  context: __dirname,
  entry: "./index.js",
  output: {
    path: path.resolve(__dirname),
    filename: "bundle.js",
  },
  resolve: {
    extensions: [".js", ".jsx", "*"],
    fallback: {
      dgram: false,
      fs: false,
      net: false,
      tls: false,
      child_process: false,
    },
  },
  module: {
    rules: [
      {
        test: /\.jsx?$/,
        exclude: /(node_modules)/,
        use: {
          loader: "babel-loader",
        },
      },
    ],
  },
  devtool: "source-map",
};
