// Generated by CoffeeScript 1.7.1

var path = require('path');
var grunt = require('grunt');
var util = grunt.util;

var basedir = process.cwd();
var taskName = process.argv[2] || 'default';
var dest = process.argv[3];

var options = grunt.cli.options;
var tasks = [taskName];

options.gruntfile = path.join(basedir, 'Gruntfile.js');
options.verbose = true;

// Update options with passed-in options.
grunt.option.init(options);
grunt.option('force', true);

// Initialize tasks.
grunt.task.init(tasks);


var option = grunt.option;
var verbose = grunt.verbose;
var log = grunt.log;
var task = grunt.task;
var fail = grunt.fail;

// Display the grunt version and quit if the user did --version.
var _tasks, _options;

// Init colors.
log.initColors();

// A little header stuff.
verbose.header('Initializing').writeflags(option.flags(), 'Command-line options');

// Determine and output which tasks will be run.
var tasksSpecified = tasks && tasks.length > 0;
tasks = task.parseArgs([tasksSpecified ? tasks : 'default']);

// Initialize tasks.
task.init(tasks);

verbose.writeln();
if (!tasksSpecified) {
    verbose.writeln('No tasks specified, running default tasks.');
}
verbose.writeflags(tasks, 'Running tasks');

// Handle otherwise unhandleable (probably asynchronous) exceptions.
var uncaughtHandler = function(e) {
    fail.fatal(e, fail.code.TASK_FAILURE);
};
process.on('uncaughtException', uncaughtHandler);

// Report, etc when all tasks have completed.
task.options({
    error: function(e) {
        fail.warn(e, fail.code.TASK_FAILURE);
    },
    done: function() {
        // Stop handling uncaught exceptions so that we don't leave any
        // unwanted process-level side effects behind. There is no need to do
        // this in the error callback, because fail.warn() will either kill
        // the process, or with --force keep on going all the way here.
        process.removeListener('uncaughtException', uncaughtHandler);

        // Output a final fail / success report.
        fail.report();

        // if (done) {
        // 	// Execute "done" function when done (only if passed, of course).
        // 	done();
        // } else {
        // 	// Otherwise, explicitly exit.
        // 	util.exit(0);
        // }

        util.exit(0);
    }
});

process.chdir(dest);
// Execute all tasks, in order. Passing each task individually in a forEach
// allows the error callback to execute multiple times.
tasks.forEach(function(name) {
    task.run(name);
});
// Run tasks async internally to reduce call-stack, per:
// https://github.com/gruntjs/grunt/pull/1026
task.start({
    asyncDone: true
});

