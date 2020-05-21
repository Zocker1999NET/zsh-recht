function recht() {
    # Load configuration values
    local serverUrl="${ZSH_PLUGIN_RECHT_SERVER_URL:-https://www.gesetze-im-internet.de}"
    local docsDir="${ZSH_PLUGIN_RECHT_DOCS_DIR:-~/.zsh-recht-docs}";
    local docViewer="${ZSH_PLUGIN_RECHT_DOC_VIEWER:-xdg-open}";
    # Create output directory if not exists already
    mkdir --parents "$docsDir";
    # Load arguments
    local docName="$1";
    local docPartUrl="${1:l}/$1";
    if <<<"$1" grep "/" >/dev/null; then
        # Load argument as docPartUrl if it seems to be a path instead of a name
        docName="$(<<< "$1" grep --only-matching --perl-regexp '(?<=/)[^/]*$')";
        docPartUrl="$1";
    fi
    # Complain if name / path is not given
    if [ -z "$1" ]; then
        echo "Missing document name to open!" >/dev/stderr;
        return 1;
    fi
    # Generate local path and remote url
    local docPath="${docsDir}/${docName}.pdf";
    local docUrl="${serverUrl}/${docPartUrl}.pdf";
    # Download if local version not given
    if [ ! -e "$docPath" ]; then
        echo "Download document from gesetze-im-internet …";
        curl --fail --silent --output "$docPath" "$docUrl";
    fi
    # Try to open document
    if [ -e "$docPath" ]; then
        $docViewer "$docPath" >/dev/null 2>&1 &!;
    else
        echo "Document $1 not found" >/dev/stderr;
        return 1;
    fi
}
