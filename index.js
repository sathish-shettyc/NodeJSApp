var express = require('express'),
    app = express();

    app.set('views', 'views');
    app.set('view engine', 'jade');
    app.get('/', function(req, res) {
        res.json({
            'hello': 'world',
            'version': '0.1'
        })
    });
    app.listen(8080);
    module.exports.getApp = app;
