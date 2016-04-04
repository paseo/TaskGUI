

module.exports = {
    entry: {
        'bundle': './app/app.js'
    },
    output: {
        path: './dist',
        filename: '[name].js'
    },
    target: 'electron',


    resolve: {
        extensions: ['', '.webpack.js','.js','.jsx','.ts'],
        moduleDirectories: ['node_modules', 'app']
    },

    resolveLoader: {
        extensions: ['','.js','.jsx']
    },

    module: {
        loaders: [
            {
                test: /\.jsx?$/,
                loader: 'babel',
                exclude: /node_modules/
            }
        ]
    }
}
