var gulp = require('gulp');

gulp.task('nw', function () {
    return gulp.src('./node-webkit/**/*')
        .pipe(gulp.dest('dist'));
});

gulp.task('release', ['nw'], function (done) {

    return gulp.src([
        './.ui/.editorconfig',
        './.ui/*',
        './app/bower/**/*',
        './app/js/**/*',
        './app/resources/**/*',
        './app/views/**/*.html',
        './app/*.html',
        './gruntBuildFolder/package.json',
        './debug.bat',
        './package.json',
        './release.md',
        './node.exe'
    ], { base: '.' })
        .pipe(gulp.dest('dist'));
});


gulp.task('watch', function () {
    //gulp.watch('./app/js/**/*.js', ['concatjs']);
});

