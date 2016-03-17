/**
 * Main
 */

var socket = io.connect();

System.config({
    packages: {
        app: {
            format: 'register',
            defaultExtension: 'js'
        }
    }
});
System.import('app/main')
    .then(null, console.error.bind(console));

// json file stored in same folder, absolute address can be used as well
JSROOT.NewHttpRequest("hpx.json", 'object', function(obj) {
    JSROOT.draw("drawing", obj, "hist");
}).send();