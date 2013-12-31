CACHE MANIFEST
# Version ${version}
CACHE:
${createLink(controller:"mobile")}
${createLink(controller:"mobile", action:"synonyms")}

<g:each in="${0..maxcat}" var="i">${createLink(controller:"category", action:"get")}?id=${i}
</g:each>

<g:each in="${1..maxae}" var="i">
${createLink(controller:"adverseEvent", action:"get")}?id=${i}</g:each>

${resource(dir: 'images', file: 'logo_venturacare_small.png')}
${resource(dir: 'images', file: 'logo_venturacare.png')}
/CTCAExplore/static/bundle-bundle_lungo_head.css
/CTCAExplore/static/bundle-bundle_lungo_defer.js

FALLBACK:
${createLink(controller:"mobile", action:"online")} ${createLink(controller:"mobile", action:"offline")}

NETWORK:
*