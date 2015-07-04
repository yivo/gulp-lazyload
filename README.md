# gulp-iife
This small gulp plugin speedups your gulp start time by requiring plugins only when they really are needed!

## Installation
```
npm install yivo/gulp-lazyload
```

## Usage
```js
var gulp     = require('gulp');
var lazyload = require('gulp-lazyload');

lazyload({
  concat:     'gulp-concat',
  coffee:     'gulp-coffee',
  preprocess: 'gulp-preprocess'
});

gulp.task('build', function() {
  gulp.src('index.coffee')
    .pipe(preprocess())       // preprocess lazy loaded!
    .pipe(coffee())           // coffee lazy loaded!
    .pipe(concat('index.js')) // concat lazy loaded!
    .pipe(gulp.dest('build'));

```