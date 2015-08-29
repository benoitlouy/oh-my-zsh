alias angularjs='frontend angularjs'
alias aurajs='frontend aurajs'
alias bem='frontend bem'
alias bootsnipp='frontend bootsnipp'
alias caniuse='frontend caniuse'
alias codepen='frontend codepen'
alias compass='frontend compass'
alias cssflow='frontend cssflow'
alias dartlang='frontend dartlang'
alias emberjs='frontend emberjs'
alias fontello='frontend fontello'
alias html5please='frontend html5please'
alias jquery='frontend jquery'
alias lodash='frontend lodash'
alias mdn='frontend mdn'
alias npmjs='frontend npmjs'
alias qunit='frontend qunit'
alias reactjs='frontend reactjs'
alias smacss='frontend smacss'
alias stackoverflow='frontend stackoverflow'
alias unheap='frontend unheap'

function frontend() {
  emulate -L zsh

  # define search context URLS
  typeset -A urls
  urls=(
    angularjs      'https://google.com/search?as_sitesearch=angularjs.org&as_q='
    aurajs         'http://aurajs.com/api/#stq='
    bem            'https://google.com/search?as_sitesearch=bem.info&as_q='
    bootsnipp      'http://bootsnipp.com/search?q='
    caniuse        'http://caniuse.com/#search='
    codepen        'http://codepen.io/search?q='
    compass        'http://compass-style.org/search?q='
    cssflow        'http://www.cssflow.com/search?q='
    dartlang       'https://api.dartlang.org/apidocs/channels/stable/dartdoc-viewer/dart:'
    emberjs        'http://emberjs.com/api/#stp=1&stq='
    fontello       'http://fontello.com/#search='
    html5please    'http://html5please.com/#'
    jquery         'https://api.jquery.com/?s='
    lodash         'https://devdocs.io/lodash/index#'
    mdn            'https://developer.mozilla.org/search?q='
    npmjs          'https://www.npmjs.com/search?q='
    qunit          'https://api.qunitjs.com/?s='
    reactjs        'https://google.com/search?as_sitesearch=facebook.github.io/react&as_q='
    smacss         'https://google.com/search?as_sitesearch=smacss.com&as_q='
    stackoverflow  'http://stackoverflow.com/search?q='
    unheap         'http://www.unheap.com/?s='
  )

  # show help for command list
  if [[ $# -lt 2 ]]
  then
      print -P "Usage: frontend %Ucontext%u %Uterm%u [...%Umore%u] (or just: %Ucontext%u %Uterm%u [...%Umore%u])"
      print -P ""
      print -P "%Uterm%u and what follows is what will be searched for in the %Ucontext%u website,"
      print -P "and %Ucontext%u is one of the following:"
      print -P ""
      print -P "  angularjs, aurajs, bem, bootsnipp, caniuse, codepen, compass, cssflow,"
      print -P "  dartlang, emberjs, fontello, html5please, jquery, lodash, mdn, npmjs,"
      print -P "  qunit, reactjs, smacss, stackoverflow, unheap"
      print -P ""
      print -P "For example: frontend npmjs mocha (or just: npmjs mocha)."
      print -P ""
      return 1
  fi

  # check whether the search engine is supported
  if [[ ! $1 =~ '(jquery|mdn|compass|html5please|caniuse|aurajs|dartlang|qunit|fontello|bootsnipp|cssflow|codepen|unheap|bem|smacss|angularjs|reactjs|emberjs|stackoverflow|npmjs)' ]];
  then
    echo "Search valid search content $1 not supported."
    echo "Valid contents: (formats 'frontend <search-content>' or '<search-content>')"
    echo "* jquery"
    echo "* mdn"
    echo "* compass"
    echo "* html5please"
    echo "* caniuse"
    echo "* aurajs"
    echo "* dartlang"
    echo "* lodash"
    echo "* qunit"
    echo "* fontello"
    echo "* bootsnipp"
    echo "* cssflow"
    echo "* codepen"
    echo "* unheap"
    echo "* bem"
    echo "* smacss"
    echo "* angularjs"
    echo "* reactjs"
    echo "* emberjs"
    echo "* stackoverflow"
    echo "* npmjs"
    echo ""
    return 1
  fi

  # build search url:
  # join arguments passed with '+', then append to search context URL
  # TODO substitute for proper urlencode method
  url="${urls[$1]}${(j:+:)@[2,-1]}"

  case "$1" in
    "jquery")
      url="${url}api.jquery.com"
      url="${url}/?s=$2" ;;
    "mdn")
      url="${url}developer.mozilla.org"
      url="${url}/search?q=$2" ;;
    "compass")
      url="${url}compass-style.org"
      url="${url}/search?q=$2" ;;
    "html5please")
      url="${url}html5please.com"
      url="${url}/#$2" ;;
    "caniuse")
      url="${url}caniuse.com"
      url="${url}/#search=$2" ;;
    "aurajs")
      url="${url}aurajs.com"
      url="${url}/api/#stq=$2" ;;
    "dartlang")
      url="${url}api.dartlang.org/apidocs/channels/stable/dartdoc-viewer"
      url="${url}/dart-$2" ;;
    "qunit")
      url="${url}api.qunitjs.com"
      url="${url}/?s=$2" ;;
    "fontello")
      url="${url}fontello.com"
      url="${url}/#search=$2" ;;
    "bootsnipp")
      url="${url}bootsnipp.com"
      url="${url}/search?q=$2" ;;
    "cssflow")
      url="${url}cssflow.com"
      url="${url}/search?q=$2" ;;
    "codepen")
      url="${url}codepen.io"
      url="${url}/search?q=$2" ;;
    "unheap")
      url="${url}www.unheap.com"
      url="${url}/?s=$2" ;;
    "bem")
      url="${url}google.com"
      url="${url}/search?as_q=$2&as_sitesearch=bem.info" ;;
    "smacss")
      url="${url}google.com"
      url="${url}/search?as_q=$2&as_sitesearch=smacss.com" ;;
    "angularjs")
      url="${url}google.com"
      url="${url}/search?as_q=$2&as_sitesearch=angularjs.org" ;;
    "reactjs")
      url="${url}google.com"
      url="${url}/search?as_q=$2&as_sitesearch=facebook.github.io/react" ;;
    "emberjs")
      url="${url}emberjs.com"
      url="${url}/api/#stq=$2&stp=1" ;;
    "stackoverflow")
      url="${url}stackoverflow.com"
      url="${url}/search?q=$2" ;;
    "npmjs")
      url="${url}www.npmjs.com"
      url="${url}/search?q=$2" ;;
    *) echo "INVALID PARAM!"
       return ;;
  esac

  echo "$url"

  open_command "$url"
}
# javascript
alias jquery='frontend jquery'
alias mdn='frontend mdn'

# pre processors frameworks
alias compassdoc='frontend compass'

# important links
alias html5please='frontend html5please'
alias caniuse='frontend caniuse'

# components and libraries
alias aurajs='frontend aurajs'
alias dartlang='frontend dartlang'
alias lodash='frontend lodash'

#tests
alias qunit='frontend qunit'

#fonts
alias fontello='frontend fontello'

# snippets
alias bootsnipp='frontend bootsnipp'
alias cssflow='frontend cssflow'
alias codepen='frontend codepen'
alias unheap='frontend unheap'

# css architecture
alias bem='frontend bem'
alias smacss='frontend smacss'

# frameworks
alias angularjs='frontend angularjs'
alias reactjs='frontend reactjs'
alias emberjs='frontend emberjs'

# search websites
alias stackoverflow='frontend stackoverflow'
alias npmjs='frontend npmjs'
