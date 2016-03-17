#!/bin/bash

PROJECT_DIR="$(dirname $(dirname $(readlink -nf $0)))"

JS_BEAUTIFY_CMD="node_modules/js-beautify/js/bin/js-beautify.js"
HTML_BEAUTIFY_CMD="node_modules/js-beautify/js/bin/js-beautify.js"
CSS_BEAUTIFY_CMD="node_modules/js-beautify/js/bin/js-beautify.js"

cd $PROJECT_DIR

MY_JS=$(find . -type f -name "*.js" -not -path "*public/vendor*" -not -path "*node_modules/*")
MY_HTML=$(find -name '*.html' -not -path "*public/vendor*" -not -path "*node_modules/*")
MY_CSS=$(find -name '*.css' -not -path "*public/vendor*" -not -path "*node_modules/*")

[ -d $PROJECT_DIR/node_modules ] || npm install

for f in $MY_JS;do
  $JS_BEAUTIFY_CMD -r $f
done

for f in $MY_HTML;do
  $HTML_BEAUTIFY_CMD -r $f
done

for f in $MY_CSS;do
  $CSS_BEAUTIFY_CMD -r $f
done
