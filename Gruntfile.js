module.exports = (grunt) => {

    const builder = require(`corifeus-builder`);
    const loader = new builder.loader(grunt);
    loader.js({
        replacer: {
            type: 'openwrt',
            npmio: false,
        },
    });

    grunt.registerTask('default', builder.config.task.build.js);

};

