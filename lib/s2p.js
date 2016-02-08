/**
 * Created by wupeng on 2015/7/23.
 * stream to promise
 */

var Promise = require('bluebird');

module.exports = function (stream) {
    return new Promise(function (resolve, reject) {
        if (stream === process.stdout || stream === process.stderr) {
            return resolve();
        }

        stream.on("error", function(streamErr) {
            var err = new Error(streamErr.message);
            err.source = stream;
            err.originalError = streamErr;
            reject(err);
        });

        // This event fires when no more data will be provided.
        stream.on("end", resolve);

        // Emitted when the underlying resource (for example, the backing file
        // descriptor) has been closed. Not all streams will emit this.
        stream.on("close", resolve);

        // When the end() method has been called, and all data has been flushed
        // to the underlying system, this event is emitted.
        stream.on("finish", resolve);
    });
};
