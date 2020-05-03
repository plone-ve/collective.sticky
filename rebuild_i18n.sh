#! /bin/sh

I18NDOMAIN="collective.sticky"
BASE_DIRECTORY="collective/sticky"
I18NDUDE="bin/i18ndude"

# Synchronise the templates and scripts with the .pot.
${I18NDUDE} rebuild-pot --pot ${BASE_DIRECTORY}/locales/${I18NDOMAIN}.pot \
    --merge ${BASE_DIRECTORY}/locales/manual.pot \
    --create ${I18NDOMAIN} \
    ${BASE_DIRECTORY}

${I18NDUDE} rebuild-pot \
    --pot ${BASE_DIRECTORY}/locales/plone.pot \
    --create plone \
    ${BASE_DIRECTORY}/profiles/

# Synchronise the resulting .pot with all .po files (Used for the workflows)
for po in ${BASE_DIRECTORY}/locales/*/LC_MESSAGES/${I18NDOMAIN}.po; do
    ${I18NDUDE} sync --pot ${BASE_DIRECTORY}/locales/${I18NDOMAIN}.pot $po
done

for po in ${BASE_DIRECTORY}/locales/*/LC_MESSAGES/plone.po; do
    ${I18NDUDE} sync --pot ${BASE_DIRECTORY}/locales/plone.pot $po
done

WARNINGS=`find . -name "*pt" | xargs i18ndude find-untranslated | grep -e '^-WARN' | wc -l`
ERRORS=`find . -name "*pt" | xargs i18ndude find-untranslated | grep -e '^-ERROR' | wc -l`
FATAL=`find . -name "*pt"  | xargs i18ndude find-untranslated | grep -e '^-FATAL' | wc -l`

echo
echo "There are $WARNINGS warnings \(possibly missing i18n markup\)"
echo "There are $ERRORS errors \(almost definitely missing i18n markup\)"
echo "There are $FATAL fatal errors \(template could not be parsed, eg. if it\'s not html\)"
echo "For more details, run \'find . -name \"\*pt\" \| xargs i18ndude find-untranslated\' or" 
echo "Look the rebuild i18n log generate for this script called \'rebuild_i18n.log\' on locales dir" 

rm ./rebuild_i18n.log
touch ./rebuild_i18n.log

# Report of errors and suspect untranslated messages
find ${BASE_DIRECTORY} -name "*pt" | xargs ${I18NDUDE} find-untranslated > ./rebuild_i18n.log
# Ok, now poedit is your friend!
