var request = require('supertest');
app = require('../index').getApp;
describe('GET /', function() {
    it('expects to get http response code 200', function(done) {
        request(app)
        .get('/')
        .expect(200, done);
    });
    it('expects to get correct content type', function(done) {
        request(app)
        .get('/')
        .expect('Content-Type', /json/, done);
    });
    it('expects to get correct content', function(done) {
        request(app)
        .get('/')
        .expect(function(res) {
            res.body.hello = 'world';
            res.body.ver = '0.1';
        })
        .expect(200, done);
    });

})
