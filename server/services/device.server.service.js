'use strict'

/**
 * Registers a new device's system information
 */
exports.registerDeviceInfo = async function(opts, callback) {
    if(!opts.info) return callback('Requires \'info\' as an opts parameter')

    console.log("Attempting to register a new device's system information...")
    console.log(opts.info)

    callback(null, true)
}